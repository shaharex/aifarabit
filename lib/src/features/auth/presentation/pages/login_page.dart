import 'package:flutter/material.dart';
import 'package:jihc_hack/src/core/constants/app_colors.dart';
import 'package:jihc_hack/src/core/widgets/widgets.dart';

class LoginPage extends StatefulWidget {
  LoginPage({super.key, required this.showRegisterPage});
  final VoidCallback showRegisterPage;

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool isObscure = false;

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffF7F8FA),
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 20,
          vertical: 20,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const CustomBackButton(),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const SizedBox(height: 40),
                  Text(
                    "Войти в Аккаунт",
                    style: TextStyle(
                        color: AppColors.chatTextColor,
                        fontSize: 38,
                        fontWeight: FontWeight.w500),
                  ),
                  const SizedBox(height: 40),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      CustomTextField(
                        hintText: "Почта",
                        controller: _emailController,
                        textChanged: (text) {
                          setState(() {});
                        },
                        prefixIcon: Icon(
                          Icons.email_outlined,
                          color: _emailController.text.isNotEmpty
                              ? AppColors.chatTextColor
                              : AppColors.iconsColor,
                        ),
                      ),
                      const SizedBox(height: 20),
                      CustomTextField(
                        hintText: "Пароль",
                        controller: _passwordController,
                        textChanged: (text) {
                          setState(() {});
                        },
                        isObscure: isObscure,
                        onObscure: () {
                          setState(() {
                            isObscure = !isObscure;
                          });
                        },
                        prefixIcon: Icon(
                          Icons.lock_outline,
                          color: _passwordController.text.isNotEmpty
                              ? AppColors.chatTextColor
                              : AppColors.iconsColor,
                        ),
                      ),
                      const SizedBox(height: 30),
                      CustomButton(
                        onTap: () {},
                        text: "Войти",
                        textColor: Colors.white,
                        btnColor: AppColors.chatTextColor,
                      ),
                      const SizedBox(height: 10),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text(
                            "Нет Аккаунта? ",
                            style: TextStyle(
                                fontSize: 16, color: Color(0xffACADB9)),
                          ),
                          GestureDetector(
                            onTap: widget.showRegisterPage,
                            child: const Text(
                              'Зарегистрироваться',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 16),
                            ),
                          )
                        ],
                      ),
                    ],
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const SizedBox(height: 13),
                      const Divider(),
                      const SizedBox(height: 13),
                      const Align(
                        alignment: Alignment.center,
                        child: Text(
                          "Продолжить с",
                          textAlign: TextAlign.center,
                          style:
                              TextStyle(fontSize: 16, color: Color(0xffACADB9)),
                        ),
                      ),
                      const SizedBox(height: 10),
                      Row(
                        children: [
                          Expanded(
                            child: CustomButton(
                              onTap: () {},
                              text: "GOOGLE",
                              textColor: const Color(0xffD44638),
                              btnColor:
                                  const Color(0xffD44638).withOpacity(0.2),
                            ),
                          ),
                          const SizedBox(width: 10),
                          Expanded(
                            child: CustomButton(
                              onTap: () {},
                              text: "FACEBOOK",
                              textColor: const Color(0xff4267B2),
                              btnColor:
                                  const Color(0xff4267B2).withOpacity(0.2),
                            ),
                          ),
                        ],
                      ),
                    ],
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
