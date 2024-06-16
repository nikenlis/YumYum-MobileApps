import 'package:flutter/material.dart';
import 'package:yumyum_amicta/shared/theme.dart';

class CustomBadge extends StatelessWidget {
  final Widget child;
  final String value;

 CustomBadge({
    required this.child,
    required this.value,
    super.key});

 
  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        child,
        Positioned(
          right: 5,
          top: 5,
          child: Container(
            padding: const EdgeInsets.all(2.0),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.0),
              color: purpleColor
            ),
            constraints: const BoxConstraints(
              minWidth: 20,
              minHeight: 20,
            ),
            child: Center(
              child: Text(
                value,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 12,
                  color: whiteColor,
                ),
              ),
            ),
          ),
        )
      ],
    );
  }
}