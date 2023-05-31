import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter/foundation.dart';
import 'package:learn_provider/category_provider.dart';

class CategoryScreen extends StatelessWidget {
  const CategoryScreen({Key? key}) : super(key: key);

  Uint8List convertStringToUint8List(String str) {
    final List<int> codeUnits = str.codeUnits;
    final Uint8List unit8List = Uint8List.fromList(codeUnits);

    return unit8List;
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<CategoryProvider>(
      builder: (context, provider, child) {
        return Scaffold(
          appBar: AppBar(
            title: Text(provider.onlyInProgress
                ? "In Progress List ( Length : ${provider.progressList.length} )"
                : "Category List ( Length : ${provider.lengthOfList} )"),
          ),
          floatingActionButton: FloatingActionButton(
            onPressed: () => provider.forAdd(),
            child: const Icon(
              Icons.add,
            ),
          ),
          body: SingleChildScrollView(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(21.0),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(21.0),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(
                            top: 21.0,
                            left: 44.0,
                            right: 44.0,
                            bottom: 21.0,
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              IntrinsicHeight(
                                child: Row(
                                  children: [
                                    Column(
                                      children: [
                                        Text(
                                          "${provider.lengthOfList - provider.progressList.length}",
                                          style: const TextStyle(
                                            fontSize: 44,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        const Text(
                                          "\nDone",
                                        ),
                                      ],
                                    ),
                                    const SizedBox(
                                      width: 36.0,
                                    ),
                                    VerticalDivider(
                                      color: Colors.grey.withOpacity(0.2),
                                      thickness: 1.5,
                                    ),
                                    const SizedBox(
                                      width: 36.0,
                                    ),
                                    Column(
                                      children: [
                                        Text(
                                          "${provider.progressList.length}",
                                          style: const TextStyle(
                                            fontSize: 44,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        const Text(
                                          "\nIn progress",
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),

                              /// For Filter
                              Wrap(
                                spacing: 12.0,
                                runSpacing: 12.0,
                                direction: Axis.horizontal,
                                children: provider.chipList
                                    .map(
                                      (e) => Padding(
                                        padding: const EdgeInsets.only(
                                          left: 10,
                                          right: 5,
                                        ),
                                        child: FilterChip(
                                          label: Text(
                                            e.label!,
                                          ),
                                          labelStyle: TextStyle(
                                            color: e.isSelected!
                                                ? Colors.white
                                                : Colors.black,
                                            fontSize: 16,
                                          ),
                                          backgroundColor: e.color,
                                          selected: e.isSelected!,
                                          showCheckmark: false,
                                          avatar: e.isSelected!
                                              ? const Icon(
                                                  Icons
                                                      .local_fire_department_rounded,
                                                  color:
                                                      Colors.deepPurpleAccent,
                                                )
                                              : null,
                                          selectedColor: Colors.black,
                                          onSelected: (value) {
                                            e.isSelected = value;
                                            for (var element
                                                in provider.categoryList) {
                                              if (element.favourite == "Sad" &&
                                                  e.label == "Sad") {
                                                if (e.isSelected == true &&
                                                    e.label == "Sad") {
                                                  provider.forAddFilterList(
                                                      element);
                                                } else {
                                                  provider.forRemoveFilterList(
                                                      element);
                                                }
                                              } else if (element.favourite ==
                                                      "Instrumental" &&
                                                  e.label == "Instrumental") {
                                                if (e.isSelected == true &&
                                                    e.label == "Instrumental") {
                                                  provider.forAddFilterList(
                                                      element);
                                                } else {
                                                  provider.forRemoveFilterList(
                                                      element);
                                                }
                                              } else if (element.favourite ==
                                                      "Love" &&
                                                  e.label == "Love") {
                                                if (e.isSelected == true &&
                                                    e.label == "Love") {
                                                  provider.forAddFilterList(
                                                      element);
                                                } else {
                                                  provider.forRemoveFilterList(
                                                      element);
                                                }
                                              } else if (element.favourite ==
                                                      "DJ" &&
                                                  e.label == "DJ") {
                                                if (e.isSelected == true &&
                                                    e.label == "DJ") {
                                                  provider.forAddFilterList(
                                                      element);
                                                } else {
                                                  provider.forRemoveFilterList(
                                                      element);
                                                }
                                              } else if (element.favourite ==
                                                      "Hip-Hop" &&
                                                  e.label == "Hip-Hop") {
                                                if (e.isSelected == true &&
                                                    e.label == "Hip-Hop") {
                                                  provider.forAddFilterList(
                                                      element);
                                                } else {
                                                  provider.forRemoveFilterList(
                                                      element);
                                                }
                                              } else if (element.favourite ==
                                                      "Party" &&
                                                  e.label == "Party") {
                                                if (e.isSelected == true &&
                                                    e.label == "Party") {
                                                  provider.forAddFilterList(
                                                      element);
                                                } else {
                                                  provider.forRemoveFilterList(
                                                      element);
                                                }
                                              }
                                            }
                                          },
                                        ),
                                      ),
                                    )
                                    .toList(),
                              ),

                              /// For Filter
                              Row(
                                children: [
                                  Checkbox(
                                    value: provider.onlyInProgress,
                                    onChanged: (bool? value) {
                                      provider.inProgressList();
                                    },
                                  ),
                                  const SizedBox(
                                    width: 12.0,
                                  ),
                                  const Text(
                                    "In Progress",
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                            top: 21.0,
                            left: 44.0,
                            right: 44.0,
                            bottom: 21.0,
                          ),
                          child: SingleChildScrollView(
                            physics: const BouncingScrollPhysics(),
                            scrollDirection: provider.forDesktop(context)
                                ? Axis.horizontal
                                : Axis.vertical,
                            child: Theme(
                              data: Theme.of(context).copyWith(
                                dividerColor: const Color(0xffE6EAEE),
                              ),
                              child: provider.categoryList.isEmpty
                                  ? const Center(
                                      child: Text(
                                        "PLEASE ADD CATEGORY",
                                      ),
                                    )
                                  : DataTable(
                                      sortAscending: provider.isAscending,
                                      sortColumnIndex: provider.sortColumnIndex,
                                      border: const TableBorder(
                                        top: BorderSide(
                                          color: Color(0xffE6EAEE),
                                        ),
                                      ),
                                      headingTextStyle: const TextStyle(
                                        color: Colors.grey,
                                      ),
                                      showBottomBorder: true,
                                      columns: [
                                        DataColumn(
                                          onSort: (columnIndex, ascending) {
                                            provider.onSort(
                                                columnIndex, ascending);
                                          },
                                          label: const Text(
                                            "Name",
                                          ),
                                        ),
                                        DataColumn(
                                          onSort: (columnIndex, ascending) {
                                            provider.onSort(
                                                columnIndex, ascending);
                                          },
                                          label: const Text(
                                            "Admin Name",
                                          ),
                                        ),
                                        const DataColumn(
                                          label: Text(
                                            "Is active",
                                          ),
                                        ),
                                        DataColumn(
                                          onSort: (columnIndex, ascending) {
                                            provider.onSort(
                                                columnIndex, ascending);
                                          },
                                          label: const Text(
                                            "Description",
                                          ),
                                        ),
                                        const DataColumn(
                                          label: Text(
                                            "Favourite",
                                          ),
                                        ),
                                        const DataColumn(
                                          label: Text(
                                            "Image",
                                          ),
                                        ),
                                        const DataColumn(
                                          label: Text(
                                            "Option",
                                          ),
                                        ),
                                        const DataColumn(
                                          label: Text(
                                            "Play",
                                          ),
                                        ),
                                      ],
                                      rows: provider.filterList.isNotEmpty

                                          /// For Filtration

                                          ? provider.filterList.map(
                                              (item) {
                                                return DataRow(
                                                  cells: [
                                                    DataCell(
                                                      Text(
                                                        item.name!.toString(),
                                                      ),
                                                      onTap: () {
                                                        provider
                                                            .addIntoDetailsList(
                                                                item);
                                                        provider.forView();
                                                      },
                                                    ),
                                                    DataCell(
                                                      Text(
                                                        item.admin!,
                                                      ),
                                                    ),
                                                    DataCell(
                                                      Text(
                                                        item.status!.toString(),
                                                      ),
                                                    ),
                                                    DataCell(
                                                      Text(
                                                        item.desc!,
                                                      ),
                                                    ),
                                                    DataCell(
                                                      Text(
                                                        item.favourite!,
                                                      ),
                                                    ),
                                                    DataCell(
                                                      Container(
                                                        height: 40,
                                                        width: 40,
                                                        decoration:
                                                            BoxDecoration(
                                                          shape:
                                                              BoxShape.circle,
                                                          image:
                                                              DecorationImage(
                                                            image: NetworkImage(
                                                              item.profileImg!,
                                                            ),
                                                            fit: BoxFit.cover,
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                    DataCell(
                                                      PopupMenuButton<
                                                          OptionItem>(
                                                        icon: const Icon(
                                                          Icons.more_vert,
                                                        ),
                                                        initialValue:
                                                            provider.selected,
                                                        itemBuilder:
                                                            (BuildContext
                                                                    context) =>
                                                                <PopupMenuEntry<
                                                                    OptionItem>>[
                                                          PopupMenuItem<
                                                              OptionItem>(
                                                            onTap: () => provider
                                                                .forUpdate(),
                                                            value:
                                                                OptionItem.edit,
                                                            child: const Row(
                                                              children: [
                                                                Icon(
                                                                  Icons.edit,
                                                                ),
                                                                Spacer(),
                                                                Text(
                                                                  "Edit",
                                                                ),
                                                              ],
                                                            ),
                                                          ),
                                                          PopupMenuItem<
                                                              OptionItem>(
                                                            onTap: () {
                                                              provider
                                                                  .removeFromInProgressList(
                                                                      item);
                                                              provider
                                                                  .removeFromList(
                                                                      item);
                                                              provider
                                                                  .forRemoveFilterList(
                                                                      item);
                                                            },
                                                            value: OptionItem
                                                                .delete,
                                                            child: const Row(
                                                              children: [
                                                                Icon(
                                                                  Icons.delete,
                                                                ),
                                                                Spacer(),
                                                                Text(
                                                                  "Delete",
                                                                ),
                                                              ],
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                    DataCell(
                                                      const Icon(
                                                        Icons
                                                            .play_circle_outline_outlined,
                                                      ),
                                                      onTap: () {
                                                        // provider
                                                        //     .addIntoDetailsList(item);
                                                        // provider.forView();
                                                      },
                                                    ),
                                                  ],
                                                );
                                              },
                                            ).toList()
                                          : provider.onlyInProgress == true

                                              /// Only In Progress

                                              ? provider.progressList.map(
                                                  (item) {
                                                    return DataRow(
                                                      cells: [
                                                        DataCell(
                                                          Text(
                                                            item.name!
                                                                .toString(),
                                                          ),
                                                          onTap: () {
                                                            provider
                                                                .addIntoDetailsList(
                                                                    item);
                                                            provider.forView();
                                                          },
                                                        ),
                                                        DataCell(
                                                          Text(
                                                            item.admin!,
                                                          ),
                                                        ),
                                                        DataCell(
                                                          Text(
                                                            item.status!
                                                                .toString(),
                                                          ),
                                                        ),
                                                        DataCell(
                                                          Text(
                                                            item.desc!,
                                                          ),
                                                        ),
                                                        DataCell(
                                                          Text(
                                                            item.favourite!,
                                                          ),
                                                        ),
                                                        DataCell(
                                                          Container(
                                                            height: 40,
                                                            width: 40,
                                                            decoration:
                                                                BoxDecoration(
                                                              shape: BoxShape
                                                                  .circle,
                                                              image:
                                                                  DecorationImage(
                                                                image:
                                                                    NetworkImage(
                                                                  item.profileImg!,
                                                                ),
                                                                fit: BoxFit
                                                                    .cover,
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                        DataCell(
                                                          PopupMenuButton<
                                                              OptionItem>(
                                                            icon: const Icon(
                                                              Icons.more_vert,
                                                            ),
                                                            initialValue:
                                                                provider
                                                                    .selected,
                                                            itemBuilder: (BuildContext
                                                                    context) =>
                                                                <PopupMenuEntry<
                                                                    OptionItem>>[
                                                              PopupMenuItem<
                                                                  OptionItem>(
                                                                onTap: () =>
                                                                    provider
                                                                        .forUpdate(),
                                                                value:
                                                                    OptionItem
                                                                        .edit,
                                                                child:
                                                                    const Row(
                                                                  children: [
                                                                    Icon(
                                                                      Icons
                                                                          .edit,
                                                                    ),
                                                                    Spacer(),
                                                                    Text(
                                                                      "Edit",
                                                                    ),
                                                                  ],
                                                                ),
                                                              ),
                                                              PopupMenuItem<
                                                                  OptionItem>(
                                                                onTap: () {
                                                                  provider
                                                                      .removeFromInProgressList(
                                                                          item);
                                                                  provider
                                                                      .removeFromList(
                                                                          item);
                                                                },
                                                                value:
                                                                    OptionItem
                                                                        .delete,
                                                                child:
                                                                    const Row(
                                                                  children: [
                                                                    Icon(
                                                                      Icons
                                                                          .delete,
                                                                    ),
                                                                    Spacer(),
                                                                    Text(
                                                                      "Delete",
                                                                    ),
                                                                  ],
                                                                ),
                                                              ),
                                                            ],
                                                          ),
                                                        ),
                                                        DataCell(
                                                          const Icon(
                                                            Icons
                                                                .play_circle_outline_outlined,
                                                          ),
                                                          onTap: () {
                                                            // provider
                                                            //     .addIntoDetailsList(item);
                                                            // provider.forView();
                                                          },
                                                        ),
                                                      ],
                                                    );
                                                  },
                                                ).toList()

                                              /// Full List

                                              : provider.categoryList.map(
                                                  (item) {
                                                    return DataRow(
                                                      cells: [
                                                        DataCell(
                                                          Text(
                                                            item.name!
                                                                .toString(),
                                                          ),
                                                          onTap: () {
                                                            provider
                                                                .addIntoDetailsList(
                                                                    item);
                                                            provider.forView();
                                                          },
                                                        ),
                                                        DataCell(
                                                          Text(
                                                            item.admin!,
                                                          ),
                                                        ),
                                                        DataCell(
                                                          Text(
                                                            item.status!
                                                                .toString(),
                                                          ),
                                                        ),
                                                        DataCell(
                                                          Text(
                                                            item.desc!,
                                                          ),
                                                        ),
                                                        DataCell(
                                                          Text(
                                                            item.favourite!,
                                                          ),
                                                        ),
                                                        DataCell(
                                                          Container(
                                                            height: 40,
                                                            width: 40,

                                                            /// ORIGINAL
                                                            // decoration:
                                                            //     BoxDecoration(
                                                            //   shape: BoxShape
                                                            //       .circle,
                                                            //   image:
                                                            //       DecorationImage(
                                                            //           image:
                                                            //               NetworkImage(
                                                            //             item.profileImg!,
                                                            //           ),
                                                            //           fit: BoxFit
                                                            //               .cover),
                                                            // ),
                                                            /// ORIGINAL

                                                            child: kIsWeb
                                                                ? Image.memory(
                                                                    convertStringToUint8List(
                                                                        item.profileImg!),
                                                                    fit: BoxFit
                                                                        .cover,
                                                                  )
                                                                : Image.network(
                                                                    item.profileImg!,
                                                                    fit: BoxFit
                                                                        .cover,
                                                                  ),
                                                          ),
                                                        ),
                                                        DataCell(
                                                          PopupMenuButton<
                                                              OptionItem>(
                                                            icon: const Icon(
                                                              Icons.more_vert,
                                                            ),
                                                            initialValue:
                                                                provider
                                                                    .selected,
                                                            itemBuilder: (BuildContext
                                                                    context) =>
                                                                <PopupMenuEntry<
                                                                    OptionItem>>[
                                                              PopupMenuItem<
                                                                  OptionItem>(
                                                                onTap: () =>
                                                                    provider
                                                                        .forUpdate(),
                                                                value:
                                                                    OptionItem
                                                                        .edit,
                                                                child:
                                                                    const Row(
                                                                  children: [
                                                                    Icon(
                                                                      Icons
                                                                          .edit,
                                                                    ),
                                                                    Spacer(),
                                                                    Text(
                                                                      "Edit",
                                                                    ),
                                                                  ],
                                                                ),
                                                              ),
                                                              PopupMenuItem<
                                                                  OptionItem>(
                                                                onTap: () {
                                                                  provider
                                                                      .removeFromInProgressList(
                                                                          item);
                                                                  provider
                                                                      .removeFromList(
                                                                          item);
                                                                },
                                                                value:
                                                                    OptionItem
                                                                        .delete,
                                                                child:
                                                                    const Row(
                                                                  children: [
                                                                    Icon(
                                                                      Icons
                                                                          .delete,
                                                                    ),
                                                                    Spacer(),
                                                                    Text(
                                                                      "Delete",
                                                                    ),
                                                                  ],
                                                                ),
                                                              ),
                                                            ],
                                                          ),
                                                        ),
                                                        DataCell(
                                                          const Icon(
                                                            Icons
                                                                .play_circle_outline_outlined,
                                                          ),
                                                          onTap: () {
                                                            // provider
                                                            //     .addIntoDetailsList(item);
                                                            // provider.forView();
                                                          },
                                                        ),
                                                      ],
                                                    );
                                                  },
                                                ).toList(),
                                    ),
                            ),
                          ),
                        ),
                      ],
                    ),
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
