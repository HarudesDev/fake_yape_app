import 'dart:developer' as dev;
import 'dart:io';
import 'dart:math';

import 'package:auto_route/auto_route.dart';
import 'package:fake_yape_app/shared/auto_router.gr.dart';
import 'package:flutter/material.dart';
import 'package:camera/camera.dart';
import 'package:google_mlkit_barcode_scanning/google_mlkit_barcode_scanning.dart';
import 'package:flutter/services.dart';
import 'package:fake_yape_app/shared/style.dart';

// ignore: non_constant_identifier_names
GlobalKey QRReaderContainerKey = GlobalKey();
GlobalKey coloredBoxKey = GlobalKey();

@RoutePage()
class QrReaderPage extends StatefulWidget {
  const QrReaderPage({super.key});

  @override
  State<QrReaderPage> createState() => _QrReaderPageState();
}

class _QrReaderPageState extends State<QrReaderPage> {
  final BarcodeScanner _barcodeScanner =
      BarcodeScanner(formats: [BarcodeFormat.qrCode]);
  final bool _canProcess = true;
  bool _isBusy = false;
  var _cameraLensDirection = CameraLensDirection.back;

  @override
  Widget build(BuildContext context) {
    return CameraView(
      onCameraLensDirectionChanged: (direction) =>
          _cameraLensDirection = direction,
      onImage: _processImage,
    );
  }

  Future<void> _processImage(InputImage inputImage) async {
    if (!_canProcess) return;
    if (_isBusy) return;
    if (!context.mounted) return;
    _isBusy = true;

    //TODO esto por las huevas, Image picker
    setState(() {});
    final barcodes = await _barcodeScanner.processImage(inputImage);
    if (inputImage.metadata?.size != null &&
        inputImage.metadata?.rotation != null) {
      final coloredBoxBounds =
          coloredBoxKey.currentContext!.findRenderObject()!.paintBounds;
      final renderBox =
          QRReaderContainerKey.currentContext?.findRenderObject() as RenderBox;
      final containerOffset = renderBox.localToGlobal(Offset.zero);
      final yAxisMultiplier =
          inputImage.metadata!.size.width / coloredBoxBounds.bottom;
      final xAxisMultiplier =
          inputImage.metadata!.size.height / coloredBoxBounds.right;
      final containerBoxPoints = <Point<int>>[
        Point<int>(
          (containerOffset.dx * xAxisMultiplier).toInt(),
          (containerOffset.dy * yAxisMultiplier).toInt(),
        ),
        Point<int>(
          ((containerOffset.dx + 200) * xAxisMultiplier).toInt(),
          (containerOffset.dy * yAxisMultiplier).toInt(),
        ),
        Point<int>(
          ((containerOffset.dx + 200) * xAxisMultiplier).toInt(),
          ((containerOffset.dy + 200) * yAxisMultiplier).toInt(),
        ),
        Point<int>(
          (containerOffset.dx * xAxisMultiplier).toInt(),
          ((containerOffset.dy + 200) * yAxisMultiplier).toInt(),
        ),
      ];
      if (barcodes.isNotEmpty) {
        for (final barcode in barcodes) {
          // dev.log(barcode.rawValue!);
          var isInsideTheBox = true;
          barcode.cornerPoints.asMap().forEach((index, point) {
            if (point.distanceTo(containerBoxPoints[index]) > 50) {
              isInsideTheBox = false;
            }
          });
          if (isInsideTheBox && mounted) {
            AutoRouter.of(context).push(const MakeYapeRoute());
          }
        }
      }
    }
    _isBusy = false;
    if (mounted) {
      setState(() {});
    }
  }

  @override
  void dispose() {
    _barcodeScanner.close();
    super.dispose();
  }
}

//TODO Implement CameraView
class CameraView extends StatefulWidget {
  const CameraView({
    super.key,
    required this.onImage,
    this.onCameraLensDirectionChanged,
  });

  final Function(InputImage inputImage) onImage;
  final Function(CameraLensDirection direction)? onCameraLensDirectionChanged;

