// import 'dart:io';

// import 'package:camera/camera.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';

// class ImagePreview extends StatefulWidget {
//    ImagePreview(this.file,{super.key});
//   XFile file;
//   @override
//   State<ImagePreview> createState() => _ImagePreviewState();
// }

// class _ImagePreviewState extends State<ImagePreview> {
//   @override
//   Widget build(BuildContext context) {
//     File picture=File(widget.file.path);
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Image Preview'),
//       ),
//       body: Center(
//         child: Image.file(picture),
//       ),
//     );
//   }
// }




// import 'package:camera/camera.dart';
// import 'dart:io';
// import 'package:flutter/material.dart';

// class ImagePreview extends StatelessWidget {
//   final XFile file;

//   const ImagePreview(this.file, {Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     File picture = File(file.path);
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Image Preview'),
//       ),
//       body: Center(
//         child: Image.file(picture),
//       ),
//     );
//   }
// }




// import 'dart:io';

// import 'package:flutter/material.dart';
// import 'package:camera/camera.dart';
// class ImagePreview extends StatefulWidget {
  

//   const ImagePreview(this.file, {Key? key}) : super(key: key);
// final XFile file;
//   @override
//   State<ImagePreview> createState() => _ImagePreviewState();
// }

// class _ImagePreviewState extends State<ImagePreview> {
//   @override
//   Widget build(BuildContext context) {
//     File picture = File(widget.file.path);
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Image Preview'),
//       ),
//       body: Center(
//         child: Image.file(picture),
//       ),
//     );
//   }
// }






import 'package:flutter/material.dart';
import 'package:camera/camera.dart';
import 'dart:io';

import 'package:week_6_camera/screen/viewimage.dart';


class ImagePreview extends StatelessWidget {
 List<XFile>images;

  ImagePreview( {Key? key , required this.images}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Image Preview'),
      ),
      body:  GridView.builder(itemCount: images.length, gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3), itemBuilder: (context, index) =>GestureDetector(onTap: () => Navigator.of(context).push(MaterialPageRoute(builder: (context) => Imageview(images:images[index]),)), child: Container(width: 50,height: 50,child: Image(image: FileImage(File(images[index].path))),)),));
  
  }
}

