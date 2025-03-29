import 'dart:convert';

import 'package:deepl_dart/deepl_dart.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:ai_farabi/src/core/constants/app_colors.dart';
import 'package:ai_farabi/src/core/constants/api_key.dart';
import 'package:ai_farabi/src/core/widgets/translate_text_field.dart';
import 'package:ai_farabi/src/core/widgets/widgets.dart';
import 'package:http/http.dart' as http;

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
  final String _baseUrl = 'https://api-free.deepl.com/v2/translate';

  Future<String> translateTextWeb() async {
    final response = await http.post(
      Uri.parse(_baseUrl),
      headers: {
        'Authorization': 'DeepL-Auth-Key ${DeepLKey.apiKey}',
        'Content-Type': 'application/json',
        'User-Agent': 'deepl_dart/2.0.0',
      },
      body: json.encode({
        "text": _inputController.text,
        "target_lang": _targetLang,
      }),
    );

    if (response.statusCode == 200) {
      final data = json.decode(response.body);

      return data['translations'][0]['text'];
    } else {
      throw Exception('Failed to translate text: ${response.body}');
    }
  }

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
    TextResult result = await deepl.translate.translateText(
      _inputController.text,
      _targetLang,
    );
    setState(() {
      _translatedText = result.text;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      // appBar: AppBar(title: const Text("Translator")),
      body: LayoutBuilder(builder: (_, constraints) {
        return SingleChildScrollView(
          child: ConstrainedBox(
            constraints: BoxConstraints(minHeight: constraints.maxHeight),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
              child: Column(
                children: [
                  SizedBox(
                    height: 80,
                  ),
                  Stack(
                    alignment: Alignment.bottomCenter,
                    children: [
                      Image.asset(
                        'assets/logo.png',
                        width: 150,
                      ),
                      Container(
                        padding: const EdgeInsets.only(bottom: 30),
                        alignment: Alignment.bottomCenter,
                        child: const Text('translate'),
                      )
                    ],
                  ),
                  SizedBox(
                    height: 50,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      DropdownButton<String>(
                        dropdownColor: AppColors.primaryColor,
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
                      Icon(
                        Icons.swap_horiz,
                        color: AppColors.iconsColor,
                      ),
                      DropdownButton<String>(
                        dropdownColor: AppColors.primaryColor,
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
                      onTap: () {
                        if (kIsWeb) {
                          translateTextWeb();
                        } else {
                          _translateText();
                        }
                      },
                      textColor: AppColors.backgroundColor,
                      btnColor: AppColors.iconsColor),
                  const SizedBox(height: 16),
                  Container(
                    width: double.infinity,
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        border: Border.all(
                            color: _translatedText.isEmpty
                                ? Colors.grey
                                : AppColors.iconsColor)),
                    child: Text(
                      _translatedText.isEmpty ? 'Translation' : _translatedText,
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                        color: _translatedText.isEmpty
                            ? Colors.grey
                            : AppColors.iconsColor,
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        );
      }),
    );
  }
}
