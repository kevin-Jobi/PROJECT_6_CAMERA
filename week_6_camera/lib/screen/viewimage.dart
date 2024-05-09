import 'package:flutter/material.dart';
import 'package:camera/camera.dart';
import 'dart:io';


class Imageview extends StatelessWidget {
 XFile images;

  Imageview( {Key? key , required this.images}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Image Preview'),
      ),
      body: Container(width: double.infinity, height: double.infinity,child: Image(image: FileImage(File(images.path),),),),
    );
  }
}
