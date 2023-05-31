import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:learn_provider/category_provider.dart';
import 'package:learn_provider/common_text_field.dart';

class IndividualDetailsCategoryScreen extends StatelessWidget {
  const IndividualDetailsCategoryScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<CategoryProvider>(
      builder: (context, provider, child) {
        return Scaffold(
          body: Padding(
            padding: const EdgeInsets.all(21.0),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(21.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          IconButton(
                            onPressed: () => provider.forCategory(),
                            icon: const Icon(
                              Icons.arrow_back,
                            ),
                          ),
                          const SizedBox(
                            width: 12.0,
                          ),
                          const Text(
                            "Detailed Profile",
                            style: TextStyle(
                              fontSize: 36,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          InkWell(
                            onHover: (value) {
                              provider.settingHover(value);
                            },
                            onTap: () {},
                            child: Container(
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(8.0),
                                  color:
                                      Colors.deepPurpleAccent.withOpacity(0.3),
                                  border: provider.setting == true
                                      ? Border.all(
                                          color: Colors.deepPurpleAccent)
                                      : Border.all(
                                          color: Colors.transparent, width: 0)),
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Row(
                                  children: [
                                    const Icon(
                                      Icons.settings,
                                      color: Colors.deepPurpleAccent,
                                    ),
                                    provider.setting == true
                                        ? const Text("  Setting",
                                            style: TextStyle(
                                                color: Colors.deepPurpleAccent))
                                        : const SizedBox(),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(
                            width: 12.0,
                          ),
                          InkWell(
                            onHover: (value) {
                              provider.notifyHover(value);
                            },
                            onTap: () {},
                            child: Container(
                              decoration: BoxDecoration(
                                color: Colors.red.withOpacity(0.3),
                                borderRadius: BorderRadius.circular(8.0),
                                border: provider.notify == true
                                    ? Border.all(color: Colors.red)
                                    : Border.all(
                                        color: Colors.transparent, width: 0),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Row(
                                  children: [
                                    const Icon(
                                      Icons.notifications,
                                      color: Colors.red,
                                    ),
                                    provider.notify == true
                                        ? const Text(
                                            " Notification",
                                            style: TextStyle(
                                              color: Colors.red,
                                            ),
                                          )
                                        : const SizedBox(),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(
                            width: 12.0,
                          ),
                          InkWell(
                            onHover: (value) {
                              provider.userNameHover(value);
                            },
                            onTap: () {},
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Row(
                                  children: [
                                    provider.userName == true
                                        ? Text(
                                            "${provider.individualList.first.name}  ",
                                            style: const TextStyle(
                                              fontSize: 18,
                                            ),
                                          )
                                        : const SizedBox(),
                                    Container(
                                      width: 40,
                                      height: 40,
                                      decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        image: DecorationImage(
                                          image: NetworkImage(
                                            provider
                                                .individualList.first.profileImg
                                                .toString(),
                                          ),
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                Divider(
                  color: Colors.grey.withOpacity(0.7),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 75.0, vertical: 17.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            "User profile",
                            style: TextStyle(
                              fontSize: 19,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(
                            height: 8.0,
                          ),
                          Text(
                            "${provider.individualList.first.name}",
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width / 1.3,
                  child: Divider(
                    color: Colors.grey.withOpacity(0.2),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 75.0, vertical: 17.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            "Admin profile",
                            style: TextStyle(
                              fontSize: 19,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(
                            height: 8.0,
                          ),
                          Text(
                            "${provider.individualList.first.admin}",
                          ),
                        ],
                      ),
                      SizedBox(
                        width: MediaQuery.of(context).size.width / 4,
                        child: const CommonTextField(
                          hintText: "Enter your admin name",
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width / 1.3,
                  child: Divider(
                    color: Colors.grey.withOpacity(0.2),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 75.0, vertical: 17.0),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            "Description",
                            style: TextStyle(
                              fontSize: 19,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(
                            height: 8.0,
                          ),
                          Text(
                            "${provider.individualList.first.desc}",
                          ),
                        ],
                      ),
                      SizedBox(
                        width: MediaQuery.of(context).size.width / 4,
                        child: const CommonTextField(
                          hintText: "Enter your description here",
                          maxLines: 5,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width / 1.3,
                  child: Divider(
                    color: Colors.grey.withOpacity(0.2),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 75.0, vertical: 17.0),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            "Member",
                            style: TextStyle(
                              fontSize: 19,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(
                            height: 8.0,
                          ),
                          Text(
                            "${provider.individualList.first.member}",
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width / 1.3,
                  child: Divider(
                    color: Colors.grey.withOpacity(0.2),
                  ),
                ),
                // Padding(
                //   padding: const EdgeInsets.symmetric(
                //       horizontal: 75.0, vertical: 17.0),
                //   child: Row(
                //     crossAxisAlignment: CrossAxisAlignment.start,
                //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                //     children: [
                //       Column(
                //         crossAxisAlignment: CrossAxisAlignment.start,
                //         children: [
                //           const Text("Status",
                //               style: TextStyle(
                //                   fontSize: 19, fontWeight: FontWeight.bold)),
                //           const SizedBox(height: 8.0),
                //           Container(
                //               padding: const EdgeInsets.all(5.0),
                //               decoration: BoxDecoration(
                //                   color: widget.individualDetails!.status ==
                //                           "Done"
                //                       ? Colors.lightGreenAccent.withOpacity(0.4)
                //                       : Colors.cyanAccent.withOpacity(0.4),
                //                   borderRadius: BorderRadius.circular(5.0)),
                //               child: Row(
                //                 children: [
                //                   widget.individualDetails!.status == "Done"
                //                       ? const Icon(
                //                           Icons.check_circle_outline_sharp,
                //                           color: Colors.green)
                //                       : const Icon(Icons.access_time_sharp,
                //                           color: Colors.blue),
                //                   const SizedBox(width: 5.0),
                //                   Text(
                //                       widget.individualDetails!.status.toString(),
                //                       overflow: TextOverflow.ellipsis,
                //                       style: TextStyle(
                //                           color:
                //                               widget.individualDetails!.status ==
                //                                       "Done"
                //                                   ? Colors.green
                //                                   : Colors.blue)),
                //                 ],
                //               )),
                //         ],
                //       ),
                //     ],
                //   ),
                // ),
              ],
            ),
          ),
        );
      },
    );
  }
}
