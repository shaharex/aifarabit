import 'package:deepl_dart/deepl_dart.dart';
import 'package:flutter/material.dart';
import 'package:jihc_hack/src/core/constants/app_colors.dart';
import 'package:jihc_hack/src/core/constants/constants.dart';
import 'package:jihc_hack/src/core/widgets/translate_text_field.dart';
import 'package:jihc_hack/src/core/widgets/widgets.dart';

class TranslationPage extends StatefulWidget {
  const TranslationPage({super.key});

  @override
  _TranslationPageState createState() => _TranslationPageState();
}

class _TranslationPageState extends State<TranslationPage> {
  final TextEditingController _inputController = TextEditingController();
  String _translatedText = "";
  String _sourceLang = "EN";
  String _targetLang = "RU";

  Future<void> _translateText() async {
    if (_inputController.text.isEmpty) return;
    DeepL deepl = DeepL(authKey: DeepLKey.apiKey);
    // final translated= deepl.translate.translateText(
    //   _inputController.text,
    //   _targetLang,
    //   sourceLang: _sourceLang,
    //   // targetLang: _targetLang,
    // );
    // final translation = await deepl.translate(
    //   _inputController.text,
    //   sourceLang: _sourceLang,
    //   targetLang: _targetLang,
    // );
    TextResult result =
      await deepl.translate.translateText(_inputController.text, _targetLang,);
    setState(() {
      _translatedText = result.text;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      // appBar: AppBar(title: const Text("Translator")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            SizedBox(
              height: 80,
            ),
            Image.asset('assets/logo.png', width: 80,),
            SizedBox(
              height: 50,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                DropdownButton<String>(
                  dropdownColor: AppColors.chatTextColor,
                  iconEnabledColor: AppColors.iconsColor,
                  style: TextStyle(color: AppColors.iconsColor),
                  value: _sourceLang,
                  onChanged: (newLang) {
                    setState(() {
                      _sourceLang = newLang!;
                    });
                  },
                  items: const [
                    DropdownMenuItem(value: "EN", child: Text("English")),
                    DropdownMenuItem(value: "RU", child: Text("Russian")),
                    DropdownMenuItem(value: "DE", child: Text("German")),
                    DropdownMenuItem(value: "FR", child: Text("France")),
                    DropdownMenuItem(value: "ZH", child: Text("China")),
                    DropdownMenuItem(value: "KO", child: Text("Korean")),
                    DropdownMenuItem(value: "TR", child: Text("Turkish")),
                  ],
                ),
                Icon(Icons.swap_horiz, color: AppColors.iconsColor,),
                DropdownButton<String>(
                  dropdownColor: AppColors.chatTextColor,
                  iconEnabledColor: AppColors.iconsColor,
                  style: TextStyle(color: AppColors.iconsColor),
                  value: _targetLang,
                  onChanged: (newLang) {
                    setState(() {
                      _targetLang = newLang!;
                    });
                  },
                  items: const [
                    DropdownMenuItem(value: "EN", child: Text("English")),
                    DropdownMenuItem(value: "RU", child: Text("Russian")),
                    DropdownMenuItem(value: "DE", child: Text("German")),
                    DropdownMenuItem(value: "FR", child: Text("France")),
                    DropdownMenuItem(value: "ZH", child: Text("China")),
                    DropdownMenuItem(value: "KO", child: Text("Korean")),
                    DropdownMenuItem(value: "TR", child: Text("Turkish")),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 16),
            TranslateTextField(
              maxLine: 5,
              hintText: "Напишите", 
              controller: _inputController, 
            ),
            // TextField(
            //   controller: _inputController,
            //   decoration: const InputDecoration(
            //     border: OutlineInputBorder(),
            //     hintText: "Enter text to translate",
            //   ),
            //   maxLines: 5,
            // ),
            const SizedBox(height: 16),
            CustomButton(
              text: 'Translate', 
              onTap: _translateText, 
              textColor: AppColors.backgroundColor, 
              btnColor: AppColors.iconsColor),
            const SizedBox(height: 16),
            Container(
              width: double.infinity,
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                border: Border.all(color: AppColors.iconsColor)
              ),
              child: Text(
              _translatedText,
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: AppColors.iconsColor),
            ),
            )
          ],
        ),
      ),
    );
  }
}