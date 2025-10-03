
import 'package:ecommerce_app/core/utils/colors.dart';
import 'package:ecommerce_app/core/utils/icons.dart';
import 'package:ecommerce_app/data/models/auth_update_model.dart';
import 'package:ecommerce_app/features/common/widgets/app_text_button.dart';
import 'package:ecommerce_app/features/common/widgets/app_text_form_field.dart';
import 'package:ecommerce_app/features/common/widgets/store_app_bar.dart';
import 'package:ecommerce_app/features/home/managers/home_state.dart';
import 'package:ecommerce_app/features/my_details/managers/my_detail_bloc.dart';
import 'package:ecommerce_app/features/my_details/managers/my_detail_state.dart';
import 'package:ecommerce_app/features/my_details/widgets/gender_dropdown.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_libphonenumber/flutter_libphonenumber.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';

class MyDetailPage extends StatefulWidget {
  const MyDetailPage({super.key});

  @override
  State<MyDetailPage> createState() => _MyDetailPageState();
}

class _MyDetailPageState extends State<MyDetailPage> {
  final fullNameController = TextEditingController();
  final emailController = TextEditingController();
  final dateController = TextEditingController();
  final genderController = TextEditingController();
  final numberController = TextEditingController();
  String? selectedGender;

  late LibPhonenumberTextFormatter? formatter;

  @override
  void dispose() {
    fullNameController.dispose();
    emailController.dispose();
    dateController.dispose();
    genderController.dispose();
    numberController.dispose();

    super.dispose();
  }

  @override
  void initState() {
    super.initState();

    final list = CountryManager().countries; // List<CountryWithPhoneCode>
    final uz = list.firstWhere((c) => c.countryCode == 'UZ');

    formatter = LibPhonenumberTextFormatter(
      country: uz,
      phoneNumberType: PhoneNumberType.mobile,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: StoreAppBar(title: 'My Details'),
      body: BlocProvider(
        create: (context) => MyDetailBloc(authRepo: context.read())..add(GetMe()),
        child: BlocConsumer<MyDetailBloc, MyDetailState>(
          listenWhen: (previous, current) => previous.me != current.me,
          listener: (context, state) {
            if (state.me != null) {
              fullNameController.text = state.me?.fullName ?? '';
              emailController.text = state.me?.email ?? '';
              dateController.text = state.me?.birthDate ?? '';
              numberController.text = state.me?.phoneNumber ?? '';
              genderController.text = state.me?.gender ?? '';
              setState(() {
                selectedGender = state.me!.gender;
              });
            }
          },
          builder: (context, state) {
            if (state.meStatus == Status.loading) {
              return Center(child: CircularProgressIndicator());
            }

            return Padding(
              padding: EdgeInsets.symmetric(horizontal: 24.w),
              child: SingleChildScrollView(
                child: Column(
                  spacing: 16.h,
                  children: [
                    AppTextFormField(controller: fullNameController, hintText: 'Full Name', label: 'Full Name'),
                    AppTextFormField(
                      controller: emailController,
                      hintText: 'cody.fisher45@example',
                      label: 'Email Address',
                    ),
                    AppTextFormField(
                      readOnly: true,
                      controller: dateController,
                      hintText: '01/01/2000',
                      label: 'Date of Birth',
                      keyboardType: TextInputType.datetime,
                      needIcon: true,
                      icon: AppIcons.calendar,
                      onTap: () async {
                        DateTime? pickedDate = await showDatePicker(
                          context: context,
                          initialDate: DateTime(2025),
                          firstDate: DateTime(1960),
                          lastDate: DateTime.now(),
                        );
                        if (pickedDate != null) {
                          dateController.text =
                              "${pickedDate.day.toString().padLeft(2, '0')}/"
                              "${pickedDate.month.toString().padLeft(2, '0')}/"
                              "${pickedDate.year}";
                        }
                      },
                    ),

                    GenderDropdown(
                      initialValue: selectedGender,
                      onChanged: (value) {
                        setState(() {
                          selectedGender = value;
                          genderController.text = value ?? '';
                        });
                      },
                    ),
                    AppTextFormField(
                      inputFormatter: formatter != null ? [formatter!] : [],
                      keyboardType: TextInputType.phone,
                      controller: numberController,
                      hintText: "enter your phone number",
                      label: 'Phone Number',
                    ),
                    SizedBox(height: 120.h),
                    AppTextButton(
                      isLoading: state.updateStatus == Status.loading,
                      text: 'Submit',
                      onPressed: () {
                        final rawDate = dateController.text.trim();
                        String? birthDate;
                        if (rawDate.isNotEmpty) {
                          try {
                            final parsed = DateFormat("dd/MM/yyyy").parseStrict(rawDate);
                            birthDate = DateFormat("yyyy-MM-dd").format(parsed);
                          } catch (e) {
                            birthDate = null;
                          }
                        }
                        final data = AuthUpdateModel(
                          fullName: fullNameController.text,
                          email: emailController.text,
                          phoneNumber: numberController.text,
                          gender: genderController.text,
                          birthDate: birthDate,
                        );
                        context.read<MyDetailBloc>().add(UpdateMe(updateModel: data));
                      },
                      textColor: AppColors.primary0,
                      backgroundColor: AppColors.primary900,
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
