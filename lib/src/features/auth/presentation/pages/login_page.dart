import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:jihc_hack/src/core/constants/app_colors.dart';
import 'package:jihc_hack/src/core/utils/utils.dart';
import 'package:jihc_hack/src/core/widgets/widgets.dart';
import 'package:jihc_hack/src/features/auth/presentation/pages/register_page.dart';
import 'package:jihc_hack/src/features/navigation/presentation/pages/main_page.dart';

class LoginPage extends StatefulWidget {
  LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool isObscure = false;
  final FirebaseServices _auth = FirebaseServices();

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 20,
          vertical: 30,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // const CustomBackButton(),
            SizedBox(
              height: 100,
            ),
            Center(
              child: Image.asset(
                'assets/logo.png',
                width: 150,
              ),
            ),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // const SizedBox(height: 40),
                  // const Text(
                  //   "Войти в Аккаунт",
                  //   style: TextStyle(
                  //       color: Colors.white,
                  //       fontSize: 38,
                  //       fontWeight: FontWeight.w500),
                  // ),
                  // const SizedBox(height: 40),
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
                          color: AppColors.iconsColor,
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
                          color: AppColors.iconsColor,
                        ),
                      ),
                      const SizedBox(height: 30),
                      CustomButton(
                        onTap: _stateLogin,
                        text: "Войти",
                        textColor: _passwordController.text.isEmpty ||
                                _emailController.text.isEmpty
                            ? Colors.white
                            : Colors.black,
                        btnColor: _passwordController.text.isEmpty ||
                                _emailController.text.isEmpty
                            ? AppColors.backgroundColor
                            : AppColors.iconsColor,
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
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (_) => RegisterPage()));
                            },
                            child: const Text(
                              'Зарегистрироваться',
                              style: TextStyle(
                                  color: AppColors.iconsColor,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16),
                            ),
                          )
                        ],
                      ),
                    ],
                  ),
                  // Column(
                  //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  //   children: [
                  //     const SizedBox(height: 13),
                  //     const Divider(),
                  //     const SizedBox(height: 13),
                  //     const Align(
                  //       alignment: Alignment.center,
                  //       child: Text(
                  //         "Продолжить с",
                  //         textAlign: TextAlign.center,
                  //         style:
                  //             TextStyle(fontSize: 16, color: Color(0xffACADB9)),
                  //       ),
                  //     ),
                  //     const SizedBox(height: 10),
                  // Row(
                  //   children: [
                  //     Expanded(
                  //       child: CustomButton(
                  //         onTap: () {},
                  //         text: "GOOGLE",
                  //         textColor: const Color(0xffD44638),
                  //         btnColor:
                  //             const Color(0xffD44638).withOpacity(0.2),
                  //       ),
                  //     ),
                  //     const SizedBox(width: 10),
                  //     Expanded(
                  //       child: CustomButton(
                  //         onTap: () {},
                  //         text: "FACEBOOK",
                  //         textColor: const Color(0xff4267B2),
                  //         btnColor:
                  //             const Color(0xff4267B2).withOpacity(0.2),
                  //       ),
                  //     ),
                  //   ],
                  // ),
                  //   ],
                  // )
                ],
              ),
            ),
            SizedBox(
              height: 50,
            )
          ],
        ),
      ),
    );
  }

  _stateLogin() async {
    String password = _passwordController.text;
    String email = _emailController.text;

    User? user = await _auth.signInWithEmail(email, password);

    if (user != null) {
      print('signed in');
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => MainPage()));
    } else {
      print("failed");
    }
  }
}
