import 'package:flutter/material.dart';
import 'dart:io' ;

import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';


class PicImage extends StatefulWidget {
  const PicImage({Key? key}) : super(key: key);

  @override
  State<PicImage> createState() => PicImageState();
}

class PicImageState extends State<PicImage> {

  dynamic image;


  final ImagePicker _picker = ImagePicker();
  void getPhoto(ImageSource source) async{
    final pickedImage = await _picker.getImage(source:source ,);
    setState((){
      if(pickedImage !=null){
        image = File(pickedImage.path) ;



      }
    });
  }

  @override
  void initState() {
    super.initState();


  }

  @override
  Widget bottomsheet() {
    return Container(
      height: 100,
      width: MediaQuery
          .of(context)
          .size
          .width,
      margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 20,),
      child: Column(
        children: [
          const Text('Choose Profile Photo',
            style:  TextStyle(
              fontSize: 20,
            ),
          ),
          const SizedBox(height: 20,),
          Row(
              children: [
                IconButton(onPressed: (){ getPhoto(ImageSource.camera);
                Navigator.pop(context);
                },
                  icon: const Icon(Icons.camera_alt,size: 30,),
                ),

                const SizedBox(width: 10,),
                IconButton(onPressed: (){ getPhoto(ImageSource.gallery);
                Navigator.pop(context);
                },
                  icon: const Icon(Icons.image_outlined,size: 30,),
                ),
              ]
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      // You can change the size of container according to your requirements
      body: Container(
        height: MediaQuery.of(context).size.height,
        child: Column(
          children: [
            Stack(
              children: [
                SizedBox(height: 60,),
                Container(
                    height: 600,
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                      color: Colors.grey,
                    ),
                    alignment: Alignment.center,
                    child:image == null ? Text('No image selected') : Image.file(image,fit: BoxFit.cover,
                      height: 600,
                      width: MediaQuery.of(context).size.width,
                    )
                ),
                SizedBox(height: 10,),

              ],
            ),
            SizedBox(height: 40,),
            InkWell(
              onTap: ()  {
                showModalBottomSheet(context: context, builder: ((builder)=>bottomsheet()));
              },
              child: Container(
                height: 40,
                width: 150,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.blueGrey,
                ),

                child: Center(
                  child: Text(
                    'Select Image ',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                    ),

                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
  // Method to get Date and Time

}