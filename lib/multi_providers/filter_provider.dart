// import 'package:flutter/material.dart';
// import 'package:learn_provider/category_model.dart';
// import 'package:learn_provider/category_provider.dart';
//
// // enum OptionItem { edit, delete }
//
// class FilterProvider with ChangeNotifier {
//   OptionItem? _selectedMenu;
//   get selected => _selectedMenu;
//
//   /// For Favourites
//
// // FOR SELECTED
//
//   void forAddFilterList(CategoryModel element) {
//     filterList.add(element);
//     notifyListeners();
//   }
//
//   void forRemoveFilterList(CategoryModel element) {
//     filterList.remove(element);
//     notifyListeners();
//   }
//
// // FILTER LIST
//
//   final List<CategoryModel> _filterList = <CategoryModel>[];
//   List<CategoryModel> get filterList => _filterList;
//
// // CHIP LIST
//
//   List<FilterModel> get chipList => _chipList;
//   final List<FilterModel> _chipList = [
//     FilterModel(
//       label: "Sad",
//       isSelected: false,
//       color: Colors.blue,
//     ),
//     FilterModel(
//       label: "Love",
//       isSelected: false,
//       color: Colors.red,
//     ),
//     FilterModel(
//       label: "Hip-Hop",
//       isSelected: false,
//       color: Colors.tealAccent,
//     ),
//     FilterModel(
//       label: "Party",
//       isSelected: false,
//       color: Colors.purpleAccent,
//     ),
//     FilterModel(
//       label: "Instrumental",
//       isSelected: false,
//       color: Colors.orangeAccent,
//     ),
//     FilterModel(
//       label: "DJ",
//       isSelected: false,
//       color: Colors.cyanAccent,
//     ),
//   ];
//
//   List<CategoryModel> get categoryList => _categoryList;
//   int get lengthOfList => _categoryList.length;
//   List<CategoryModel> get individualList => _individualList;
//   final List<CategoryModel> _individualList = <CategoryModel>[];
//   void addIntoDetailsList(CategoryModel categoryModel) {
//     individualList.add(categoryModel);
//     notifyListeners();
//   }
//
//   final List<CategoryModel> _progressList = <CategoryModel>[];
//   List<CategoryModel> get progressList => _progressList;
//   int _index = 0;
//   get index => _index;
//   void removeFromInProgressList(CategoryModel? categoryModel) {
//     progressList.remove(categoryModel);
//     notifyListeners();
//   }
//
//   void forUpdate() {
//     _index = 2;
//     notifyListeners();
//   }
//
//   void forView() {
//     _index = 3;
//     notifyListeners();
//   }
//
//   void removeFromList(CategoryModel? categoryModel) {
//     categoryList.remove(categoryModel);
//     notifyListeners();
//   }
//
//   List<DataRow> getRowsForFilter(List<CategoryModel> filterList) =>
//       filterList.map((filter) {
//         return DataRow(
//           cells: [
//             DataCell(
//               Text(
//                 filter.name!.toString(),
//               ),
//               onTap: () {
//                 addIntoDetailsList(filter);
//                 forView();
//               },
//             ),
//             DataCell(
//               Text(
//                 filter.admin!,
//               ),
//             ),
//             DataCell(
//               Text(
//                 filter.status!.toString(),
//               ),
//             ),
//             DataCell(
//               Text(
//                 filter.desc!,
//               ),
//             ),
//             DataCell(
//               Text(
//                 filter.favourite!,
//               ),
//             ),
//             DataCell(
//               Container(
//                 height: 40,
//                 width: 40,
//                 decoration: BoxDecoration(
//                   shape: BoxShape.circle,
//                   image: DecorationImage(
//                     image: NetworkImage(
//                       "${filter.profileImg}",
//                     ),
//                     fit: BoxFit.cover,
//                   ),
//                 ),
//               ),
//             ),
//             DataCell(
//               PopupMenuButton<OptionItem>(
//                 icon: const Icon(
//                   Icons.more_vert,
//                 ),
//                 initialValue: selected,
//                 itemBuilder: (BuildContext context) =>
//                     <PopupMenuEntry<OptionItem>>[
//                   PopupMenuItem<OptionItem>(
//                     onTap: () => forUpdate(),
//                     value: OptionItem.edit,
//                     child: const Row(
//                       children: [
//                         Icon(
//                           Icons.edit,
//                         ),
//                         Spacer(),
//                         Text(
//                           "Edit",
//                         ),
//                       ],
//                     ),
//                   ),
//                   PopupMenuItem<OptionItem>(
//                     onTap: () {
//                       removeFromInProgressList(filter);
//                       removeFromList(filter);
//                       forRemoveFilterList(filter);
//                     },
//                     value: OptionItem.delete,
//                     child: const Row(
//                       children: [
//                         Icon(
//                           Icons.delete,
//                         ),
//                         Spacer(),
//                         Text(
//                           "Delete",
//                         ),
//                       ],
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//             DataCell(
//               const Icon(Icons.play_circle_outline_outlined),
//               onTap: () {
//                 // provider
//                 //     .addIntoDetailsList(item);
//                 // provider.forView();
//               },
//             ),
//           ],
//         );
//       }).toList();
//
//   final List<CategoryModel> _categoryList = <CategoryModel>[
//     CategoryModel(
//         name: "Ana De Arms",
//         admin: "Rockstar",
//         desc: "Schmieder has an official Parliamentary biography.",
//         favourite: "Sad",
//         member: 852,
//         option: "edit",
//         profileImg:
//             "https://cdn.pixabay.com/photo/2020/05/24/05/36/woman-5212479__340.png",
//         status: "In Progress"),
//     CategoryModel(
//         name: "Emelia Clark",
//         admin: "Dashing",
//         desc: "So far he hasn't relocated where he once saw the passage.",
//         favourite: "Instrumental",
//         member: 741,
//         option: "edit",
//         profileImg:
//             "https://cdn.pixabay.com/photo/2021/02/17/11/57/coffee-6023991_640.jpg",
//         status: "Done"),
//     CategoryModel(
//         name: "Clue Decker",
//         admin: "Immutable",
//         desc: "The filling text is used by graphic designers.",
//         favourite: "Love",
//         member: 963,
//         option: "edit",
//         profileImg:
//             "https://cdn.pixabay.com/photo/2023/04/05/19/46/photographer-7902219_640.jpg",
//         status: "Done"),
//     CategoryModel(
//         name: "Ela Lopez",
//         admin: "Energetic",
//         desc:
//             "Of course we know that to make it known to most was a publicity of the Sixties.",
//         favourite: "Love",
//         member: 21,
//         option: "edit",
//         profileImg:
//             "https://cdn.pixabay.com/photo/2023/04/21/15/42/portrait-7942151_640.jpg",
//         status: "In Progress"),
//     CategoryModel(
//         name: "Lucifer Morningstar",
//         admin: "Cosmic Energy",
//         desc: "Who has any right to find fault.",
//         favourite: "DJ",
//         member: 44,
//         option: "edit",
//         profileImg:
//             "https://cdn.pixabay.com/photo/2023/04/25/16/23/woman-7950568_640.jpg",
//         status: "In Progress"),
//     CategoryModel(
//         name: "Black Adam",
//         admin: "Justice Society",
//         desc: "He rejects pleasures to secure other greater pleasures.",
//         favourite: "Hip-Hop",
//         member: 69,
//         option: "edit",
//         profileImg:
//             "https://cdn.pixabay.com/photo/2023/04/08/15/06/portrait-7909587_640.jpg",
//         status: "In Progress"),
//     CategoryModel(
//         name: "Bruce Wayne",
//         admin: "Amanda Waller",
//         desc: "Nor again is there anyone who loves or pursues or desires.",
//         favourite: "Instrumental",
//         member: 56,
//         option: "edit",
//         profileImg:
//             "https://cdn.pixabay.com/photo/2023/04/02/03/24/lakeshore-7893531_640.jpg",
//         status: "Done"),
//     CategoryModel(
//         name: "Gal Godot",
//         admin: "The Suicide Squad",
//         desc: "These cases are perfectly simple and easy.",
//         favourite: "Instrumental",
//         member: 159,
//         option: "edit",
//         profileImg:
//             "https://cdn.pixabay.com/photo/2021/07/31/18/44/ellipse-6512786_640.jpg",
//         status: "In Progress"),
//     CategoryModel(
//         name: "Billy Batson",
//         admin: "The Watchmen",
//         desc: "Start collaborating and sharing organizational knowledge.",
//         favourite: "Sad",
//         member: 357,
//         option: "edit",
//         profileImg:
//             "https://cdn.pixabay.com/photo/2018/01/05/22/48/couple-3064048_640.jpg",
//         status: "Done"),
//     CategoryModel(
//         name: "Thia",
//         admin: "Ghosted",
//         desc: "It will render according to the consumed data.",
//         favourite: "Hip-Hop",
//         member: 1973,
//         option: "edit",
//         profileImg:
//             "https://cdn.pixabay.com/photo/2023/04/03/04/48/woman-7895953_640.jpg",
//         status: "In Progress"),
//     CategoryModel(
//         name: "Eleven",
//         admin: "Howard",
//         desc:
//             "It's nonsense allows the eye to focus only on the graphic layout.",
//         favourite: "Instrumental",
//         member: 47,
//         option: "edit",
//         profileImg:
//             "https://cdn.pixabay.com/photo/2013/04/01/07/48/shield-98378_1280.jpg",
//         status: "In Progress"),
//     CategoryModel(
//         name: "Margot Robbie",
//         admin: "Comic Verse",
//         desc: "World War II deception plan to cover the invasion of Sicily.",
//         favourite: "Party",
//         member: 1956,
//         option: "edit",
//         profileImg:
//             "https://cdn.pixabay.com/photo/2019/03/22/06/56/girl-4072583_640.jpg",
//         status: "Done"),
//     CategoryModel(
//         name: "Tom Ellis",
//         admin: "Men Of Culture",
//         desc: "Vonnegut was not happy about the publication of Farmer's book",
//         favourite: "Instrumental",
//         member: 1559,
//         option: "edit",
//         profileImg:
//             "https://cdn.pixabay.com/photo/2016/04/03/20/24/wheel-1305434_640.jpg",
//         status: "In Progress"),
//     CategoryModel(
//         name: "Jonathan Major",
//         admin: "Mobius Time",
//         desc: "Who are so beguiled by the charms of pleasure of the moment.",
//         favourite: "Sad",
//         member: 14,
//         option: "edit",
//         profileImg:
//             "https://cdn.pixabay.com/photo/2020/08/12/16/48/buddha-5483139_640.jpg",
//         status: "In Progress"),
//     CategoryModel(
//         name: "Sam Harper",
//         admin: "Auto Bots",
//         desc:
//             "It's admittedly an odd way for Cicero to sail into the 21st century.",
//         favourite: "Hip-Hop",
//         member: 420,
//         option: "edit",
//         profileImg:
//             "https://cdn.pixabay.com/photo/2021/12/13/20/41/man-6869067_640.jpg",
//         status: "In Progress"),
//     CategoryModel(
//         name: "Paper Potts",
//         admin: "Dragon Ball Z",
//         desc: "Actually a pseudonym for the Cons themselves",
//         favourite: "Love",
//         member: 601,
//         option: "edit",
//         profileImg:
//             "https://cdn.pixabay.com/photo/2023/01/22/23/59/couple-7737589__340.png",
//         status: "In Progress"),
//     CategoryModel(
//         name: "Rock L. Hobbs",
//         admin: "Gladiator",
//         desc: "He endures pains to avoid worse pains.",
//         favourite: "Instrumental",
//         member: 786,
//         option: "edit",
//         profileImg:
//             "https://cdn.pixabay.com/photo/2017/02/06/00/25/valentines-day-2041820_640.jpg",
//         status: "In Progress"),
//     CategoryModel(
//         name: "Duffer Brothers",
//         admin: "Counter Earth",
//         desc: "Every pleasure is to be welcomed and every pain avoided.",
//         favourite: "DJ",
//         member: 111,
//         option: "edit",
//         profileImg:
//             "https://cdn.pixabay.com/photo/2015/05/03/14/40/woman-751236_640.jpg",
//         status: "Done"),
//     CategoryModel(
//         name: "Kamala Khan",
//         admin: "Time Heist",
//         desc:
//             "The wise man therefore always holds in these matters to this principle of selection.",
//         favourite: "Love",
//         member: 119,
//         option: "edit",
//         profileImg:
//             "https://cdn.pixabay.com/photo/2023/04/19/17/03/fox-7938160_640.jpg",
//         status: "Done"),
//   ];
// }
