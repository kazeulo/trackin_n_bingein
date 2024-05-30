import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:trackin_n_bingein/backend/media_repository.dart';
import 'package:trackin_n_bingein/backend/models/mediaModel';

class AddItem extends StatefulWidget {
  @override
  _AddItemState createState() => _AddItemState();
}

class _AddItemState extends State<AddItem> {
  final Mediarepo = Get.put(MediaRepository());

  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _authorController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();
  final TextEditingController _maxDurationController = TextEditingController();
  File? _image;

  Future<void> _getImage() async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);

    setState(() {
      if (pickedFile != null) {
        _image = File(pickedFile.path);
      } else {
        print('No image selected.');
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add Item'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: ListView(
          children: [
            GestureDetector(
              onTap: _getImage,
              child: _image == null
                  ? Container(
                      width: 100,
                      height: 100,
                      color: Colors.grey[200],
                      child: Icon(Icons.add_a_photo, size: 50),
                    )
                  : Image.file(_image!,
                      width: 100, height: 100, fit: BoxFit.cover),
            ),
            TextFormField(
              controller: _nameController,
              decoration: InputDecoration(labelText: 'Name'),
            ),
            TextFormField(
              controller: _authorController,
              decoration: InputDecoration(labelText: 'Author or Creator'),
            ),
            TextFormField(
              controller: _descriptionController,
              decoration: InputDecoration(labelText: 'Description',
              counterText: ''),
              inputFormatters: [
                LengthLimitingTextInputFormatter(
                  200,
                ), //n is maximum number of characters you want in textfield
              ],
              
            ),
            
            TextFormField(
              controller: _maxDurationController,
              decoration: InputDecoration(labelText: 'Max Duration'),
              keyboardType: TextInputType.number,
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                int maxDuration = 0;
                try {
                  maxDuration = int.parse(_maxDurationController.text);
                } catch (e) {
                  print('Error parsing max duration: $e');
                }

                // Create media model with user inputs
                MediaModel newMedia = MediaModel(
                    name: _nameController.text,
                    author: _authorController.text,
                    description: _descriptionController.text,
                    maxDuration: maxDuration,
                    image: _image);

                MediaRepository.instance.createUser(newMedia);
              },
              child: Text('Add Media'),
            ),
          ],
        ),
      ),
    );
  }
}