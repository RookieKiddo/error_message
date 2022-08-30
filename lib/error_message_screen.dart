import "package:flutter/material.dart";

import 'custom_error_message.dart';

enum MessageType {
  error,
  warning,
  plain,
}

class ErrorMessages extends StatelessWidget {
  const ErrorMessages({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: CustomSnackBarContent(
                    errorText:
                        "This email is already in use by another patient",
                    messageType: MessageType.error.toString()),
                behavior: SnackBarBehavior.floating,
                backgroundColor: Colors.transparent,
                elevation: 0,
              ),
            );
          },
          child: const Text("Flutter default Snackbar is showing"),
        ),
      ),
    );
  }
}
