import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:jihc_hack/src/core/constants/app_colors.dart';
import 'package:jihc_hack/src/core/utils/utils.dart';
import 'package:jihc_hack/src/core/widgets/widgets.dart';
import 'package:jihc_hack/src/features/auth/presentation/pages/login_page.dart';
import 'package:jihc_hack/src/features/navigation/presentation/pages/main_page.dart';
import 'package:jihc_hack/src/features/preferences/presentation/pages/preferences_page.dart';

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
        return SingleChildScrollView(
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
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => PreferencesPage()),
        );
      } else {
        _showErrorDialog('Что то пошло не так. Проваерьте данные!');
      }
    } catch (e) {
      _showErrorDialog('An error occurred: ${e.toString()}');
    }
  }

  void _showErrorDialog(String message) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        backgroundColor: Colors.black,
        title: Text(
          'Ошибка',
          style: TextStyle(color: AppColors.iconsColor),
        ),
        content: Text(message, style: TextStyle(color: AppColors.iconsColor)),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text(
              'OK',
              style: TextStyle(color: Colors.white),
            ),
          ),
        ],
      ),
    );
  }
}
