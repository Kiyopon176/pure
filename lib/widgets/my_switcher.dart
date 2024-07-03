import 'package:flutter/material.dart';

class MySwitcher extends StatelessWidget {
  const MySwitcher({super.key});

  @override
  Widget build(BuildContext context) {
    return AnimatedAlign(
      alignment: Alignment.centerLeft,
      duration: Duration(milliseconds: 300),
      curve: Curves.decelerate,
      child: Padding(
        padding: EdgeInsets.only(left: 5, right: 5),
        child: Container(
          height: 30,
          width: 30,
        ),
      ),
    );
  }
}
