import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:recipe_app/features/auth/pages/sign_up/sign_up_main_section.dart';
import 'package:recipe_app/features/auth/pages/sign_up/sign_up_sign_section.dart';

import '../../../../core/utils/styles.dart';

class SignUpView extends StatefulWidget {
  const SignUpView({super.key});

  @override
  State<SignUpView> createState() => _SignUpViewState();
}

class _SignUpViewState extends State<SignUpView> {
  final formKey = GlobalKey<FormState>();
  final TextEditingController name = TextEditingController();
  final TextEditingController email = TextEditingController();
  final TextEditingController phone = TextEditingController();
  final TextEditingController password = TextEditingController();
  String selected = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 90.h,
        centerTitle: true,
        title: Text("Sign Up", style: AppStyle.appbarTitle),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.only(left: 36.w, right: 36.w, top: 80.h),
        child: Column(
          spacing: 20.h,
          children: [
            Form(
              key: formKey,
              child: SignUpMainSection(
                name: name,
                email: email,
                password: password,
                phone: phone,
                onDateSelect: (String select) {
                  selected = select;
                },
              ),
            ),
            SignUpSignSection(
              callback: () {
                if (formKey.currentState!.validate() && selected.isNotEmpty) {
                }else if(selected.isEmpty){
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text("Tug'ilgan sanangizni kiriting.")),
                  );
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text("Ma'lumotlar to'liq emas!")),
                  );
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
