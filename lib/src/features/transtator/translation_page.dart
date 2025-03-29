import 'dart:convert';
import 'package:deepl_dart/deepl_dart.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:ai_farabi/src/core/constants/app_colors.dart';
import 'package:ai_farabi/src/core/constants/api_key.dart';
import 'package:ai_farabi/src/core/widgets/translate_text_field.dart';
import 'package:ai_farabi/src/core/widgets/widgets.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_tts/flutter_tts.dart';

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
  final FlutterTts flutterTts = FlutterTts();

  Map<String, String> languageCodes = {
    "EN": "en-US",
    "RU": "ru-RU",
    "DE": "de-DE",
    "FR": "fr-FR",
    "ZH": "zh-CN",
    "KO": "ko-KR",
    "TR": "tr-TR",
  };

  @override
  void initState() {
    super.initState();
    _initTts();
  }

  Future<void> _initTts() async {
    await flutterTts.setVolume(1.0);
    await flutterTts.setSpeechRate(1);
    await flutterTts.setPitch(1.0);
  }

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
    TextResult result = await deepl.translate.translateText(
      _inputController.text,
      _targetLang,
    );
    setState(() {
      _translatedText = result.text;
    });
  }

  Future<void> _speak() async {
    if (_translatedText.isEmpty) return;

    try {
      String? languageCode = languageCodes[_targetLang];
      if (languageCode != null) {
        await flutterTts.setLanguage(languageCode);
        var result = await flutterTts.speak(_translatedText);
        if (result == 1) {

        } else {
          _showError("Failed to initialize speech");
        }
      }
    } catch (e) {
      _showError("Error during text-to-speech: $e");
    }
  }

  void _showError(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        backgroundColor: Colors.red,
      ),
    );
  }

  @override
  void dispose() {
    flutterTts.stop();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
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
                    child: Row(
                      children: [
                        Expanded(
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
                        ),
                        if (_translatedText.isNotEmpty)
                          IconButton(
                            icon: Icon(Icons.volume_up, color: AppColors.iconsColor),
                            onPressed: _speak,
                          ),
                      ],
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
