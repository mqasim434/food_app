import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class AddProduct extends StatefulWidget {
  @override
  _AddProductState createState() => _AddProductState();
}

class _AddProductState extends State<AddProduct> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();
  final TextEditingController _priceController = TextEditingController();

  File? _imageFile;
  String? _imageUrl;

  Future<void> _pickImage() async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);

    setState(() {
      if (pickedFile != null) {
        _imageFile = File(pickedFile.path);
      } else {
        print('No image selected.');
      }
    });
  }

  Future<void> _uploadImage() async {
    if (_imageFile == null) {
      print('Please pick an image first.');
      return;
    }

    try {
      String fileName = DateTime.now().millisecondsSinceEpoch.toString();
      Reference storageReference = FirebaseStorage.instance.ref().child('images/$fileName.jpg');

      UploadTask uploadTask = storageReference.putFile(_imageFile!);
      TaskSnapshot taskSnapshot = await uploadTask;

      String imageUrl = await taskSnapshot.ref.getDownloadURL();
      setState(() {
        _imageUrl = imageUrl;
      });

      print('Image uploaded successfully. URL: $_imageUrl');
    } catch (e) {
      print('Error uploading image to Firebase Storage: $e');
    }
  }

  Future<void> _addProductToFirebase() async {
    if (_formKey.currentState!.validate() && _imageUrl != null) {
      String title = _titleController.text.trim();
      String description = _descriptionController.text.trim();
      double price = double.parse(_priceController.text.trim());

      try {
        CollectionReference productsCollection =
        FirebaseFirestore.instance.collection('products');

        await productsCollection.add({
          'title': title,
          'description': description,
          'price': price,
          'imageUrl': _imageUrl,
        });

        print('Product added successfully to Firestore!');
      } catch (e) {
        print('Error adding product to Firestore: $e');
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add Product'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              _imageFile != null
                  ? Image.file(
                _imageFile!,
                height: 200,
              )
                  : Icon(
                Icons.image,
                size: 200,
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () => _pickImage(),
                child: Text('Pick Image'),
              ),
              TextFormField(
                controller: _titleController,
                decoration: InputDecoration(labelText: 'Title'),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter a title.';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _descriptionController,
                decoration: InputDecoration(labelText: 'Description'),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter a description.';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _priceController,
                decoration: InputDecoration(labelText: 'Price'),
                keyboardType: TextInputType.number,
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter a price.';
                  }
                  return null;
                },
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () async {
                  await _uploadImage();
                  _addProductToFirebase();
                },
                child: Text('Add Product'),
              ),
              if (_imageUrl != null)
                Text(
                  'Image URL: $_imageUrl',
                  style: TextStyle(fontSize: 16),
                ),
            ],
          ),
        ),
      ),
    );
  }
}

