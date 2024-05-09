import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:camera/camera.dart';
import 'package:flutter/widgets.dart';
import 'package:week_6_camera/screen/camera_screen.dart';
late List<CameraDescription> cameras;
Future <void> main() async{
  WidgetsFlutterBinding.ensureInitialized();
  cameras = await availableCameras();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
     
      home: CameraApp(),
    );
  }
}

class CameraApp extends StatefulWidget {
  const CameraApp({super.key});

  @override
  State<CameraApp> createState() => _CameraAppState();
}

class _CameraAppState extends State<CameraApp> {
  late CameraController _controller;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _controller=CameraController(cameras[0], ResolutionPreset.max);
    _controller.initialize().then((_){
      if(!mounted){
        return;
      }
      setState(() {});
    }).catchError((Object e){
      if(e is CameraException){
        switch (e.code){
          case 'CameraAcessDenied':
          print('access was denied ');
          break;
          default:
          print(e.description);
          break;
        }
      }
    });
  }
   List<XFile>myimages=[];
   late XFile picture=XFile('');
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // starting implimenting camera
      body: Stack(

        children: [
          Container(
            height: double.infinity,
            child: CameraPreview(_controller),
          ),
          // adding button to take picture
         Column(
          mainAxisAlignment:MainAxisAlignment.end ,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Center(
              child: Container(
                margin: EdgeInsets.all(20.0),
                child: Row(
                  children: [
                    GestureDetector(
                      onTap: (){
                        Navigator.of(context).push(MaterialPageRoute(builder: (context) =>ImagePreview(images: myimages,) ,));
                      },
                      child: Container(
                        child: picture.path.isNotEmpty
                            ? Expanded(child: Image.file(File(picture.path)))
                            : Container(),
                        width: 50,
                        height: 50,
                        color: Colors.white,
                      ),
                    ),

                    SizedBox(width: 30,),

                    MaterialButton(
                      onPressed: () async{
                    
              
                            
                        try{
                          await _controller.setFlashMode(FlashMode.auto);
                          picture= await _controller.takePicture();
                          
                        } on CameraException catch(e){
                          debugPrint('error occured while taking picture : $e');
                          return null;
                        }

                        print("hellow ${picture.path}");
                        myimages.add(picture);

                        setState(() {
                          
                        });
                      },
                      color: Colors.white,
                    child: Text('Take a Picture'),
                    
                    ),
                  ],
                ),
              ),
            )
          ],
         )
        ],
      ),
    );
  }
}