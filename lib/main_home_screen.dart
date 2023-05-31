import 'category_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:learn_provider/add_category.dart';
import 'package:learn_provider/view_category.dart';
import 'package:learn_provider/content_screen.dart';
import 'package:learn_provider/update_category.dart';
import 'package:learn_provider/category_screen.dart';

class MainHomeScreen extends StatelessWidget {
  const MainHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<CategoryProvider>(
      builder: (context, provider, child) {
        return Scaffold(
          body: Row(
            children: [
              Container(
                color: Colors.grey.withOpacity(0.2),
                width: MediaQuery.of(context).size.width / 5.9,
                child: Column(
                  children: [
                    Container(
                      margin: const EdgeInsets.all(12.0),
                      decoration: BoxDecoration(
                        color: provider.isContent == true
                            ? Colors.white
                            : Colors.transparent,
                      ),
                      child: ListTile(
                        onTap: () {
                          provider.contentWidget();
                        },
                        title: const Text(
                          "Content",
                        ),
                      ),
                    ),
                    const Divider(),
                    Container(
                      margin: const EdgeInsets.all(12.0),
                      decoration: BoxDecoration(
                        color: provider.isCategory == true
                            ? Colors.white
                            : Colors.transparent,
                      ),
                      child: ListTile(
                        onTap: () {
                          provider.categoryWidget();
                          provider.individualList.clear();
                          provider.inProgressList();
                          provider.onlyInProgress = !provider.onlyInProgress;
                        },
                        title: const Text(
                          "Category",
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: provider.isContent == true
                    ? const ContentScreen()
                    : shuffleScreen(provider.index),
              ),
            ],
          ),
        );
      },
    );
  }
}

shuffleScreen(index) {
  if (index == 0) {
    return const CategoryScreen();
  } else if (index == 1) {
    return const AddCategoryScreen();
  } else if (index == 2) {
    return const UpdateCategoryScreen();
  } else if (index == 3) {
    return const IndividualDetailsCategoryScreen();
  }
}
