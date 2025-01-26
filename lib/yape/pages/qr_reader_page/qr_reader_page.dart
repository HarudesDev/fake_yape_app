import 'dart:convert';
import 'dart:developer';

import 'package:auto_route/auto_route.dart';
import 'package:fake_yape_app/shared/auto_router.gr.dart';
import 'package:fake_yape_app/shared/services/yape_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_contacts/flutter_contacts.dart';
import 'package:google_mlkit_barcode_scanning/google_mlkit_barcode_scanning.dart';

import 'camera_view.dart';
import 'qr_reader_components.dart';

@RoutePage()
class QrReaderPage extends StatefulWidget {
  const QrReaderPage({super.key, required this.yapeService});

  final YapeService yapeService;

  @override
  State<QrReaderPage> createState() => _QrReaderPageState();
}

class _QrReaderPageState extends State<QrReaderPage> {
  final BarcodeScanner _barcodeScanner =
      BarcodeScanner(formats: [BarcodeFormat.qrCode]);
  final bool _canProcess = true;
  bool _isBusy = false;

  @override
  Widget build(BuildContext context) {
    return CameraView(
      onImage: _processImage,
    );
  }

  Future<void> _processImage(InputImage inputImage) async {
    if (!_canProcess) return;
    if (_isBusy) return;
    if (!mounted) return;
    _isBusy = true;

    //TODO esto por las huevas, Image picker
    final barcodes = await _barcodeScanner.processImage(inputImage);
    if (inputImage.metadata?.size != null) {
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
        final containerBoxPoints = YapeService().getContainerBoxPoints(
            containerOffset, xAxisMultiplier, yAxisMultiplier);
        if (barcodes.isNotEmpty) {
          for (final barcode in barcodes) {
            // dev.log(barcode.rawValue!);
            var isInsideTheBox = true;
            barcode.cornerPoints.asMap().forEach((index, point) {
              if (point.distanceTo(containerBoxPoints[index]) > 150) {
                isInsideTheBox = false;
              }
            });
            if (isInsideTheBox && mounted && barcode.rawValue != null) {
              log(barcode.rawValue!);
              if (barcode.rawValue != null) {
                Map<String, dynamic>? qrValue;
                try {
                  qrValue =
                      jsonDecode(barcode.rawValue!) as Map<String, dynamic>;
                } catch (e) {
                  log(e.toString());
                }
                if (qrValue != null &&
                    qrValue.containsKey('phoneNumber') &&
                    qrValue.containsKey('userName')) {
                  final qrContact = Contact(
                    phones: [
                      Phone(
                        qrValue['phoneNumber'],
                        normalizedNumber: qrValue['phoneNumber'],
                      )
                    ],
                    displayName: qrValue['userName'],
                  );
                  log(qrContact.toString());
                  if (AutoRouter.of(context).stack.length == 2) {
                    AutoRouter.of(context)
                        .push(MakeYapeRoute(contact: qrContact));
                  }
                }
              }
            }
          }
        }
      }
    }
    _isBusy = false;
  }

  @override
  void dispose() {
    _barcodeScanner.close();
    super.dispose();
  }
}
