import 'package:doctors_speciality/core/helpers/spacing.dart';
import 'package:flutter/material.dart';

import '../../../../core/widgets/app_text_form_field.dart';

class EmailAndPassword extends StatefulWidget {
  const EmailAndPassword({super.key});

  @override
  State<EmailAndPassword> createState() => _EmailAndPasswordState();
}

class _EmailAndPasswordState extends State<EmailAndPassword> {
  bool isObscureText = true;
  @override
  Widget build(BuildContext context) {
    return Form(
      child:  Column(
        children: [
          AppTextFormField(
                hintText: 'Email',
                
                // validator: (value) {
                //   if (value == null || value.isEmpty) {
                //     return 'Please enter a valid password';
                //   }
                // },
              ),
              verticalSpace(18),
              AppTextFormField(
                hintText: 'Password',
                isObscureText: isObscureText,
                suffixIcon: GestureDetector(
                  onTap: () {
                    setState(() {
                      isObscureText = !isObscureText;
                    });
                  },
                  child: Icon(
                    isObscureText ? Icons.visibility_off : Icons.visibility,
                  ),
                ),
                // validator: (value) {
                //   if (value == null || value.isEmpty) {
                //     return 'Please enter a valid password';
                //   }
                // },
              ),
        ],
      ),
      );
  }
}