import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:gal/gal.dart';

class DisplayPictureScreen extends StatelessWidget {
  final String imagePath;

  const DisplayPictureScreen({super.key, required this.imagePath});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:
          AppBar(title: const Text('Display the Picture'), actions: <Widget>[
        IconButton(
            icon: const Icon(Icons.save),
            onPressed: () {
              Gal.putImage(imagePath);
              Navigator.pop(context);
            }),
      ]),
      // The image is stored as a file on the device. Use the `Image.file`
      // constructor with the given path to display the image.
      body: Image.file(
        File(imagePath),
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          FloatingActionButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: const Icon(Icons.cancel),
          ),
          const SizedBox(width: 10),
          FloatingActionButton(
            onPressed: () {
              Gal.putImage(imagePath);
              Navigator.pop(context);
            },
            child: const Icon(Icons.save),
          )
        ],
      ),
    );
  }
}
