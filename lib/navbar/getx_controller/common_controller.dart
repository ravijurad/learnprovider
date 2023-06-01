import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:learn_provider/navbar/people_model.dart';

class CommonController extends GetxController {
  Rx<TextEditingController> nameController = TextEditingController().obs;
  Rx<TextEditingController> addressController = TextEditingController().obs;
  Rx<TextEditingController> mobileNumberController =
      TextEditingController().obs;
  Rx<PageController> pageController = PageController().obs;

  RxInt selectedIndex = 0.obs;

  RxList<People> allPeopleList = <People>[].obs;

  RxString searchText = "".obs;
  final RxList<People> searchList = <People>[].obs;

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
}
