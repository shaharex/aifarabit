import 'package:ai_farabi/src/features/navigation/presentation/pages/navigation_page.dart';
import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:ai_farabi/src/core/constants/app_colors.dart';

class ImageDetectPage extends StatefulWidget {
  const ImageDetectPage({super.key});

  @override
  State<ImageDetectPage> createState() => _ImageDetectPageState();
}

class _ImageDetectPageState extends State<ImageDetectPage> {
  late CameraController _controller;
  late Future<void> _initializeControllerFuture;

  @override
  void initState() {
    super.initState();
    _initializeCamera();
  }

  Future<void> _initializeCamera() async {
  try {
    final cameras = await availableCameras();
    if (cameras.isEmpty) {
      throw Exception("No available cameras.");
    }
    final firstCamera = cameras.first;
    _controller = CameraController(
      firstCamera,
      ResolutionPreset.high,
    );

    _initializeControllerFuture = _controller.initialize();
    setState(() {});
  } catch (e) {
    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => NavigationPage()));
    print("Error initializing camera: $e");
  }
}


  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      body: FutureBuilder<void>(
        future: _initializeControllerFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            return Stack(
              children: [
                // Camera Preview
                SizedBox(
                  width: double.infinity,
                  height: 500,
                  child: CameraPreview(_controller),
                ),
              ],
            );
          } else {
            return const Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }
}
