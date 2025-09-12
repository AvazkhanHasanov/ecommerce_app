import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class AuthIconButton extends StatelessWidget {
  const AuthIconButton({
    super.key,
    required this.onPressed,
    required this.padding,
    required this.icon,
    this.iconSize = 24,
  });

  final double iconSize;
  final VoidCallback onPressed;
  final EdgeInsetsGeometry padding;
  final String icon;

  @override
  Widget build(BuildContext _context) {
    return IconButton(
      onPressed: onPressed,
      style: IconButton.styleFrom(
        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
        padding: EdgeInsets.zero,
        iconSize: iconSize,
      ),
      icon: Padding(
        padding: padding,
        child: SvgPicture.asset(icon),
      ),
    );
  }
}
