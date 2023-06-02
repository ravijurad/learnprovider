import 'package:get/get.dart';
import 'package:flutter/material.dart';
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
          child: Form(
            key: commonControllerCnt.formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                /// Name

                TextFormField(
                  controller: commonControllerCnt.nameController.value,
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.purple.shade100,
                    hintText: "Enter your name",
                    border: const OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(12.0)),
                      borderSide: BorderSide(color: Colors.red),
                    ),
                    errorBorder: const OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.red),
                      borderRadius: BorderRadius.all(Radius.circular(12.0)),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius:
                          const BorderRadius.all(Radius.circular(12.0)),
                      borderSide: BorderSide(color: Colors.purple.shade200),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius:
                          const BorderRadius.all(Radius.circular(12.0)),
                      borderSide: BorderSide(color: Colors.purple.shade900),
                    ),
                  ),
                  // validator: (value) {
                  //   if (value != "111") {
                  //     return "ddddd";
                  //   }
                  //   return null;
                  // },
                ),
                const SizedBox(height: 20.0),

                // /// Address
                //
                // TextFormField(
                //   controller: commonControllerCnt.addressController.value,
                //   decoration: InputDecoration(
                //     filled: true,
                //     fillColor: Colors.purple.shade100,
                //     hintText: "Enter your address",
                //     enabledBorder: OutlineInputBorder(
                //       borderRadius:
                //           const BorderRadius.all(Radius.circular(12.0)),
                //       borderSide: BorderSide(color: Colors.purple.shade200),
                //     ),
                //     focusedBorder: OutlineInputBorder(
                //       borderRadius:
                //           const BorderRadius.all(Radius.circular(12.0)),
                //       borderSide: BorderSide(color: Colors.purple.shade900),
                //     ),
                //     border: const OutlineInputBorder(
                //       borderRadius: BorderRadius.all(Radius.circular(12.0)),
                //       borderSide: BorderSide(color: Colors.red),
                //     ),
                //     errorBorder: const OutlineInputBorder(
                //       borderSide: BorderSide(color: Colors.red),
                //       borderRadius: BorderRadius.all(Radius.circular(12.0)),
                //     ),
                //   ),
                //   // validator: (value) {
                //   //   if (value != "111") {
                //   //     return "ddddd";
                //   //   }
                //   //   return null;
                //   // },
                // ),
                // const SizedBox(height: 20.0),

                /// Mobile Number

                TextFormField(
                  keyboardType: TextInputType.phone,
                  controller: commonControllerCnt.mobileNumberController.value,
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.purple.shade100,
                    hintText: "Enter your mobile number",
                    enabledBorder: OutlineInputBorder(
                      borderRadius:
                          const BorderRadius.all(Radius.circular(12.0)),
                      borderSide: BorderSide(color: Colors.purple.shade200),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius:
                          const BorderRadius.all(Radius.circular(12.0)),
                      borderSide: BorderSide(color: Colors.purple.shade900),
                    ),
                    border: const OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(12.0)),
                      borderSide: BorderSide(color: Colors.red),
                    ),
                    errorBorder: const OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.red),
                      borderRadius: BorderRadius.all(Radius.circular(12.0)),
                    ),
                  ),
                  // validator: (value) {
                  //   if (value != "111") {
                  //     return "ddddd";
                  //   }
                  //   return null;
                  // },
                ),
                const SizedBox(height: 40.0),
                ElevatedButton(
                  onPressed: () {
                    if (commonControllerCnt.formKey.currentState!.validate()) {
                      commonControllerCnt.allPeopleList.add(People(
                          name: commonControllerCnt.nameController.value.text,
                          address:
                              commonControllerCnt.addressController.value.text,
                          mobileNumber: commonControllerCnt
                              .mobileNumberController.value.text));
                      commonControllerCnt.selectedIndex.value = 0;
                      Navigator.pushAndRemoveUntil(
                          context,
                          MaterialPageRoute(
                            builder: (context) => MainScreen(),
                          ),
                          (route) => false);
                    }
                  },
                  child: const Text("LOGIN"),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
