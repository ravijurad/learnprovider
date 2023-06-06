import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class MyImageScreen extends StatelessWidget {
  MyImageScreen({super.key});

  final imageController = Get.put(ImageController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: Container(
                  decoration: BoxDecoration(
                      border: Border.all(
                    width: 4,
                  )),
                  height: 400,
                  child: Center(
                      child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      InkWell(
                        onTap: () {
                          Get.defaultDialog(
                            title: "Select Your Source",
                            content: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                MaterialButton(
                                  onPressed: () {
                                    imageController
                                        .getImage(ImageSource.gallery);
                                    Get.back();
                                  },
                                  child: Container(
                                      height: 50,
                                      width: 80,
                                      decoration: BoxDecoration(
                                          color: Colors.blueAccent[100],
                                          borderRadius:
                                              BorderRadius.circular(12.0)),
                                      child:
                                          const Center(child: Text("Gallery"))),
                                ),
                                MaterialButton(
                                  onPressed: () {
                                    imageController
                                        .getImage(ImageSource.camera);
                                    Get.back();
                                  },
                                  child: Container(
                                      height: 50,
                                      width: 80,
                                      decoration: BoxDecoration(
                                          color: Colors.green[300],
                                          borderRadius:
                                              BorderRadius.circular(12.0)),
                                      child:
                                          const Center(child: Text("Camera"))),
                                )
                              ],
                            ),
                          );
                        },
                        child: Image.network(
                            "https://cdn-icons-png.flaticon.com/128/8113/8113880.png"),
                      ),
                      const SizedBox(
                        height: 21,
                      ),
                      Text(
                        "Select Image From\nCamera/Gallery",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            height: 1.4,
                            fontSize: 21,
                            color: Colors.amber[700]),
                      ),
                    ],
                  )),
                ),
              ),
              Obx(
                () => Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 12.0),
                  child: ListView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: imageController.myImageList.length,
                    itemBuilder: (BuildContext context, int index) {
                      return Padding(
                          padding: const EdgeInsets.symmetric(vertical: 12.0),
                          child: Stack(
                            children: [
                              Container(
                                  height: 400,
                                  width: double.infinity,
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                        width: 4, color: Colors.black),
                                  ),
                                  child: Image.file(
                                    File(imageController.myImageList[index]),
                                    fit: BoxFit.cover,
                                  )),
                              Positioned(
                                bottom: 12,
                                right: 12,
                                child: Container(
                                  decoration: BoxDecoration(
                                      border: Border.all(width: 2),
                                      borderRadius: BorderRadius.circular(12.0),
                                      gradient: const LinearGradient(
                                          begin: Alignment.topLeft,
                                          end: Alignment.bottomRight,
                                          colors: [
                                            Colors.red,
                                            Colors.yellow,
                                            Colors.green
                                          ])),
                                  child: Padding(
                                    padding: const EdgeInsets.all(12.0),
                                    child: Text(
                                      imageController.myImageSize[index],
                                      style: const TextStyle(
                                          fontSize: 21,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ));
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ImageController extends GetxController {
  var selectedImagePath = "".obs;
  var selectedImageSize = "".obs;
  var myImageList = [].obs;
  var myImageSize = [].obs;

  void getImage(ImageSource imageSource) async {
    final pickedFile = await ImagePicker().pickImage(source: imageSource);
    if (pickedFile != null) {
      selectedImagePath.value = pickedFile.path;
      myImageList.add(selectedImagePath.value);

      selectedImageSize.value =
          "${((File(selectedImagePath.value)).lengthSync() / 1024 / 1024).toStringAsFixed(2)} Mb";
      myImageSize.add(selectedImageSize.value);
    } else {
      Get.snackbar("Error", "No Image Has Been Selected",
          backgroundColor: Colors.red);
    }
  }
}
