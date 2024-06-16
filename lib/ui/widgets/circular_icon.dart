import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:yumyum_amicta/shared/theme.dart';

class CustomCircularIcon extends StatelessWidget {
  final IconData icon;
  final double size;
  const CustomCircularIcon({required this.icon, this.size = 20, super.key});

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: size,
      backgroundColor: purpleColor,
      child: Material(
        color: Colors.transparent,
        shape: const CircleBorder(),
        clipBehavior: Clip.hardEdge,
        child: InkWell(
          onTap: () {},
          splashColor: greyColor,
          child: Container(
            alignment: Alignment.center,
            child: Icon(
              icon,
              color: whiteColor,
              size: size,
            ),
          ),
        ),
      ),
    );
  }
}
