import 'package:flutter/material.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({Key? key}) : super(key: key);

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  TextEditingController searchController = TextEditingController();

  List<Random> randomPeople = <Random>[
    Random(
        name: "Hello",
        imageUrl:
            "https://cdn.pixabay.com/photo/2023/05/18/08/13/bear-8001665__340.png"),
    Random(
        name: "Hey",
        imageUrl:
            "https://cdn.pixabay.com/photo/2023/05/18/08/13/bear-8001665__340.png"),
    Random(
        name: "Good Morning",
        imageUrl:
            "https://cdn.pixabay.com/photo/2023/05/18/08/13/bear-8001665__340.png"),
    Random(
        name: "Cool",
        imageUrl:
            "https://cdn.pixabay.com/photo/2023/05/18/08/13/bear-8001665__340.png"),
    Random(
        name: "Done",
        imageUrl:
            "https://cdn.pixabay.com/photo/2023/05/18/08/13/bear-8001665__340.png"),
    Random(
        name: "No Problem",
        imageUrl:
            "https://cdn.pixabay.com/photo/2023/05/18/08/13/bear-8001665__340.png"),
    Random(
        name: "Ok",
        imageUrl:
            "https://cdn.pixabay.com/photo/2023/05/18/08/13/bear-8001665__340.png"),
    Random(
        name: "As Per Your Wish",
        imageUrl:
            "https://cdn.pixabay.com/photo/2023/05/18/08/13/bear-8001665__340.png"),
    Random(
        name: "Yes Boss!",
        imageUrl:
            "https://cdn.pixabay.com/photo/2023/05/18/08/13/bear-8001665__340.png"),
    Random(
        name: "Not Bad",
        imageUrl:
            "https://cdn.pixabay.com/photo/2023/05/18/08/13/bear-8001665__340.png"),
    Random(
        name: "Working On It...",
        imageUrl:
            "https://cdn.pixabay.com/photo/2023/05/18/08/13/bear-8001665__340.png"),
    Random(
        name: "Thank You",
        imageUrl:
            "https://cdn.pixabay.com/photo/2023/05/18/08/13/bear-8001665__340.png"),
    Random(
        name: "Mention Not",
        imageUrl:
            "https://cdn.pixabay.com/photo/2023/05/18/08/13/bear-8001665__340.png"),
    Random(
        name: "On The Way",
        imageUrl:
            "https://cdn.pixabay.com/photo/2023/05/18/08/13/bear-8001665__340.png"),
    Random(
        name: "I'll Call You Letter",
        imageUrl:
            "https://cdn.pixabay.com/photo/2023/05/18/08/13/bear-8001665__340.png"),
    Random(
        name: "Definitely Not",
        imageUrl:
            "https://cdn.pixabay.com/photo/2023/05/18/08/13/bear-8001665__340.png"),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                      onChanged: searchPeople,
                    ),
                  ),
                ),
                const SizedBox(width: 10.0),
                Container(
                    height: 50,
                    width: 50,
                    decoration: const BoxDecoration(
                        color: Colors.grey, shape: BoxShape.circle),
                    child: const Icon(Icons.search)),
              ],
            ),
            const SizedBox(height: 12.0),
            Expanded(
                child: ListView.builder(
              physics: const BouncingScrollPhysics(),
              itemCount: randomPeople.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text("${randomPeople[index].name}"),
                  trailing: Container(
                    height: 50,
                    width: 50,
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        image: DecorationImage(
                            image: NetworkImage(
                                "${randomPeople[index].imageUrl}"))),
                  ),
                );
              },
            ))
          ],
        ),
      ),
    );
  }

  searchPeople(String query) {
    final suggestion = randomPeople.where((element) {
      final title = element.name!.toLowerCase();
      final input = query.toLowerCase();
      return title.contains(input);
    }).toList();

    setState(() {
      randomPeople = suggestion;
    });
  }
}

class Random {
  String? name;
  String? imageUrl;
  Random({this.name, this.imageUrl});
}
