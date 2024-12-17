import 'package:auto_route/auto_route.dart';
import 'package:fake_yape_app/auth/repositories/supabase_auth_repository.dart';
import 'package:fake_yape_app/shared/style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:qr_flutter/qr_flutter.dart';

@RoutePage()
class MenuMyQrPage extends ConsumerWidget {
  const MenuMyQrPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final user = ref.read(supabaseAuthRepositoryProvider).getUser;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: mainColor,
        centerTitle: true,
        title: const Text(
          "Mi QR",
          style: TextStyle(
            color: Colors.white,
          ),
        ),
      ),
      body: Container(
        height: double.infinity,
        color: mainColor,
        child: Column(
          children: [
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 45.0),
              child: Text(
                "Muestra tu QR para recibir yapeos sin compartir tu número de celular.",
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 15,
                ),
              ),
            ),
            Expanded(
              child: Container(
                padding: const EdgeInsets.all(12.0),
                height: double.infinity,
                width: double.infinity,
                color: Colors.white,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                      width: double.infinity,
                      child: Card(
                        color: Colors.white,
                        child: Padding(
                          padding: const EdgeInsets.all(25.0),
                          child: Column(
                            children: [
                              QrImageView(
                                  size: 150,
                                  data:
                                      '{"phoneNumber":"+51${user!.userMetadata!['phoneNumber']}","userName":"${user.userMetadata!['fullName']}"}'),
                              Text(
                                user.userMetadata!['fullName'],
                                style: const TextStyle(
                                  color: mainColor,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: double.infinity,
                      child: TextButton(
                        style: const ButtonStyle(
                          backgroundColor:
                              WidgetStatePropertyAll(secondaryColor),
                        ),
                        onPressed: () {},
                        child: const Text(
                          "Comparte y descarga tu QR",
                          style: TextStyle(color: Colors.white),
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
