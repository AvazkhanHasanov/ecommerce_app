import 'package:flutter/material.dart';
import '../../../core/utils/colors.dart';

import '../../../core/utils/styles.dart';

class GenderDropdown extends StatelessWidget {
  const GenderDropdown({super.key,required this.initialValue, required this.onChanged});
final String? initialValue;
final void Function(String?)?onChanged;
  @override
  Widget build(BuildContext context) {
    return  Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Gender', style: AppStyle.b1Medium),
        DropdownButtonFormField<String>(
          initialValue: initialValue,
          decoration: InputDecoration(
            hint: Padding(
              padding: EdgeInsets.only(bottom: 8),
              child: Text(
                "Select Your Gender",
                style: AppStyle.b1Regular.copyWith(color: AppColors.primary400),
              ),
            ),
            disabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(10)),
              borderSide: BorderSide(color: AppColors.primary900),
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(10)),
              borderSide: BorderSide(color: AppColors.primary900),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(10)),
              borderSide: BorderSide(color: AppColors.primary900),
            ),
          ),
          items: ["Male", "Female"].map((gender) {
            return DropdownMenuItem(value: gender, child: Text(gender));
          }).toList(),
          onChanged:onChanged
        ),
      ],
    );
  }
}
