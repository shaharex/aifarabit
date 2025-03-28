import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:ai_farabi/src/core/constants/app_colors.dart';
import 'package:ai_farabi/src/core/hive/hive_serv.dart';
import 'package:ai_farabi/src/core/utils/utils.dart';
import 'package:ai_farabi/src/core/widgets/widgets.dart';
import 'package:ai_farabi/src/features/auth/login_page.dart';
import 'package:ai_farabi/src/features/preferences/presentation/pages/preferences_page.dart';

class RegisterPage extends StatefulWidget {
  RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool isObscure = false;
  bool isLoading = false;
  FirebaseServices auth = FirebaseServices();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryColor,
      body: LayoutBuilder(builder: (_, constraints) {
        return Form(
          key: _formKey,
          child: SingleChildScrollView(
            child: ConstrainedBox(
              constraints: BoxConstraints(minHeight: constraints.maxHeight),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const SizedBox(height: 40),
                    const Text(
                      "Создайте Аккаунт",
                      style: TextStyle(
                        fontSize: 38,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    const SizedBox(height: 40),
                    CustomTextField(
                      validator: (value) {
                        if(value == null || value.isEmpty){
                          return 'Write your name';
                        }
                        return null;
                      },
                      hintText: "Ваше имя",
                      controller: _nameController,
                      textChanged: (_) => setState(() {}),
                      prefixIcon: Icon(
                        Icons.person_outline_outlined,
                        color: AppColors.iconsColor,
                      ),
                    ),
                    const SizedBox(height: 15),
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
                      hintText: "Ваша почта",
                      controller: _emailController,
                      textChanged: (_) => setState(() {}),
                      prefixIcon: Icon(
                        Icons.email_outlined,
                        color: AppColors.iconsColor,
                      ),
                    ),
                    const SizedBox(height: 15),
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
                      hintText: "Ваш пароль",
                      controller: _passwordController,
                      textChanged: (_) => setState(() {}),
                      isObscure: isObscure,
                      onObscure: () => setState(() => isObscure = !isObscure),
                      prefixIcon: Icon(
                        Icons.lock_outline,
                        color: AppColors.iconsColor,
                      ),
                    ),
                    const SizedBox(height: 30),
                    CustomButton(
                      onTap: _signUp,
                      text: isLoading ? "Загрузка..." : "Зарегистрироваться",
                      textColor: _passwordController.text.isEmpty ||
                              _emailController.text.isEmpty ||
                              _nameController.text.isEmpty
                          ? const Color(0xffB1B1B1)
                          : Colors.white,
                      btnColor: _passwordController.text.isEmpty ||
                              _emailController.text.isEmpty ||
                              _nameController.text.isEmpty
                          ? const Color(0xffE3E3E3)
                          : Colors.black,
                    ),
                    const SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          "Уже зарегистрированы? ",
                          style:
                              TextStyle(fontSize: 16, color: Color(0xffACADB9)),
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.push(context,
                                MaterialPageRoute(builder: (_) => LoginPage()));
                          },
                          child: Text(
                            'Войти',
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                                color: AppColors.iconsColor),
                          ),
                        )
                      ],
                    ),
                    const SizedBox(height: 13),
                    const Divider(),
                    // const SizedBox(height: 13),
                    const Align(
                      alignment: Alignment.center,
                      child: Text(
                        "Продолжить с",
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 16, color: Color(0xffACADB9)),
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
                                const Color(0xffD44638).withValues(alpha: 0.2),
                          ),
                        ),
                        const SizedBox(width: 10),
                        Expanded(
                          child: CustomButton(
                            onTap: () {},
                            text: "FACEBOOK",
                            textColor: const Color(0xff4267B2),
                            btnColor:
                                const Color(0xff4267B2).withValues(alpha: 0.2),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      }),
    );
  }

  Future<void> _signUp() async {
    String password = _passwordController.text.trim();
    String email = _emailController.text.trim();

    try {
      User? user = await auth.registerWithEmailAndPassword(
        password: password,
        email: email,
      );

      if (user != null) {
        print('user: $user');
        HiveService.clearTourismData();
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => PreferencesPage()),
        );
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Error', style: TextStyle(color: Colors.white)),
        backgroundColor: Colors.black,
      ),
    );
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Error', style: TextStyle(color: Colors.white),),
        backgroundColor: Colors.black,
      ),
    );
    }
  }

  
}
