import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hive/hive.dart';

import '../../../core/utils/colors.dart';
import '../../../core/utils/icons.dart';
import '../../../core/utils/styles.dart';
import '../../common/widgets/app_icon_button.dart';

class ResentSearchView extends StatefulWidget {
  const ResentSearchView({required this.searchBox, super.key});

  final Box<String> searchBox;

  @override
  State<ResentSearchView> createState() => _ResentSearchViewState();
}

class _ResentSearchViewState extends State<ResentSearchView> {
  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 20.h,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('Recent Searches', style: AppStyle.h4SemiBold),
            GestureDetector(
              onTap: () {
                widget.searchBox.clear();
                setState(() {});
              },
              child: Text(
                'Clear all',
                style: AppStyle.b2Medium.copyWith(decoration: TextDecoration.underline),
              ),
            ),
          ],
        ),
        Column(
          spacing: 12.h,
          children: [
            ...List.generate(
              widget.searchBox.values.length,
              (index) => Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(widget.searchBox.values.elementAt(index), style: AppStyle.b1Regular),
                      AppIconButton(
                        foregroundColor: AppColors.primary400,
                        size: Size(24.r, 24.r),
                        icon: AppIcons.cancelCircle,
                        onPressed: () async {
                          await widget.searchBox.deleteAt(index);
                          setState(() {});
                        },
                      ),
                    ],
                  ),
                  if (index != widget.searchBox.values.length - 1) const Divider(color: AppColors.primary100),
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }
}
