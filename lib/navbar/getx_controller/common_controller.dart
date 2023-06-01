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

  RxList<People> allPeople = <People>[].obs;
}