  @override
  State<CameraView> createState() => _CameraViewState();
}

class _CameraViewState extends State<CameraView> {
  static List<CameraDescription> _cameras = [];
  CameraController? _controller;
  int _cameraIndex = -1;

  bool flash = false;

  @override
  void initState() {
    super.initState();

    _initialize();
  }

  void _initialize() async {
    if (_cameras.isEmpty) {
      //TODO puede fallar
      _cameras = await availableCameras();
    }
    for (var i = 0; i < _cameras.length; i++) {
      if (_cameras[i].lensDirection == CameraLensDirection.back) {
        _cameraIndex = i;
        break;
      }
    }
    if (_cameraIndex != -1) {
      _startLiveFeed();
    }
  }

  Future _startLiveFeed() async {
    final camera = _cameras[_cameraIndex];
    _controller = CameraController(
      camera,
      // Set to ResolutionPreset.high. Do NOT set it to ResolutionPreset.max because for some phones does NOT work.
      ResolutionPreset.high,
      enableAudio: false,
      imageFormatGroup: Platform.isAndroid
          ? ImageFormatGroup.nv21
          : ImageFormatGroup.bgra8888,
    );
    //TODO puede fallar
    _controller?.initialize().then((_) {
      if (!mounted) {
        return;
      }
      _controller?.startImageStream(_processCameraImage).then((value) {
        if (widget.onCameraLensDirectionChanged != null) {
          widget.onCameraLensDirectionChanged!(camera.lensDirection);
        }
      });
      setState(() {});
    });
  }

  void _processCameraImage(CameraImage image) {
    final inputImage = _inputImageFromCameraImage(image);
    if (inputImage == null) return;
    widget.onImage(inputImage);
  }

  final _orientations = {
    DeviceOrientation.portraitUp: 0,
    DeviceOrientation.landscapeLeft: 90,
    DeviceOrientation.portraitDown: 180,
    DeviceOrientation.landscapeRight: 270,
  };

