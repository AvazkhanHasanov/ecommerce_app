import 'package:ecommerce_app/core/utils/colors.dart';
import 'package:ecommerce_app/core/utils/styles.dart';
import 'package:ecommerce_app/features/common/widgets/store_app_bar.dart';
import 'package:ecommerce_app/features/home/managers/home_state.dart';
import 'package:ecommerce_app/features/notification/managers/notification_cubit.dart';
import 'package:ecommerce_app/features/notification/managers/notification_state.dart';
import 'package:ecommerce_app/features/notification/widgets/notification_row.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class NotificationPage extends StatelessWidget {
  const NotificationPage({super.key});



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: StoreAppBar(
        needAction: false,
        title: 'Notification',
      ),
      body: BlocBuilder<NotificationCubit, NotificationState>(
        builder: (context, state) {
          if (state.status == Status.loading) {
            return Center(child: CircularProgressIndicator());
          }
          if (state.grouped.isEmpty) {
            return Center(child: Text('Bildirishnomalar yo‘q'));
          }
          return Padding(
            padding: EdgeInsets.symmetric(horizontal: 24.w),
            child: ListView(
              children: state.grouped.entries.map((e) {
                final title = e.key;
                final items = e.value;
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  spacing: 10.h,
                  children: [
                    Text(
                      title,
                      style: AppStyle.b1SemiBold,
                    ),
                    ...items.map(
                      (e) => Column(
                        spacing: 20.h,
                        children: [
                          NotificationRow(
                            title: e.title,
                            content: e.content,
                            icon: e.icon,
                          ),
                          Padding(
                            padding:  EdgeInsets.only(left: 40.w),
                            child: Divider(color: AppColors.primary100),
                          ),
                        ],
                      ),
                    ),
                    Divider(color: AppColors.primary100),
                  ],
                );
              }).toList(),
            ),
          );
        },
      ),
    );
  }
}
