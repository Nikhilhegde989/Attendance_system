import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

class UserProfilePage extends StatefulWidget {
  @override
  _UserProfilePageState createState() => _UserProfilePageState();
}

class _UserProfilePageState extends State<UserProfilePage> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  File? _image;

  Future<void> _saveToFirestore() async {
    try {
      // Create a map with employee details
      Map<String, dynamic> employeeData = {
        'name': _nameController.text,
        'email': _emailController.text,
        'phone': _phoneController.text,
      };

      // Add the map as a document to the Firestore collection
      await FirebaseFirestore.instance.collection('Employees').add(employeeData);

      // Clear the text fields after saving to Firestore
      _nameController.clear();
      _emailController.clear();
      _phoneController.clear();

      // Show success message to the admin
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content: Text('Employee details saved successfully!'),
        duration: Duration(seconds: 2),
      ));
    } catch (e) {
      print('Error saving to Firestore: $e');
    }
  }

  Future<void> _selectPhoto() async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      setState(() {
        _image = File(pickedFile.path);
      });
    }
  }

  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'ADD EMPLOYEE',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Color.fromARGB(255, 59, 58, 58),
          ),
        ),
        backgroundColor: Color.fromARGB(255, 142, 162, 253),
        centerTitle: true,
        elevation: 0,
        shape: ContinuousRectangleBorder(
          borderRadius: BorderRadius.circular(30.0),
        ),
      ),
      body:SingleChildScrollView(
        child: Padding(
       
        padding: const EdgeInsets.all(19.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Padding(
                padding: const EdgeInsets.only(top: 45.0),
           child: GestureDetector(
              onTap: _selectPhoto,
              child: Container(
                
                width: 400,
                height: 200,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.grey[300],
                  image: _image != null
                      ? DecorationImage(
                          image: FileImage(_image!),
                          fit: BoxFit.cover,
                          alignment: Alignment.center,
                        )
                      : null,
                ),
                child: _image == null
                    ? Icon(
                        Icons.camera_alt,
                        size: 40,
                        color: Colors.grey[600],
                      )
                    : null,
              ),
            ),
            ),
            SizedBox(height: 20),
            TextField(
              controller: _nameController,
              decoration: InputDecoration(
                labelText: 'Name',
                 border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(15.0),
       borderSide: BorderSide(
        color: Colors.blue, // Change the border color to blue
        width: 2.0, // Adjust the border width as needed
      ),
     // Adjust the radius as needed
                 )
              ),
            ),
            SizedBox(height: 12),
            TextField(
              controller: _phoneController,
              decoration: InputDecoration(
                labelText: 'Phone Number',
                 border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(15.0),
       borderSide: BorderSide(
        color: Colors.blue, // Change the border color to blue
        width: 2.0, // Adjust the border width as needed
      ),
     // Adjust the radius as needed
                 )
              ),
            ),
            SizedBox(height: 12),
           TextField(
              controller: _emailController,
              decoration: InputDecoration(
                labelText: 'E-Mail',
                 border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(15.0),
       borderSide: BorderSide(
        color: Colors.blue, // Change the border color to blue
        width: 2.0, // Adjust the border width as needed
      ),
     // Adjust the radius as needed
                 )
              ),
            ),
            SizedBox(height: 20),
           ElevatedButton(
        style: ElevatedButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(50),
           
          ),
            primary: Color.fromARGB(255, 142, 162, 253),
          elevation: 0,
          minimumSize: Size(70, 60), // Increase the button's height and width
        ),
        onPressed: _saveToFirestore,
        child: const Text('Register', style: TextStyle(fontSize: 19.0, fontWeight: FontWeight.bold, color: Colors.white)),
      ),
    
          ],
        ),
      ),
      ),
    );
  }
}

