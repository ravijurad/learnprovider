import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:learn_provider/navbar/getx_controller/common_controller.dart';
import 'package:learn_provider/navbar/login_screen.dart';

class MyProfile extends StatefulWidget {
  const MyProfile({Key? key}) : super(key: key);

  @override
  State<MyProfile> createState() => _MyProfileState();
}

class _MyProfileState extends State<MyProfile> {
  final commonControllerCnt = Get.put(CommonController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(
                  builder: (context) => LoginScreen(),
                ),
                (route) => false);

            commonControllerCnt.nameController.value.clear();
            commonControllerCnt.addressController.value.clear();
            commonControllerCnt.mobileNumberController.value.clear();
          },
          child: const Icon(Icons.logout),
        ),
        body: Column(
          children: [
            Stack(
              clipBehavior: Clip.none,
              alignment: Alignment.bottomCenter,
              children: [
                Stack(
                  alignment: Alignment.topCenter,
                  children: [
                    Container(
                      height: 333,
                      width: MediaQuery.of(context).size.width,
                      child: Image.network(
                        "https://cdn.pixabay.com/photo/2023/05/31/12/13/ai-generated-8031247_640.jpg",
                        fit: BoxFit.cover,
                      ),
                    ),
                    Container(
                      height: 333,
                      width: MediaQuery.of(context).size.width,
                      color: Colors.purple.withOpacity(0.69),
                    ),
                    const Positioned(
                      top: 21,
                      child: Text(
                        "P R O F I L E",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 25,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ],
                ),
                Positioned(
                    bottom: -88,
                    child: Container(
                      height: 180,
                      width: 180,
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.white, width: 5.0),
                          image: const DecorationImage(
                              image: NetworkImage(
                                  "https://cdn.pixabay.com/photo/2023/05/31/12/13/ai-generated-8031247_640.jpg"),
                              fit: BoxFit.cover),
                          // color: Colors.red,
                          shape: BoxShape.circle),
                    ))
              ],
            ),
          ],
        ));
  }
}
