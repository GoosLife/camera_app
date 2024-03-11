import 'package:flutter/material.dart';
import 'package:camera/camera.dart';

import 'package:camera_app/widgets/take_picture_screen.dart';

Future<void> main() async {
  try {
    // Ensure that plugin services are initialized so that `availableCameras()` can be called before `runApp()`
    WidgetsFlutterBinding.ensureInitialized();

    // Obtain a list of the available cameras on the device
    final cameras = await availableCameras();

    final firstCamera = cameras.first;

    runApp(
      MaterialApp(
        theme: ThemeData.dark(),
        home: TakePictureScreen(
          camera: firstCamera,
        ),
      ),
    );
  } catch (e) {
    // If an error occurs, log the error to the console (while debugging)
    print('Error: $e');
  }
}
