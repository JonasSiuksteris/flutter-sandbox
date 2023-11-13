// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:sandboxnotes/constants/routes.dart';
import 'package:sandboxnotes/services/auth/auth_service.dart';

class VerifyEmailView extends StatefulWidget {
  const VerifyEmailView({super.key});

  @override
  State<VerifyEmailView> createState() => _VerifyEmailViewState();
}

class _VerifyEmailViewState extends State<VerifyEmailView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Verify email")),
      body: Column(children: [
        const Text(
            "Verification email has been sent. If you have not received it press the button below:"),
        TextButton(
            onPressed: () async {
              await AuthService.firebase().sendEmailVerification();
            },
            child: const Text("Send email verification")),
        TextButton(
          onPressed: () async {
            AuthService.firebase().logOut();
            Navigator.of(context).pushNamedAndRemoveUntil(
              registerRoute,
              (route) => false,
            );
          },
          child: const Text("Restart"),
        )
      ]),
    );
  }
}
