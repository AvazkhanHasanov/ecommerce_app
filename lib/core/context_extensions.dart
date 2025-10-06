import 'package:flutter/material.dart';

extension SizeExtension on num {
  Widget get height => SizedBox(height: toDouble());

  Widget get width => SizedBox(width: toDouble());// chunki this optional ekan yani this bolsa shunday o`qiydi bo`lsa this qo`shib o`qiydi
}
