import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather/provider/ThemeProvider/index.dart';
import 'package:weather/utilities/ColorSchema/index.dart';

class RowWithDivider extends StatelessWidget {
  final List<Widget> children;
  const RowWithDivider({Key? key, required this.children}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        children[0],
        VerticalDivider(
          width: 20,
          thickness: 2,
          indent: 0,
          endIndent: 0,
          color: Provider.of<ThemeProvider>(context).isLightTheme
              ? ColorSchema.mulledWine
              : Colors.white,
        ),
        children[1],
      ],
    );
  }
}

// children.asMap().entries.map((e) 