import 'dart:io';
import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter/foundation.dart';
import 'package:image_picker/image_picker.dart';
import 'package:learn_provider/category_model.dart';
import 'package:learn_provider/color_controller.dart';
import 'package:learn_provider/category_provider.dart';
import 'package:learn_provider/common_text_field.dart';

class AddCategoryScreen extends StatefulWidget {
  const AddCategoryScreen({Key? key}) : super(key: key);

  @override
  State<AddCategoryScreen> createState() => _AddCategoryScreenState();
}

class _AddCategoryScreenState extends State<AddCategoryScreen> {
  TextEditingController adminController = TextEditingController();
  TextEditingController descController = TextEditingController();
  File? _pickedImage;
  Uint8List webImage = Uint8List(8);

  String convertUint8ListToString(Uint8List uint8list) {
    return String.fromCharCodes(uint8list);
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    // double width = size.width;
    double height = size.height;
    return Consumer<CategoryProvider>(
      builder: (context, provider, child) {
        return Scaffold(
          body: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    IconButton(
                      onPressed: () => provider.forCategory(),
                      icon: const Icon(
                        Icons.arrow_back,
                      ),
                    ),
                  ],
                ),
                Expanded(
                  child: ListView(
                    children: [
                      Center(
                        child: SizedBox(
                          height: 500,
                          width: 500,
                          child: InkWell(
                            onTap: () {
                              _pickImage();
                              print(
                                  "WEB URL ${convertUint8ListToString(webImage).toString()}");
                              print("ANDROID URL ${_pickedImage.toString()}");
                            },
                            child: _pickedImage == null
                                ? Container(
                                    height: 500,
                                    width: 500,
                                    color: ColorController.buttonColor,
                                  )
                                : kIsWeb
                                    ? Image.memory(
                                        webImage,
                                        fit: BoxFit.cover,
                                      )
                                    : Image.file(
                                        _pickedImage!,
                                        fit: BoxFit.cover,
                                      ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: height * 0.050,
                      ),
                      CommonTextField(
                        controller: adminController,
                        prefixIcon: const Icon(
                          Icons.person,
                        ),
                        hintText: "Enter Admin Name",
                      ),
                      SizedBox(
                        height: height * 0.050,
                      ),
                      CommonTextField(
                        controller: descController,
                        prefixIcon: const Icon(
                          Icons.person,
                        ),
                        hintText: "Enter Description",
                        minLines: 3,
                        maxLines: 5,
                      ),
                      SizedBox(
                        height: height * 0.050,
                      ),
                      ElevatedButton(
                        style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all<Color>(
                              ColorController.buttonColor),
                        ),
                        onPressed: () {
                          provider.addDummyItems(
                            CategoryModel(
                              favourite: "Love",
                              name: "Ezra Miller",
                              desc: descController.text,
                              member: 3,
                              // profileImg: convertUint8ListToString(webImage),

                              /// For Android

                              profileImg: _pickedImage.toString(),

                              /// For WEB

                              // profileImg: "convertUint8ListToString(webImage)",

                              status: "Done",
                              option: "Edit",
                              admin: adminController.text,
                            ),
                          );
                          provider.forCategory();
                        },
                        child: const Text(
                          "Add Data",
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Future<void> _pickImage() async {
    if (!kIsWeb) {
      final ImagePicker picker = ImagePicker();
      XFile? image = await picker.pickImage(
        source: ImageSource.gallery,
      );
      if (image != null) {
        var selected = File(image.path);
        setState(() {
          _pickedImage = selected;
        });
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content: Text('Image Selected Successfully'),
        ));
      } else {
        log(
          "No image has been picked",
        );
      }
    } else if (kIsWeb) {
      final ImagePicker picker = ImagePicker();
      XFile? image = await picker.pickImage(
        source: ImageSource.gallery,
      );
      if (image != null) {
        var f = await image.readAsBytes();
        setState(() {
          webImage = f;
          _pickedImage = File("a");
        });
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content: Text('Image Selected Successfully'),
        ));
      } else {
        log(
          "No image has been picked",
        );
      }
    } else {
      log(
        "Something went wrong",
      );
    }
  }
}
