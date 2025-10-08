import 'package:ecommerce_app/core/context_extensions.dart';
import 'package:ecommerce_app/core/routing/routes.dart';
import 'package:ecommerce_app/core/utils/colors.dart';
import 'package:ecommerce_app/core/utils/icons.dart';
import 'package:ecommerce_app/core/utils/styles.dart';
import 'package:ecommerce_app/features/address/managers/address_cubit.dart';
import 'package:ecommerce_app/features/address/managers/address_state.dart';
import 'package:ecommerce_app/features/address/widgets/address_container.dart';
import 'package:ecommerce_app/features/common/widgets/app_text_button.dart';
import 'package:ecommerce_app/features/common/widgets/app_text_button_with_row.dart';
import 'package:ecommerce_app/features/common/widgets/for_no_item.dart';
import 'package:ecommerce_app/features/common/widgets/store_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';

class AddressPage extends StatefulWidget {
  const AddressPage({super.key});

  @override
  State<AddressPage> createState() => _AddressPageState();
}

class _AddressPageState extends State<AddressPage> {
  int? selectedAddress;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: StoreAppBar(title: 'Address'),
      body: BlocProvider(
        create: (context) => AddressCubit(addressRepo: context.read()),
        child: BlocBuilder<AddressCubit, AddressState>(
          builder: (context, state) {
            return Padding(
              padding: EdgeInsets.symmetric(horizontal: 24.w),
              child: Column(
                children: [
                  state.address.isEmpty
                      ? RefreshIndicator(
                          onRefresh: () => context.read<AddressCubit>().fetchAddress(),
                          child: Padding(
                            padding: EdgeInsets.only(top: 110.h),
                            child: SingleChildScrollView(
                              physics: AlwaysScrollableScrollPhysics(),
                              child: Padding(
                                padding: EdgeInsets.only(top: MediaQuery.of(context).size.height / 20),
                                child: ForNoItem(
                                  text: 'No address has been added yet.',
                                  icon: AppIcons.locationsDuotone,
                                  subtext: ' If you want to add one, please click the “+Add New Address” button',
                                ),
                              ),
                            ),
                          ),
                        )
                      : RadioGroup<int>(
                          groupValue: selectedAddress,
                          onChanged: (value) {
                            setState(() {
                              selectedAddress = value;
                            });
                          },
                          child: Column(
                            spacing: 12.h,
                            children: [
                              ...List.generate(
                                state.address.length,
                                (index) => AddressContainer(
                                  title: state.address[index].title,
                                  fullAddress: state.address[index].fullAddress,
                                  groupRegistry: RadioGroup.maybeOf<int>(context),
                                  addressId: state.address[index].id,
                                ),
                              ),
                            ],
                          ),
                        ),
                  24.height,
                  AppTextButtonWithRow(
                    onPressed: () => context.push(Routes.newAddress),
                    backgroundColor: AppColors.primary0,
                    borderColor: AppColors.primary100,
                    children: [
                      SvgPicture.asset(AppIcons.plus),
                      Text('Add New Address', style: AppStyle.b1Medium),
                    ],
                  ),
                  state.address.length <= 5 ? Spacer() : 100.height,
                  AppTextButton(
                    backgroundColor: AppColors.primary900,
                    textColor: AppColors.primary0,
                    borderColor: AppColors.primary900,
                    text: 'Apply',
                    onPressed: () {},
                  ),
                  state.address.length <= 5 ? 30.height : SizedBox.shrink(),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
