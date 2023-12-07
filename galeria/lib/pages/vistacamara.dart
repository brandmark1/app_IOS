import 'package:flutter/material.dart';
import 'package:galeria/pages/home_vista.dart';
import 'package:camera/camera.dart';
import 'package:path_provider/path_provider.dart';
import 'package:image_gallery_saver/image_gallery_saver.dart';
import 'dart:io';
import 'dart:typed_data';

Future<void> captureAndSavePhoto(CameraController controller) async {
  try {
    XFile imageFile = await controller.takePicture();
    if (imageFile == null) {
      return;
    }

    final imageBytes = await File(imageFile.path).readAsBytes();
    final result =
        await ImageGallerySaver.saveImage(Uint8List.fromList(imageBytes));
    print("Imagen guardada en: $result");
  } catch (e) {
    print("Error al guardar la imagen: $e");
  }
}

class CameraGalleryApp extends StatefulWidget {
  @override
  _CameraGalleryAppState createState() => _CameraGalleryAppState();
}

class _CameraGalleryAppState extends State<CameraGalleryApp> {
  late CameraController _controller;

  @override
  void initState() {
    super.initState();
    _initializeCamera();
  }

  Future<void> _initializeCamera() async {
    final cameras = await availableCameras();
    final firstCamera = cameras.first;

    _controller = CameraController(firstCamera, ResolutionPreset.medium);

    await _controller.initialize();
    if (!mounted) {
      return;
    }
    setState(() {});
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (!_controller.value.isInitialized) {
      return Container();
    }
    return Scaffold(
      appBar: AppBar(
        title: Text("Camera Gallery App"),
      ),
      body: Column(
        children: [
          AspectRatio(
            aspectRatio: _controller.value.aspectRatio,
            child: CameraPreview(_controller),
          ),
          ElevatedButton(
            onPressed: () {
              captureAndSavePhoto(_controller);
            },
            child: Text("Tomar Foto"),
          ),
        ],
      ),
    );
  }
}
