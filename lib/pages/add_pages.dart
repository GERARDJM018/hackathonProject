import 'dart:io';

import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:image_picker/image_picker.dart';

class AddPages extends StatefulWidget {
  AddPages({super.key});
  @override
  _AddPagesState createState() => _AddPagesState();
}

class _AddPagesState extends State<AddPages> {

  final TextEditingController _controllerTitle = TextEditingController();
  final TextEditingController _controllerBody = TextEditingController();
  final TextEditingController _controllerPlatform = TextEditingController();

  final List<String> categoryItems = ['SMS Phising', 'Email Phising', 'Credit Card Scams', 'Payment Fraud', 'Prize Draw Scams', 'Others'];

  String selectedValue = "Others";
  File? _image;

  Future<void> _pickImage() async {
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
      appBar: CupertinoNavigationBar(trailing: TextButton(child: Text("Add", style: TextStyle(fontSize: 20),), onPressed: (){},),),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 0),
              child: TextFormField(
                controller: _controllerTitle,
                style: TextStyle(fontSize: 32),
                decoration: InputDecoration(
                  hintStyle: TextStyle(fontSize: 32),
                  hintText: "Title",
                  border: InputBorder.none), expands: false, maxLines: null, minLines: 1,),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 0),
              child: TextFormField(
                controller: _controllerBody,
                style: TextStyle(fontSize: 20),
                decoration: InputDecoration(
                  labelStyle: TextStyle(fontSize: 20),
                  hintStyle: TextStyle(fontSize: 20),
                  hintText: "Body",
                  border: InputBorder.none), expands: false, maxLines: null, minLines: 1,),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4),
              child: Container(
                width: MediaQuery.of(context).size.width * 0.4,
                child: DropdownButtonFormField2<String>(
                  isExpanded: true,
                  decoration: InputDecoration(
                    // Add Horizontal padding using menuItemStyleData.padding so it matches
                    // the menu padding when button's width is not specified.
                    contentPadding: const EdgeInsets.symmetric(vertical: 16),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                    // Add more decoration..
                  ),
                  hint: const Text(
                    'Scam Category',
                    style: TextStyle(fontSize: 14),
                  ),
                  items: categoryItems
                      .map((item) => DropdownMenuItem<String>(
                            value: item,
                            child: Text(
                              item,
                              style: const TextStyle(
                                fontSize: 14,
                              ),
                            ),
                          ))
                      .toList(),
                  validator: (value) {
                    if (value == null) {
                      return 'Please select category.';
                    }
                    return null;
                  },
                  onChanged: (value) {
                    //Do something when selected item is changed.
                  },
                  onSaved: (value) {
                    selectedValue = value.toString();
                  },
                  buttonStyleData: const ButtonStyleData(
                    padding: EdgeInsets.only(right: 8),
                  ),
                  iconStyleData: const IconStyleData(
                    icon: Icon(
                      Icons.arrow_drop_down,
                      color: Colors.black45,
                    ),
                    iconSize: 24,
                  ),
                  dropdownStyleData: DropdownStyleData(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                    ),
                  ),
                  menuItemStyleData: const MenuItemStyleData(
                    padding: EdgeInsets.symmetric(horizontal: 16),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 0),
              child: TextFormField(
                controller: _controllerPlatform,
                style: TextStyle(fontSize: 20),
                decoration: InputDecoration(
                  labelStyle: TextStyle(fontSize: 20),
                  hintStyle: TextStyle(fontSize: 20),
                  hintText: "Platform",
                  border: InputBorder.none), expands: false, maxLines: null, minLines: 1,),
            ),
            _image == null
              ? Center(child: Text('No evidence provided.'))
              : Center(child: Container(
                width: MediaQuery.of(context).size.width * 0.8,
                height: MediaQuery.of(context).size.height *0.3,
                child: Image.file(_image!))),
            SizedBox(height: 20),
            Center(
              child: ElevatedButton(
                onPressed: _pickImage,
                child: Text('Attach Image'),
              ),
            )          
          ],),
      ),
    );
  }
}