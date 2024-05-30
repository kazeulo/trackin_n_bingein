import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:trackin_n_bingein/backend/media_repository.dart';
import 'package:trackin_n_bingein/backend/models/MediaModel';

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
        title: const Text('Add Item'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            GestureDetector(
              onTap: _getImage,
              child: _image == null
                  ? Container(
                      width: 100,
                      height: 100,
                      color: Colors.grey[200],
                      child: const Icon(Icons.add_a_photo, size: 50),
                    )
                  : Image.file(_image!, width: 100, height: 100, fit: BoxFit.cover),
            ),
            TextFormField(
              controller: _nameController,
              decoration: InputDecoration(
                labelText: 'Name',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                )),
            ),
            TextFormField(
              controller: _authorController,
              decoration: InputDecoration(
                labelText: 'Author/Creator',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                )),
            ),
            TextFormField(
              controller: _descriptionController,
              maxLength: 200,
              decoration: const InputDecoration(
                labelText: 'Description',
                counterText: '',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(12.0)),
                ),
              ),
              maxLines: null,  // Allows the field to expand as the user types more text
            ),
            TextFormField(
              controller: _maxDurationController,
              decoration: InputDecoration(
                labelText: 'Max Duration',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                )),
            ),
            const SizedBox(height: 20),
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
                  category: '',
                  status: '',
                  description: _descriptionController.text,
                  maxDuration: maxDuration,
                  image: _image
                );

                MediaRepository.instance.createUser(newMedia);
              },
              child: const Text('Add Media'),
            ),
          ],
        ),
      ),
    );
  }
}
