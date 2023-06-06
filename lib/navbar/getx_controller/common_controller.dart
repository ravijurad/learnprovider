import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:learn_provider/navbar/people_model.dart';

class CommonController extends GetxController {
  final formKey = GlobalKey<FormState>();

  Rx<PageController> pageController = PageController().obs;
  Rx<TextEditingController> nameController = TextEditingController().obs;
  Rx<TextEditingController> searchController = TextEditingController().obs;
  Rx<TextEditingController> addressController = TextEditingController().obs;
  Rx<TextEditingController> mobileNumberController =
      TextEditingController().obs;

  RxInt selectedIndex = 0.obs;

  RxBool isSearchingOn = false.obs;

  RxList<People> searchList = <People>[].obs;
  RxList<People> allPeopleList = <People>[].obs;

  RxString searchText = "".obs;

  void search() {
    if (searchText.value.isNotEmpty) {
      searchList.value = allPeopleList
          .where((user) => user.name.toString().toLowerCase().contains(
                searchText.value.toLowerCase(),
              ))
          .toList();
    } else {
      searchList.value = allPeopleList;
    }
  }

  /// IMAGE

  // https://cdn.pixabay.com/photo/2023/02/28/19/22/drawing-7821641_640.jpg

  var selectedImagePath = "".obs;
  RxBool isImageSelected = false.obs;

  void getImage(ImageSource imageSource) async {
    final pickedFile = await ImagePicker().pickImage(source: imageSource);
    if (pickedFile != null) {
      selectedImagePath.value = pickedFile.path;
    } else {
      Get.snackbar("Error", "No Image Has Been Selected",
          backgroundColor: Colors.red);
    }
  }
}
