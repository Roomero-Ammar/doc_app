import 'package:doctors_speciality/core/widgets/app_text_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/helpers/spacing.dart';
import '../../../core/theming/styles.dart';
import 'widgets/email_and_password.dart';
import 'widgets/terms_and_conditions_text.dart';
import 'widgets/dont_have_account_text.dart';


class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 30.w, vertical: 30.h),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Welcome Back',
                  style: TextStyles.font24BlueBold,
                ),
                verticalSpace(8),
                Text(
                  'We\'re excited to have you back, can\'t wait to see what you\'ve been up to since you last logged in.',
                  style: TextStyles.font14GrayRegular,
                ),
                verticalSpace(36),
                Form(
                  key: formKey,
                  child: Column(
                    children: [
                    
                     const EmailAndPassword(),
                      verticalSpace(24),
                      Align(
                        alignment: AlignmentDirectional.centerEnd,  // AlignmentDirectional : to specialize the direction of the alignment in Arabic and English
                        child: Text(
                          'Forgot Password?',
                          style: TextStyles.font13BlueRegular,
                        ),
                      ),
                      verticalSpace(40),
                      AppTextButton(
                        buttonText: "Login",
                        textStyle: TextStyles.font16WhiteSemiBold,
                        buttonHeight: 55,
                        onPressed: () {
                       //   validateThenDoLogin(context);
                        },
                      ),
                      verticalSpace(16),
                     const TermsAndConditionsText(),
                      verticalSpace(60),
                     const DontHaveAccountText(),
                   //   const LoginBlocListener(),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}