import 'package:flutter/material.dart';
import 'package:test_internship_enlab/common/widget/button/main_button.dart';
import 'package:test_internship_enlab/common/widget/textfield/main_textfield.dart';
import 'package:test_internship_enlab/module/home/home_page.dart';
import 'package:test_internship_enlab/themes/app_colors.dart';
import 'package:test_internship_enlab/themes/app_dimension.dart';
import 'package:test_internship_enlab/themes/styles_text.dart';
import 'package:test_internship_enlab/utils/app_images.dart';
import 'package:test_internship_enlab/utils/validators.dart';
class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  var phoneController = TextEditingController();
  var passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  var isCheckedBox = ValueNotifier(false);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            width: 1.sw,
            height: 1.sh,
            padding: EdgeInsets.all(20.r),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _widgetTop(),
                _widgetBody(),
                _widgetBottom(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _widgetTop() {
    return Container(
      width: 200.r,
      height: 200.r,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(AssetPNG.logo,),
          fit: BoxFit.cover
        )
      ),
    );
  }

  Widget _widgetBody() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        _widgetForm(),
        _widgetOtherLogin(),
      ],
    );
  }

  Widget _widgetForm() {
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Đăng nhập",
            style: StylesText.header1,
          ),
          SizedBox(
            height: 30.h,
          ),
          _widgetPhoneField(),
          SizedBox(
            height: 20.h,
          ),
          _widgetPasswordField(),
          SizedBox(
            height: 10.h,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  ValueListenableBuilder(
                    valueListenable: isCheckedBox,
                    builder: (context, value, child) {
                      return Checkbox(
                        value: value,
                        onChanged: (bool? value) {
                          isCheckedBox.value = value ?? false;
                        },
                        splashRadius: 5.r,
                        activeColor: AppColors.accent1,
                        focusColor: AppColors.accent1,
                      );
                    },
                  ),
                  Text("Ghi nhớ tài khoản", style: StylesText.body3),
                ],
              ),
              Text(
                "Quên mật khẩu?",
                style: StylesText.body3.copyWith(
                  decoration: TextDecoration.underline,
                  color: Colors.blue,
                ),
              ),
            ],
          ),
          SizedBox(
            height: 30.h,
          ),
          MainButton(
            onPressed: () {
              if (_formKey.currentState!.validate()) {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => HomePage(),
                  ),
                );
              }
            },
            title: "Đăng nhập",
          ),
        ],
      ),
    );
  }

  Widget _widgetDesignField({
    required String hintText,
    bool? isPassword = false,
    required TextEditingController controller,
    required IconData iconData,
    FormFieldValidator<String>? validator,
  }) {
    return Stack(
      children: [
        Container(
          height: 50.r,
          width: 1.sw,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8.r),
            color: Colors.grey.withOpacity(0.1),
          ),
        ),
        MainTextField(
          controller: controller,
          hint: hintText,
          borderColor: Colors.transparent,
          isPasswordField: isPassword,
          validator: validator,
          prefixIcon: SizedBox(
            height: 50.r,
            width: 50.r,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(iconData),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _widgetPhoneField() {
    return _widgetDesignField(
        hintText: "Số điện thoại",
        controller: phoneController,
        iconData: Icons.phone,
        isPassword: false,
        validator: (value) {
          return Validators.validatePhoneNumber(
              value, "Số điện thoại không hợp lệ");
        });
  }

  Widget _widgetPasswordField() {
    return _widgetDesignField(
        hintText: 'Mật khẩu',
        controller: passwordController,
        iconData: Icons.lock,
        isPassword: true,
        validator: (value) {
          return Validators.validateLength(value, 6, "mật khẩu >= 6");
        });
  }

  Widget _widgetOtherLogin() {
    return Column(
      children: [
        SizedBox(
          height: 30.h,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            SizedBox(
              height: 1.h,
              width: 0.2.sw,
              child: DecoratedBox(
                decoration: BoxDecoration(color: AppColors.grey),
              ),
            ),
            SizedBox(
              width: 10.r,
            ),
            Text(
              'Hoặc',
              style: StylesText.body4.copyWith(
                color: AppColors.grey,
              ),
            ),
            SizedBox(
              width: 10.r,
            ),
            SizedBox(
              height: 1.h,
              width: 0.2.sw,
              child: DecoratedBox(
                decoration: BoxDecoration(color: AppColors.grey),
              ),
            ),
          ],
        ),
        SizedBox(
          height: 30.h,
        ),
        _widgetButtonOtherLogin(textOther: "Facebook", assetImage: AssetPNG.facebook),
        SizedBox(
          height: 20.h,
        ),
        _widgetButtonOtherLogin(textOther: "Google", assetImage: AssetPNG.google),
        SizedBox(
          height: 20.h,
        ),
      ],
    );
  }

  Widget _widgetButtonOtherLogin({
    required String textOther,
    String? assetImage,
  }) {
    return MainButton(
      backgroundColor: Colors.grey.withOpacity(0.2),
      onPressed: () {},
      widgetInButton: Padding(
        padding:
            EdgeInsets.only(left: 10.r, right: 10.r, top: 5.r, bottom: 5.r),
        child: Row(
          children: [
            Container(
              height: 40.r,
              width: 40.r,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(40.r),
                image: DecorationImage(
                  image: AssetImage(assetImage ?? "")
                )
              ),
            ),
            Expanded(
              child: Center(
                child: Text(
                  "Đăng nhập với $textOther",
                  style: StylesText.body3.copyWith(
                    color: Colors.black54,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _widgetBottom() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          "Bạn chưa có tài khoản? ",
          style: StylesText.body3.copyWith(
            color: Colors.black,
          ),
        ),
        Text(
          "Đăng ký",
          style: StylesText.body3.copyWith(
            color: Colors.blue,
          ),
        ),
      ],
    );
  }
}
