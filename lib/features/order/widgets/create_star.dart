import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../core/utils/icons.dart';
import '../../../core/utils/colors.dart';

class CreateStar extends StatefulWidget {
  const CreateStar({
    this.ratingChanging,
    super.key,
  });

  final void Function(int)? ratingChanging;

  @override
  State<CreateStar> createState() => _CreateStarState();
}

class _CreateStarState extends State<CreateStar> {
  int rating = 0;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      spacing: 6.w,
      children: [
        ...List.generate(
          5,
          (index) {
            final bool isFilled = index < rating;
            return GestureDetector(
              onTap: () {
                rating = index + 1;
                setState(() {});
                if (widget.ratingChanging != null) {
                  widget.ratingChanging!(rating);
                }
              },
              child: AnimatedScale(
                scale: isFilled ? 1.1 : 1.0,
                duration: const Duration(milliseconds: 100),
                child: SvgPicture.asset(
                  AppIcons.star,
                  width: 28.w,
                  height: 28.h,
                  colorFilter: ColorFilter.mode(
                    isFilled ? AppColors.gold : AppColors.primary400,
                    BlendMode.srcIn,
                  ),
                ),
              ),
            );
          },
        ),
      ],
    );
  }
}
