import 'package:flutter/material.dart';
import 'package:weather/Layout/default.dart';

class LoadingPage extends StatelessWidget {
  const LoadingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultLayout(
      child: Scaffold(
        body: SizedBox(
          width: double.infinity,
          height: double.infinity,
          child: Stack(
            alignment: Alignment.center,
            children: [
              Text(
                'Weather',
                style: Theme.of(context).textTheme.headline1,
              ),
              Positioned(
                bottom: 25,
                child: Text(
                  'DigitalNext',
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
