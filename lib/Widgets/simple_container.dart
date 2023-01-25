import 'package:flutter/material.dart';

class SimpleContainer extends StatelessWidget {
  const SimpleContainer(
      {super.key, required this.followChild, required this.Ccolor});
  final Widget followChild;
  final Color Ccolor;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: Ccolor,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: followChild,
      ),
    );
  }
}
