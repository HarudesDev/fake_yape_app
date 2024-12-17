import 'package:fake_yape_app/shared/style.dart';
import 'package:flutter/material.dart';

class MakeYapeTab extends StatelessWidget {
  const MakeYapeTab({super.key, required this.tabText});

  final String tabText;

  @override
  Widget build(BuildContext context) {
    return Tab(
      child: SizedBox(
        width: double.infinity,
        child: Center(
          child: Text(
            tabText,
            style: const TextStyle(
              color: mainColor,
            ),
          ),
        ),
      ),
    );
  }
}
