import 'package:ecommerce_app/core/remote/local/prefs_manager.dart';
import 'package:ecommerce_app/core/widget/custom_elevated_button.dart';
import 'package:ecommerce_app/features/auth/presentation/viewmodels/signup_view_model/signu_view_model_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../core/DI/di.dart';
import '../../../../core/resources/assets_manager.dart';
import '../../../../core/resources/color_manager.dart';
import '../../../../core/resources/styles_manager.dart';
import '../../../../core/resources/values_manager.dart';
import '../../../../core/routes_manager/routes.dart';
import '../../../../core/widget/main_text_field.dart';
import '../../../../core/widget/validators.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  late TextEditingController nameController;
  late TextEditingController emailController;
  late TextEditingController phoneController;
  late TextEditingController passwordController;
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    nameController = TextEditingController();
    emailController = TextEditingController();
    phoneController = TextEditingController();
    passwordController = TextEditingController();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    nameController.dispose();
    emailController.dispose();
    phoneController.dispose();
    passwordController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt.get<SignupViewModelCubit>(),
      child: Scaffold(
        backgroundColor: ColorManager.primary,
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(AppPadding.p20),
            child: SingleChildScrollView(
              child: Form(
                key: formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: AppSize.s40.h,
                    ),
                    Center(child: SvgPicture.asset(SvgAssets.routeLogo)),
                    SizedBox(
                      height: AppSize.s40.h,
                    ),
                    BuildTextField(
                      controller: nameController,
                      backgroundColor: ColorManager.white,
                      hint: 'enter your full name',
                      label: 'Full Name',
                      textInputType: TextInputType.name,
                      validation: AppValidators.validateFullName,
                    ),
                    SizedBox(
                      height: AppSize.s18.h,
                    ),
                    BuildTextField(
                      controller: phoneController,
                      hint: 'enter your mobile no.',
                      backgroundColor: ColorManager.white,
                      label: 'Mobile Number',
                      validation: AppValidators.validatePhoneNumber,
                      textInputType: TextInputType.phone,
                    ),
                    SizedBox(
                      height: AppSize.s18.h,
                    ),
                    BuildTextField(
                      controller: emailController,
                      hint: 'enter your email address',
                      backgroundColor: ColorManager.white,
                      label: 'E-mail address',
                      validation: AppValidators.validateEmail,
                      textInputType: TextInputType.emailAddress,
                    ),
                    SizedBox(
                      height: AppSize.s18.h,
                    ),
                    BuildTextField(
                      controller: passwordController,
                      hint: 'enter your password',
                      backgroundColor: ColorManager.white,
                      label: 'password',
                      validation: AppValidators.validatePassword,
                      isObscured: true,
                      textInputType: TextInputType.text,
                    ),
                    SizedBox(
                      height: AppSize.s50.h,
                    ),
                    Center(
                      child: SizedBox(
                        height: AppSize.s60.h,
                        width: MediaQuery
                            .of(context)
                            .size
                            .width * .9,
                        child: BlocConsumer<
                            SignupViewModelCubit,
                            SignupViewModelState>(
                          listener: (context, state) {
                            if(state is SuccessState){
                              SnackBar snackBar = SnackBar(
                                  content: Text("Account created successfully")
                              );
                              ScaffoldMessenger.of(context).showSnackBar(snackBar);
                              PrefsManager.saveToken(state.signUpEntity.token!);
                              Navigator.pushReplacementNamed(context, Routes.mainRoute);
                            }
                            if(state is ErrorState){
                              SnackBar snackBar = SnackBar(
                                  content: Text(state.error)
                              );
                              ScaffoldMessenger.of(context).showSnackBar(snackBar);
                            }
                          },
                          builder: (context, state) {
                            return CustomElevatedButton(
                              // borderRadius: AppSize.s8,
                              isLoading:state is LoadingState,
                              label: 'Sign Up',
                              backgroundColor: ColorManager.white,
                              textStyle: getBoldStyle(
                                  color: ColorManager.primary,
                                  fontSize: AppSize.s20),
                              onTap: () {
                                if (formKey.currentState?.validate() ?? false) {
                                  BlocProvider
                                      .of<SignupViewModelCubit>(context)
                                      .signUp(
                                      name: nameController.text,
                                      phone: phoneController.text,
                                      email: emailController.text.trim(),
                                      password: passwordController.text,
                                      rePassword: passwordController.text);
                                }
                              },
                            );
                          },
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
