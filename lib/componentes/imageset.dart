import 'package:flutter/material.dart';
import 'dart:io';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:image_picker/image_picker.dart';
// import 'firebase_config.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
final FirebaseStorage storage = FirebaseStorage.instance;

class CameraGalleryWidget extends StatefulWidget {
  final Function(File) onImageSelected;

  const CameraGalleryWidget({Key? key, required this.onImageSelected})
      : super(key: key);

  @override
  _CameraGalleryWidgetState createState() => _CameraGalleryWidgetState();
}

class _CameraGalleryWidgetState extends State<CameraGalleryWidget> {
  File? _image;

  Future<void> _getImage(ImageSource source) async {
    final pickedFile = await ImagePicker().pickImage(source: source);
    if (pickedFile != null) {
      setState(() {
        _image = File(pickedFile.path);
      });
      widget.onImageSelected(_image!);
      // await _uploadImage(_image!);
    }
  }
  

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ElevatedButton(
          onPressed: () {
            _getImage(ImageSource.camera);
          },
          child: Text('Take a photo'),
        ),
        ElevatedButton(
          onPressed: () {
            _getImage(ImageSource.gallery);
          },
          child: Text('Select from gallery'),
        ),
        if (_image != null)
          Image.file(
            _image!,
            width: 80,
            height: 80,
            fit: BoxFit.cover,
          ),
      ],
    );
  }
}


class FirebaseUploadWidget extends StatefulWidget {
  final File image;

  const FirebaseUploadWidget({Key? key, required this.image}) : super(key: key);

  @override
  _FirebaseUploadWidgetState createState() => _FirebaseUploadWidgetState();
}

class _FirebaseUploadWidgetState extends State<FirebaseUploadWidget> {
  String? _downloadURL;

  Future<void> _uploadImage() async {
    final Reference storageRef = FirebaseStorage.instance.ref();
    final Reference imageRef = storageRef.child('images/${widget.image.path}');
    // final UploadTask uploadTask = imageRef.putFile(widget.image);
    // final TaskSnapshot taskSnapshot = await uploadTask;
    _downloadURL = await imageRef.getDownloadURL();
    setState(() {
      
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ElevatedButton(
          onPressed: _uploadImage,
          child: Text('Upload to Firebase'),
        ),
        if (_downloadURL != null)
          Image.network(
            _downloadURL!,
            width: 80,
            height: 80,
            fit: BoxFit.cover,
          ),
      ],
    );
  }
}