import 'dart:developer';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:learn_provider/navbar/color_utils.dart';
import 'package:learn_provider/navbar/getx_controller/common_controller.dart';
import 'package:learn_provider/navbar/image.dart';
import 'package:learn_provider/navbar/login_screen.dart';
import 'package:learn_provider/navbar/svg_icons.dart';
import 'package:learn_provider/navbar/svgs_constants.dart';

class MyProfile extends StatefulWidget {
  const MyProfile({Key? key}) : super(key: key);

  @override
  State<MyProfile> createState() => _MyProfileState();
}

class _MyProfileState extends State<MyProfile> {
  final commonControllerCnt = Get.put(CommonController());

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Scaffold(
        floatingActionButton: FloatingActionButton(
          backgroundColor: ColorUtil.primaryColor,
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
        body: SingleChildScrollView(
          child: Column(
            children: [
              Stack(
                clipBehavior: Clip.none,
                alignment: Alignment.bottomCenter,
                children: [
                  Stack(
                    alignment: Alignment.topCenter,
                    children: [
                      SizedBox(
                        height: 333,
                        width: MediaQuery.of(context).size.width,
                        child:
                            commonControllerCnt.selectedImagePath.value.isEmpty
                                ? Image.network(
                                    "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSc0_omJ2-eS5BlX2AbhraGobrYXUt3GKYTDA&usqp=CAU",
                                    fit: BoxFit.cover,
                                  )
                                : Image.file(
                                    File(commonControllerCnt
                                        .selectedImagePath.value),
                                    fit: BoxFit.cover,
                                  ),
                      ),
                      Container(
                        height: 333,
                        width: MediaQuery.of(context).size.width,
                        // color: Colors.purple.withOpacity(0.69),
                        color: ColorUtil.secondaryColor.withOpacity(0.69),
                      ),
                      const Positioned(
                        top: 21,
                        child: Text(
                          "P R O F I L E",
                          style: TextStyle(
                              // color: Colors.white,
                              color: ColorUtil.primaryColor,
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
                          image: commonControllerCnt
                                  .selectedImagePath.value.isEmpty
                              ? const DecorationImage(
                                  image: NetworkImage(
                                      "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSc0_omJ2-eS5BlX2AbhraGobrYXUt3GKYTDA&usqp=CAU"),
                                  fit: BoxFit.cover)
                              : DecorationImage(
                                  image: FileImage(File(commonControllerCnt
                                      .selectedImagePath.value)),
                                  fit: BoxFit.cover),
                          // color: Colors.red,
                          shape: BoxShape.circle),
                    ),
                  ),
                  const Positioned(
                    bottom: -100,
                    child: Chip(
                      elevation: 2.0,
                      // shadowColor: ColorUtil.primaryColor,
                      label: Padding(
                        padding: EdgeInsets.all(4.0),
                        child: Row(
                          children: [
                            SvgIcon(
                              Images.edit,
                              height: 17,
                            ),
                            SizedBox(width: 10),
                            Text(
                              "Edit",
                              style: TextStyle(
                                fontSize: 18,
                                color: ColorUtil.primaryColor,
                              ),
                            ),
                          ],
                        ),
                      ),
                      backgroundColor: ColorUtil.secondaryColor,
                    ),

                    // child: Container(
                    //   height: 50,
                    //   width: 50,
                    //   decoration: BoxDecoration(
                    //       border: Border.all(color: Colors.white, width: 5.0),
                    //       color: Colors.black,
                    //       shape: BoxShape.circle),
                    //   child: InkWell(
                    //     onTap: () {
                    //       Get.defaultDialog(
                    //         title: "Select Your Source",
                    //         content: Row(
                    //           mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    //           children: [
                    //             MaterialButton(
                    //               onPressed: () {
                    //                 commonControllerCnt
                    //                     .getImage(ImageSource.gallery);
                    //                 commonControllerCnt.isImageSelected.value =
                    //                     true;
                    //                 Get.back();
                    //               },
                    //               child: Container(
                    //                   height: 50,
                    //                   width: 80,
                    //                   decoration: BoxDecoration(
                    //                       color: Colors.blueAccent[100],
                    //                       borderRadius:
                    //                           BorderRadius.circular(12.0)),
                    //                   child:
                    //                       const Center(child: Text("Gallery"))),
                    //             ),
                    //             MaterialButton(
                    //               onPressed: () {
                    //                 commonControllerCnt
                    //                     .getImage(ImageSource.camera);
                    //                 Get.back();
                    //               },
                    //               child: Container(
                    //                   height: 50,
                    //                   width: 80,
                    //                   decoration: BoxDecoration(
                    //                       color: Colors.green[300],
                    //                       borderRadius:
                    //                           BorderRadius.circular(12.0)),
                    //                   child: const Center(child: Text("Camera"))),
                    //             )
                    //           ],
                    //         ),
                    //       );
                    //     },
                    //     child: Padding(
                    //       padding: const EdgeInsets.all(8.0),
                    //       child: Image.network(
                    //           "https://cdn-icons-png.flaticon.com/128/8113/8113880.png"),
                    //     ),
                    //   ),
                    // ),
                  )
                ],
              ),
              const SizedBox(height: 150),
              Text(commonControllerCnt.nameController.value.text[0]
                  .toUpperCase()),
              commonControllerCnt.selectedImagePath.value.isEmpty
                  ? const Text("EMPTY")
                  : const Text("IMAGE"),
              // Card(
              //   elevation: 4.0,
              //   margin: const EdgeInsets.all(30.0),
              //   shadowColor: ColorUtil.secondaryColor,
              //   child: Padding(
              //     padding: const EdgeInsets.all(15.0),
              //     child: Column(
              //       children: [
              //         Row(
              //           mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //           children: [
              //             const Text(
              //               "NAME : ",
              //               style: TextStyle(
              //                   fontSize: 21, fontWeight: FontWeight.bold),
              //             ),
              //             const Spacer(),
              //             Expanded(
              //                 child: Text(
              //                     maxLines: 2,
              //                     textAlign: TextAlign.end,
              //                     overflow: TextOverflow.ellipsis,
              //                     commonControllerCnt.nameController.value.text))
              //           ],
              //         ),
              //         const Divider(
              //           // color: Colors.deepPurple,
              //           color: ColorUtil.secondaryColor,
              //         ),
              //         Row(
              //           mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //           children: [
              //             const Text(
              //               "ADDRESS : ",
              //               style: TextStyle(
              //                   fontSize: 21, fontWeight: FontWeight.bold),
              //             ),
              //             const Spacer(),
              //             Expanded(
              //                 child: Text(
              //               maxLines: 3,
              //               textAlign: TextAlign.end,
              //               overflow: TextOverflow.ellipsis,
              //               commonControllerCnt.addressController.value.text,
              //             ))
              //           ],
              //         ),
              //         const Divider(
              //           // color: Colors.deepPurple,
              //           color: ColorUtil.secondaryColor,
              //         ),
              //         Row(
              //           mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //           children: [
              //             const Text(
              //               "MOBILE NUMBER : ",
              //               style: TextStyle(
              //                   fontSize: 21, fontWeight: FontWeight.bold),
              //             ),
              //             const Spacer(),
              //             Text(commonControllerCnt
              //                 .mobileNumberController.value.text)
              //           ],
              //         ),
              //       ],
              //     ),
              //   ),
              // ),
              const SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  children: [
                    ClipRRect(
                      borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(8),
                          topRight: Radius.circular(8),
                          bottomLeft: Radius.circular(8),
                          bottomRight: Radius.circular(8)),
                      child: Container(
                        // color: ColorUtil.secondaryColor.withOpacity(0.4),
                        color: Colors.grey.shade200,
                        padding: const EdgeInsets.symmetric(
                            horizontal: 12, vertical: 16),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Expanded(
                              child: Row(
                                children: [
                                  const Icon(Icons.person),
                                  const SizedBox(width: 8.0),
                                  Text(
                                    'NAME',
                                    style: TextStyle(
                                        color: Theme.of(context)
                                            .snackBarTheme
                                            .backgroundColor,
                                        fontWeight: FontWeight.w600),
                                  ),
                                ],
                              ),
                            ),
                            Expanded(
                              child: Text(
                                textAlign: TextAlign.end,
                                overflow: TextOverflow.visible,
                                commonControllerCnt.nameController.value.text,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(height: 10.0),
                    ClipRRect(
                      borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(8),
                          topRight: Radius.circular(8),
                          bottomLeft: Radius.circular(8),
                          bottomRight: Radius.circular(8)),
                      child: Container(
                        // color: ColorUtil.secondaryColor.withOpacity(0.4),
                        color: Colors.grey.shade200,
                        padding: const EdgeInsets.symmetric(
                            horizontal: 12, vertical: 16),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Expanded(
                              child: Row(
                                children: [
                                  const Icon(Icons.person),
                                  const SizedBox(width: 8.0),
                                  Text(
                                    'ADDRESS',
                                    style: TextStyle(
                                        color: Theme.of(context)
                                            .snackBarTheme
                                            .backgroundColor,
                                        fontWeight: FontWeight.w600),
                                  ),
                                ],
                              ),
                            ),
                            Expanded(
                              child: Text(
                                textAlign: TextAlign.end,
                                overflow: TextOverflow.visible,
                                commonControllerCnt
                                    .addressController.value.text,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(height: 10.0),
                    ClipRRect(
                      borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(8),
                          topRight: Radius.circular(8),
                          bottomLeft: Radius.circular(8),
                          bottomRight: Radius.circular(8)),
                      child: Container(
                        // color: ColorUtil.secondaryColor.withOpacity(0.4),
                        color: Colors.grey.shade200,
                        padding: const EdgeInsets.symmetric(
                            horizontal: 12, vertical: 16),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Expanded(
                              child: Row(
                                children: [
                                  const Icon(Icons.person),
                                  const SizedBox(width: 8.0),
                                  Text(
                                    'MOBILE NUMBER',
                                    style: TextStyle(
                                        color: Theme.of(context)
                                            .snackBarTheme
                                            .backgroundColor,
                                        fontWeight: FontWeight.w600),
                                  ),
                                ],
                              ),
                            ),
                            Expanded(
                              child: Text(
                                textAlign: TextAlign.end,
                                overflow: TextOverflow.visible,
                                commonControllerCnt
                                    .mobileNumberController.value.text,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
