import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:jihc_hack/src/core/constants/app_colors.dart';
import 'package:jihc_hack/src/core/utils/utils.dart';
import 'package:jihc_hack/src/core/widgets/widgets.dart';
import 'package:jihc_hack/src/features/auth/presentation/pages/register_page.dart';
import 'package:jihc_hack/src/features/navigation/presentation/pages/navigation_page.dart';

class LoginPage extends StatefulWidget {
  LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool isObscure = true;
  final FirebaseServices _auth = FirebaseServices();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryColor,
      body: LayoutBuilder(builder: (_, constraints) {
        return SingleChildScrollView(
          child: ConstrainedBox(
            constraints: BoxConstraints(minHeight: constraints.maxHeight),
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 20,
                vertical: 30,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // const SizedBox(height: 40),
                  Center(
                    child: Image.asset(
                      'assets/logo.png',
                      width: 150,
                    ),
                  ),
                  const Text(
                    "Войти в Аккаунт",
                    style: TextStyle(
                      fontSize: 38,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  const SizedBox(height: 30),
                  Form(
                    key: _formKey,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        CustomTextField(
                          validator: (v) {
                            if(v == null || v.isEmpty){
                              return 'Please fill up all fields';
                            }
                              final RegExp emailRegExp = RegExp(
                                r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$',
                              );
                              if (!emailRegExp.hasMatch(v)) {
                                return 'Please wride valid email';
                              }
                            else{
                              return null;
                            }
                          },
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
                        const SizedBox(height: 10),
                        CustomTextField(
                          validator: (v) {
                            if(v == null || v.isEmpty){
                              return 'Please fill up all fields';
                            } if(v.length < 8){
                              return 'Password length must be at least 8';
                            }
                            else{
                              return null;
                            }
                          },
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
                        const SizedBox(height: 20),
                        CustomButton(
                          onTap: (){
                            if(_formKey.currentState!.validate()){
                              _stateLogin();
                            }
                          },
                          text: "Войти",
                          textColor: _passwordController.text.isEmpty ||
                                  _emailController.text.isEmpty
                              ? const Color(0xffB1B1B1)
                              : Colors.white,
                          btnColor: _passwordController.text.isEmpty ||
                                  _emailController.text.isEmpty
                              ? const Color(0xffE3E3E3)
                              : Colors.black,
                        ),
                        const SizedBox(height: 10),
                      ],
                    ),
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
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
                            child: Text(
                              'Зарегистрироваться',
                              style: TextStyle(
                                  color: AppColors.iconsColor,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16),
                            ),
                          )
                        ],
                      ),
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
                              btnColor: const Color(0xffD44638)
                                  .withValues(alpha: 0.2),
                            ),
                          ),
                          const SizedBox(width: 10),
                          Expanded(
                            child: CustomButton(
                              onTap: () {},
                              text: "FACEBOOK",
                              textColor: const Color(0xff4267B2),
                              btnColor: const Color(0xff4267B2)
                                  .withValues(alpha: 0.2),
                            ),
                          ),
                        ],
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
        );
      }),
    );
  }

  _stateLogin() async {
    String password = _passwordController.text;
    String email = _emailController.text;

    User? user = await _auth.signInWithEmail(email, password);

    if (user != null) {
      print('signed in');
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => NavigationPage()));
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Your account not registered or valida password', style: TextStyle(color: Colors.white),),
        backgroundColor: Colors.black,
      ),
    );
    }
  }
}
