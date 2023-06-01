import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:learn_provider/navbar/getx_controller/common_controller.dart';
import 'package:learn_provider/navbar/home_screen.dart';
import 'package:learn_provider/navbar/people_model.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({Key? key}) : super(key: key);

  final commonControllerCnt = Get.put(CommonController());

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextField(
                controller: commonControllerCnt.nameController.value,
                decoration: const InputDecoration(hintText: "Enter your name"),
              ),
              TextField(
                controller: commonControllerCnt.addressController.value,
                decoration:
                    const InputDecoration(hintText: "Enter your address"),
              ),
              TextField(
                controller: commonControllerCnt.mobileNumberController.value,
                decoration:
                    const InputDecoration(hintText: "Enter your mobile number"),
              ),
              ElevatedButton(
                  onPressed: () {
                    commonControllerCnt.allPeopleList.add(People(
                        name: commonControllerCnt.nameController.value.text,
                        address:
                            commonControllerCnt.addressController.value.text,
                        mobileNumber: commonControllerCnt
                            .mobileNumberController.value.text));

                    print("ALL PEOPLE ${commonControllerCnt.allPeopleList}");

                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => MainScreen(),
                        ));
                  },
                  child: const Text("LOGIN"))
            ],
          ),
        ),
      ),
    );
  }
}
