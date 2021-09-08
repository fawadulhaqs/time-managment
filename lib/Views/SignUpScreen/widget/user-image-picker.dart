import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:timemanagment/constans/Colors.dart';

class UserImagePicker extends StatefulWidget {
  UserImagePicker({Key key, this.imagePickedFn}) : super(key: key);
  final void Function(File pickedFile) imagePickedFn;

  @override
  _UserImagePickerState createState() => _UserImagePickerState();
}

class _UserImagePickerState extends State<UserImagePicker> {
  File image;
  final picker = ImagePicker();

  Future getImage() async {
    final pickedImage =
        await picker.getImage(source: ImageSource.camera, imageQuality: 30);

    setState(() {
      if (pickedImage != null) {
        image = File(pickedImage.path);
      } else {
        print('No image selected.');
      }
    });
    widget.imagePickedFn(File(pickedImage.path));
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12),
      child: Stack(
        children: [
          CircleAvatar(
              backgroundColor: Colors.grey,
              radius: 60,
              backgroundImage: image != null ? FileImage(image) : null),
          Positioned(
              bottom: 0,
              right: 0,
              child: Container(
                  decoration: BoxDecoration(
                      color: CustomColors.myBlue,
                      borderRadius: BorderRadius.circular(35)),
                  child: IconButton(
                    icon: Icon(
                      Icons.camera_alt,
                      size: 27,
                      color: Colors.white,
                    ),
                    onPressed: getImage,
                  )))
        ],
      ),
    );
  }
}
