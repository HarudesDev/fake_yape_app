import 'package:fake_yape_app/shared/style.dart';
import 'package:flutter/material.dart';

// ignore: non_constant_identifier_names
GlobalKey QRReaderContainerKey = GlobalKey();

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
