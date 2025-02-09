import 'package:auto_route/auto_route.dart';
import 'package:fake_yape_app/auth/pages/logged_access_page/logged_access_components.dart';
import 'package:fake_yape_app/shared/components.dart';
import 'package:fake_yape_app/shared/providers/qr_data_provider.dart';
import 'package:fake_yape_app/shared/style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';
import 'package:qr_flutter/qr_flutter.dart';

@RoutePage()
class LoggedAccessPage extends ConsumerWidget {
  const LoggedAccessPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final qRData = ref.watch(qRDataProvider);
    return qRData.when(
      data: (data) => LoggedAccess(qRData: data),
      error: (error, _) => const Scaffold(),
      loading: () => const AppStartupLoadingWidget(),
    );
  }
}

class LoggedAccess extends StatelessWidget {
  const LoggedAccess({
    super.key,
    required this.qRData,
  });
  final String? qRData;

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
          automaticallyImplyLeading: false,
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
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Gap(0),
            Center(
              child: Container(
                padding: const EdgeInsets.all(10),
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(
                    Radius.circular(10),
                  ),
                ),
                child: qRData != null
                    ? QrImageView(
                        size: 145,
                        data: qRData!,
                      )
                    : const Text("Hubo un error cargando el QR"),
              ),
            ),
            const Gap(20),
            Container(
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
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
          ],
        ),
      ),
    );
  }
}
