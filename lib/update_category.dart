import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:learn_provider/color_controller.dart';
import 'package:learn_provider/category_provider.dart';
import 'package:learn_provider/common_text_field.dart';

class UpdateCategoryScreen extends StatelessWidget {
  const UpdateCategoryScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    double width = size.width;
    double height = size.height;
    return Consumer<CategoryProvider>(
      builder: (context, provider, child) {
        return Scaffold(
          body: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    IconButton(
                      onPressed: () => provider.forCategory(),
                      icon: const Icon(
                        Icons.arrow_back,
                      ),
                    ),
                  ],
                ),
                Expanded(
                  child: ListView(
                    children: [
                      Center(
                        child: Container(
                          width: width * 0.4,
                          height: width * 0.4,
                          color: ColorController.buttonColor,
                        ),
                      ),
                      SizedBox(
                        height: height * 0.050,
                      ),
                      const CommonTextField(
                        hintText: "Enter Category Name",
                        prefixIcon: Icon(
                          Icons.person,
                        ),
                      ),
                      SizedBox(
                        height: height * 0.050,
                      ),
                      const CommonTextField(
                        prefixIcon: Icon(
                          Icons.person,
                        ),
                        minLines: 3,
                        hintText: "Enter Description",
                        maxLines: 5,
                      ),
                      SizedBox(
                        height: height * 0.050,
                      ),
                      ElevatedButton(
                        style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all<Color>(
                              ColorController.buttonColor),
                        ),
                        onPressed: () => provider.forCategory(),
                        child: const Text(
                          "Update Data",
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
