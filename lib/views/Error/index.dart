import 'package:flutter/material.dart';
import 'package:weather/Layout/default.dart';

class ErrorPage extends StatelessWidget {
  final String message;
  const ErrorPage({Key? key, required this.message}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultLayout(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text("Errore", style: Theme.of(context).textTheme.headline1),
          const SizedBox(height: 50),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 19.0),
            child: Text(
              message,
              style: Theme.of(context).textTheme.bodyLarge,
            ),
          ),
        ],
      ),
    );
  }
}
