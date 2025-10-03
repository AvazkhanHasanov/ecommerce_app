import 'package:ecommerce_app/core/utils/colors.dart';
import 'package:ecommerce_app/core/utils/styles.dart';
import 'package:ecommerce_app/features/common/widgets/store_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

class AccountNotificationPage extends StatefulWidget {
  const AccountNotificationPage({super.key});

  @override
  State<AccountNotificationPage> createState() => _AccountNotificationPageState();
}

class _AccountNotificationPageState extends State<AccountNotificationPage> {
  late Box box;

  bool generalNotification = false;
  bool sound = false;
  bool vibrate = false;

  @override
  void initState() {
    super.initState();
    box = Hive.box('settings');
    generalNotification = box.get('notification', defaultValue: false);
    sound = box.get('sound', defaultValue: false);
    vibrate = box.get('vibrate', defaultValue: false);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: StoreAppBar(title: 'Notification'),
      body: Column(
        children: [
          SwitchListTile(
            activeTrackColor: AppColors.primary900,
            inactiveTrackColor: AppColors.primary100,
            inactiveThumbColor: AppColors.primary0,
            trackOutlineColor: WidgetStateColor.resolveWith(
              (states) {
                if (states.contains(WidgetState.selected)) {
                  return AppColors.primary900;
                }
                return AppColors.primary100;
              },
            ),
            title: Text('General Notification', style: AppStyle.b1Medium),
            value: generalNotification,
            onChanged: (value) {
              setState(() {
                generalNotification = value;
              });
              box.put('notification', value);
            },
          ),
          SwitchListTile(
            activeTrackColor: AppColors.primary900,
            inactiveTrackColor: AppColors.primary100,
            inactiveThumbColor: AppColors.primary0,
            trackOutlineColor: WidgetStateColor.resolveWith(
              (states) {
                if (states.contains(WidgetState.selected)) {
                  return AppColors.primary900;
                }
                return AppColors.primary100;
              },
            ),
            title: Text('Sound', style: AppStyle.b1Medium),
            value: sound,
            onChanged: (value) {
              setState(() {
                sound = value;
              });
              box.put('sound', value);
            },
          ),
          SwitchListTile(
            activeTrackColor: AppColors.primary900,
            inactiveTrackColor: AppColors.primary100,
            inactiveThumbColor: AppColors.primary0,
            trackOutlineColor: WidgetStateColor.resolveWith(
              (states) {if (states.contains(WidgetState.selected)) {
                  return AppColors.primary900;
                }
                return AppColors.primary100;
              },
            ),
            title: Text('Vibrate', style: AppStyle.b1Medium),
            value: vibrate,
            onChanged: (value) {
              setState(() {
                vibrate = value;
              });
              box.put('vibrate ', value);
            },
          ),
        ],
      ),
    );
  }
}