  InputImage? _inputImageFromCameraImage(CameraImage image) {
    if (_controller == null) return null;

    // get image rotation
    // it is used in android to convert the InputImage from Dart to Java: https://github.com/flutter-ml/google_ml_kit_flutter/blob/master/packages/google_mlkit_commons/android/src/main/java/com/google_mlkit_commons/InputImageConverter.java
    // `rotation` is not used in iOS to convert the InputImage from Dart to Obj-C: https://github.com/flutter-ml/google_ml_kit_flutter/blob/master/packages/google_mlkit_commons/ios/Classes/MLKVisionImage%2BFlutterPlugin.m
    // in both platforms `rotation` and `camera.lensDirection` can be used to compensate `x` and `y` coordinates on a canvas: https://github.com/flutter-ml/google_ml_kit_flutter/blob/master/packages/example/lib/vision_detector_views/painters/coordinates_translator.dart
    final camera = _cameras[_cameraIndex];
    final sensorOrientation = camera.sensorOrientation;
    // print(
    //     'lensDirection: ${camera.lensDirection}, sensorOrientation: $sensorOrientation, ${_controller?.value.deviceOrientation} ${_controller?.value.lockedCaptureOrientation} ${_controller?.value.isCaptureOrientationLocked}');
    InputImageRotation? rotation;
    if (Platform.isIOS) {
      rotation = InputImageRotationValue.fromRawValue(sensorOrientation);
    } else if (Platform.isAndroid) {
      var rotationCompensation =
          _orientations[_controller!.value.deviceOrientation];
      if (rotationCompensation == null) return null;
      if (camera.lensDirection == CameraLensDirection.front) {
        // front-facing
        rotationCompensation = (sensorOrientation + rotationCompensation) % 360;
      } else {
        // back-facing
        rotationCompensation =
            (sensorOrientation - rotationCompensation + 360) % 360;
      }
      rotation = InputImageRotationValue.fromRawValue(rotationCompensation);
      // print('rotationCompensation: $rotationCompensation');
    }
    if (rotation == null) return null;
    // print('final rotation: $rotation');

    // get image format
    final format = InputImageFormatValue.fromRawValue(image.format.raw);
    // validate format depending on platform
    // only supported formats:
    // * nv21 for Android
    // * bgra8888 for iOS
    if (format == null ||
        (Platform.isAndroid && format != InputImageFormat.nv21) ||
        (Platform.isIOS && format != InputImageFormat.bgra8888)) return null;

    // since format is constraint to nv21 or bgra8888, both only have one plane
    if (image.planes.length != 1) return null;
    final plane = image.planes.first;

    // compose InputImage using bytes
    return InputImage.fromBytes(
      bytes: plane.bytes,
      metadata: InputImageMetadata(
        size: Size(image.width.toDouble(), image.height.toDouble()),
        rotation: rotation, // used only in Android
        format: format, // used only in iOS
        bytesPerRow: plane.bytesPerRow, // used only in iOS
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    if (_cameras.isEmpty) return Container();
    if (_controller == null) return Container();
    if (_controller?.value.isInitialized == false) return Container();
    return Scaffold(
      body: ColoredBox(
        key: coloredBoxKey,
        color: Colors.black,
        child: Stack(
          fit: StackFit.expand,
          children: [
            CameraPreview(_controller!),
            const QRReaderDetectionArea(),
            const UploadQRImageButton(),
            FlashLightButton(
              onPressed: () {
                flash
                    ? _controller!.setFlashMode(FlashMode.off)
                    : _controller!.setFlashMode(FlashMode.torch);
                setState(() {
                  flash = !flash;
                });
              },
              text: flash ? "Apagar linterna" : "Encender linterna",
            ),
            QrReaderCloseButton(
              onPressed: () {
                AutoRouter.of(context).back();
              },
            ),
          ],
        ),
      ),
    );
  }
}

class QRReaderDetectionArea extends StatelessWidget {
  const QRReaderDetectionArea({super.key});

  @override
  Widget build(BuildContext context) {
    return Positioned(
      left: 0,
      right: 0,
      top: 250,
      child: Column(
        children: [
          Container(
            key: QRReaderContainerKey,
            width: 200,
            height: 200,
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.2),
              borderRadius: const BorderRadius.all(
                Radius.circular(20),
              ),
              border: Border.all(
                color: Colors.white,
                width: 0.5,
              ),
            ),
          ),
          const Text(
            "Escanea un QR con tu cámara",
            style: TextStyle(color: Colors.white),
          ),
        ],
      ),
    );
  }
}

class FlashLightButton extends StatelessWidget {
  const FlashLightButton({super.key, this.onPressed, required this.text});

  final Function()? onPressed;

  final String text;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: 150,
      left: 8,
      right: 8,
      child: Center(
        child: SizedBox(
          width: 200,
          child: OutlinedButton(
            onPressed: onPressed,
            style: ButtonStyle(
              shape: getRoundedRectangleBorder(10),
              side: const WidgetStatePropertyAll(
                BorderSide(color: Colors.transparent),
              ),
              backgroundColor: WidgetStatePropertyAll(
                Colors.white.withOpacity(0.2),
              ),
            ),
            child: Text(
              text,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 17,
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class UploadQRImageButton extends StatelessWidget {
  const UploadQRImageButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: 20,
      left: 15,
      right: 15,
      child: SizedBox(
        height: 80,
        child: OutlinedButton.icon(
          onPressed: () {},
          icon: const Icon(Icons.image),
          label: const Text(
            "Subir una imagen con QR",
            style: TextStyle(color: Colors.black),
          ),
          style: ButtonStyle(
            shape: getRoundedRectangleBorder(10),
            backgroundColor: const WidgetStatePropertyAll(Colors.white),
          ),
        ),
      ),
    );
  }
}

class QrReaderCloseButton extends StatelessWidget {
  const QrReaderCloseButton({super.key, this.onPressed});

  final Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 20,
      right: 20,
      child: IconButton(
        onPressed: onPressed,
        icon: const Icon(
          Icons.close,
          color: Colors.white,
          size: 35,
        ),
      ),
    );
  }
}
