import 'dart:developer';

import 'package:auto_route/auto_route.dart';
import 'package:fake_yape_app/auth/pages/secure_keyboard_page/secure_keyboard_page.dart';
import 'package:fake_yape_app/shared/auto_router.gr.dart';
import 'package:flutter/material.dart';
import 'package:flutter_regex/flutter_regex.dart';
import 'package:gap/gap.dart';

class RegisterDataForm extends StatefulWidget {
  const RegisterDataForm({super.key, required this.phoneNumber});

  final String phoneNumber;
  @override
  State<RegisterDataForm> createState() => _RegisterDataFormState();
}

class _RegisterDataFormState extends State<RegisterDataForm> {
  final _formKey = GlobalKey<FormState>();
  String documentType = "1";
  String email = "";
  String documentNumber = "";
  String fullName = "";

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          SizedBox(
            width: double.infinity,
            child: DropdownMenu(
              menuStyle: const MenuStyle(
                backgroundColor: WidgetStatePropertyAll(Colors.white),
              ),
              initialSelection: "1",
              width: double.infinity,
              label: const Text("Tipo de documento"),
              onSelected: (value) {
                if (value != null) documentType = value;
                log(documentType.toString());
              },
              dropdownMenuEntries: const [
                DropdownMenuEntry(value: "1", label: "DNI"),
                DropdownMenuEntry(value: "2", label: "RUC"),
                DropdownMenuEntry(
                    value: "3", label: "CE - Carnet de extranjería"),
                DropdownMenuEntry(value: "4", label: "PAS - Pasaporte"),
              ],
            ),
          ),
          const Gap(30),
          TextFormField(
            onChanged: (value) {
              documentNumber = value;
              setState(() {});
            },
            validator: (value) =>
                value!.length < 8 ? 'Ingrese un documento válido' : null,
            decoration: const InputDecoration(
              label: Text("N° documento"),
            ),
          ),
          const Gap(30),
          TextFormField(
            decoration: const InputDecoration(
              label: Text("Correo electrónico"),
            ),
            validator: (value) => value!.isEmail(supportTopLevelDomain: true)
                ? null
                : 'Ingrese un correo electrónico válido',
            onChanged: (value) {
              email = value;
              setState(() {});
            },
          ),
          const Gap(30),
          TextFormField(
            decoration: const InputDecoration(
              label: Text("Nombres y apellidos"),
            ),
            validator: (value) =>
                value!.length >= 8 ? null : 'Ingrese su nombre completo',
            onChanged: (value) {
              fullName = value;
              setState(() {});
            },
          ),
          const Gap(30),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: _formKey.currentState != null &&
                      _formKey.currentState!.validate()
                  ? () {
                      final parameters = {
                        "phoneNumber": widget.phoneNumber,
                        "documentType": documentType,
                        "documentNumber": documentNumber,
                        "email": email,
                        "fullName": fullName,
                      };
                      AutoRouter.of(context).push(SecureKeyboardRoute(
                        parameters: parameters,
                        pageType: SecureKeyboardPageType.passwordPage,
                      ));
                    }
                  : null,
              child: const Text("CONTINUAR"),
            ),
          ),
        ],
      ),
    );
  }
}
