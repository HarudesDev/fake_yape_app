import 'dart:convert';
import 'dart:developer' as dev;
import 'dart:io';
import 'dart:math';

import 'package:auto_route/auto_route.dart';
import 'package:fake_yape_app/shared/auto_router.gr.dart';
import 'package:flutter/material.dart';
import 'package:camera/camera.dart';
import 'package:flutter_contacts/flutter_contacts.dart';
import 'package:google_mlkit_barcode_scanning/google_mlkit_barcode_scanning.dart';
import 'package:flutter/services.dart';
import 'package:fake_yape_app/shared/style.dart';

import 'camera_view.dart';
import 'qr_reader_components.dart';

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
    if (!mounted) return;
    _isBusy = true;

    //TODO esto por las huevas, Image picker
    setState(() {});
    final barcodes = await _barcodeScanner.processImage(inputImage);
    if (inputImage.metadata?.size != null &&
        inputImage.metadata?.rotation != null) {
      if (mounted) {
        final coloredBoxBounds =
            coloredBoxKey.currentContext!.findRenderObject()!.paintBounds;
        final renderBox = QRReaderContainerKey.currentContext
            ?.findRenderObject() as RenderBox;
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
            if (isInsideTheBox && mounted && barcode.rawValue != null) {
              //TODO implement qr redirection
              dev.log(barcode.rawValue!);
              final qrValue =
                  jsonDecode(barcode.rawValue!) as Map<String, dynamic>;
              final qrContact = Contact(
                phones: [
                  Phone(
                    qrValue['phoneNumber'],
                    normalizedNumber: qrValue['phoneNumber'],
                  )
                ],
                displayName: qrValue['userName'],
              );
              print(qrContact);
              if (AutoRouter.of(context).stack.length == 2) {
                AutoRouter.of(context).push(MakeYapeRoute(contact: qrContact));
              }
            }
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
