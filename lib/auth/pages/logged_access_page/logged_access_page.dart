import 'package:auto_route/auto_route.dart';
import 'package:fake_yape_app/auth/pages/logged_access_page/logged_access_components.dart';
import 'package:fake_yape_app/shared/style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:gap/gap.dart';
import 'package:qr_flutter/qr_flutter.dart';

@RoutePage()
class LoggedAccessPage extends StatelessWidget {
  const LoggedAccessPage({super.key});

  static const storage = FlutterSecureStorage();

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [
            mainColor,
            mainColorDark,
            mainColorDark,
          ],
          begin: Alignment.topCenter,
          end: Alignment.center,
        ),
      ),
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          actions: [
            ElevatedButton.icon(
              onPressed: () {},
              label: const Text("Ayuda"),
              icon: const Icon(Icons.headset_mic_outlined),
              style: const ButtonStyle(
                backgroundColor: WidgetStatePropertyAll(mainColorLight),
                foregroundColor: WidgetStatePropertyAll(Colors.white),
              ),
            ),
          ],
        ),
        backgroundColor: Colors.transparent,
        body: Column(
          children: [
            const Gap(50),
            Center(
              child: Container(
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(
                    Radius.circular(10),
                  ),
                ),
                child: FutureBuilder<String?>(
                  future: storage.read(key: "QRData"),
                  builder:
                      (BuildContext context, AsyncSnapshot<String?> snapshot) =>
                          snapshot.data != null
                              ? QrImageView(
                                  size: 165,
                                  data: snapshot.data!,
                                )
                              : const Text("Hubo un error cargando el QR"),
                ),
              ),
            ),
            const Gap(70),
            Expanded(
              child: Container(
                height: double.infinity,
                width: double.infinity,
                padding: const EdgeInsets.symmetric(
                  vertical: 40,
                  horizontal: 20,
                ),
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20),
                  ),
                ),
                child: Column(
                  children: [
                    const LoggedSecureKeyboard(),
                    TextButton(
                      onPressed: () {},
                      style: const ButtonStyle(
                        foregroundColor: WidgetStatePropertyAll(secondaryColor),
                      ),
                      child: const Text(
                        "¿Olvidaste tu clave?",
                        style: TextStyle(
                          fontSize: 18,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
