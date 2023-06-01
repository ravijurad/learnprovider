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
        appBar: AppBar(title: const Text("Search People"), elevation: 0.0),
        body: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            children: [
              Row(
                children: [
                  Expanded(
                    child: SizedBox(
                      height: 50,
                      child: SearchBar(
                        hintText: "Search People",
                        elevation: MaterialStateProperty.all<double>(3.0),
                        backgroundColor:
                            MaterialStateProperty.all<Color>(Colors.grey),
                        onChanged: (value) {
                          commonControllerCnt.searchText.value = value;
                          commonControllerCnt.search();
                        },
                      ),
                    ),
                  ),
                  const SizedBox(width: 10.0),
                  InkWell(
                    onTap: () {
                      commonControllerCnt.search();
                    },
                    child: Container(
                        height: 50,
                        width: 50,
                        decoration: const BoxDecoration(
                            color: Colors.grey, shape: BoxShape.circle),
                        child: const Icon(Icons.search)),
                  ),
                ],
              ),
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
                              Chip(
                                label: const Text("View Profile"),
                                backgroundColor: Colors.yellow.shade300,
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
