import 'package:fake_yape_app/auth/pages/welcome_page/welcome.dart';
import 'package:fake_yape_app/home/pages/home.dart';
import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

@RoutePage()
class Wrapper extends StatelessWidget {
  const Wrapper({super.key});

  @override
  Widget build(BuildContext context) {
    //Supabase.instance.client.auth.signOut();
    return Supabase.instance.client.auth.currentUser == null
        ? const WelcomePage()
        : const HomePage();
  }
}
