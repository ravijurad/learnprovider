import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:learn_provider/navbar/getx_controller/common_controller.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({Key? key}) : super(key: key);

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  CommonController commonControllerCnt = Get.put(CommonController());

  @override
  void initState() {
    // TODO: implement initState
    commonControllerCnt.searchText.value = "";
    commonControllerCnt.search();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Scaffold(
        appBar: AppBar(
          elevation: 0.0,
          toolbarHeight: 100,
          title: SearchBar(
            trailing: [
              Padding(
                padding: const EdgeInsets.only(right: 12.0),
                child: commonControllerCnt.searchText.isEmpty
                    ? const Icon(
                        Icons.search,
                        color: Colors.black,
                      )
                    : InkWell(
                        onTap: () {
                          commonControllerCnt.searchController.value.clear();
                          commonControllerCnt.searchText.value = "";
                          commonControllerCnt.search();
                        },
                        child: const Icon(Icons.clear)),
              )
            ],
            hintText: "Search people by their name",
            textStyle: MaterialStateProperty.all<TextStyle>(
                const TextStyle(fontSize: 17)),
            controller: commonControllerCnt.searchController.value,
            elevation: MaterialStateProperty.all<double>(3.0),
            backgroundColor:
                MaterialStateProperty.all<Color>(Colors.purple.shade200),
            onChanged: (value) {
              commonControllerCnt.searchText.value = value;
              commonControllerCnt.search();
            },
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            children: [
              const SizedBox(height: 12.0),
              Expanded(
                child: ListView.builder(
                  physics: const BouncingScrollPhysics(),
                  itemCount: commonControllerCnt.searchList.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.only(bottom: 12.0),
                      child: Card(
                        elevation: 2.0,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 12.0, vertical: 12.0),
                          child: Row(
                            children: [
                              const CircleAvatar(
                                child: Icon(Icons.account_circle),
                              ),
                              const SizedBox(width: 12.0),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "${commonControllerCnt.searchList[index].name}",
                                      style: const TextStyle(
                                          fontSize: 17,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    const SizedBox(height: 8.0),
                                    Text(
                                      "${commonControllerCnt.searchList[index].address}",
                                      style:
                                          const TextStyle(color: Colors.grey),
                                    ),
                                  ],
                                ),
                              ),
                              InkWell(
                                onTap: () {
                                  print(
                                      "INDIVIDUAL DETAILS ${commonControllerCnt.searchList[index]}");
                                },
                                child: Chip(
                                  label: const Text("View Profile"),
                                  backgroundColor: Colors.yellow.shade300,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
