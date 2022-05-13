import 'package:flutter/material.dart';

class MyDivider extends StatelessWidget {
  const MyDivider({Key? key, this.dividerColor}) : super(key: key);
  final Color? dividerColor;

  const MyDivider.transparent({Key? key})
      : dividerColor = Colors.transparent,
        super(key: key);
  @override
  Widget build(BuildContext context) {
    final containerColor = dividerColor ?? Theme.of(context).dividerColor;
    return Container(
      height: 1,
      color: containerColor,
    );
  }
}
