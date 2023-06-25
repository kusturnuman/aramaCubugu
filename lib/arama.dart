import 'package:flutter/material.dart';
import 'main.dart';

class Sayfa extends StatelessWidget {
  const Sayfa({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Home(),
    );
  }
}

class Home extends StatelessWidget{
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Ara"),
        actions: [
          IconButton(icon: const Icon(Icons.search),
            onPressed: () {
              showSearch(context: context,
                delegate: SearchBox(),
              );
            },
          )
        ],
      ),
      body: Column(),
    );
  }
}
class SearchBox extends SearchDelegate{

  List<String> tumVeri = [
    "Numan", "Eren", "Sinem", "Ahmet", "Veli", "Ayşe", "Fatma",
  ];

 @override
  List<Widget>? buildActions(BuildContext context) {
   return[
     IconButton(
     icon: const Icon(Icons.clear) ,
     onPressed: () {
       query = '';
      },
     )
   ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
      return IconButton(
        icon: const Icon(Icons.arrow_back) ,
        onPressed: () {
          close(context, null);
        },
      );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    List<String> matchQuery = [];
      for (var item in tumVeri) {
          if (item.toLowerCase().contains(query.toLowerCase())) {
            matchQuery.add(item);
          }
        }
      return ListView.builder(
          itemCount: matchQuery.length,
          itemBuilder: (context, index){
            var result = matchQuery[index];
            return ListTile(
              title: Text(result),
            );
          }
      );
  }

  @override
  Widget buildResults(BuildContext context) {
    List<String> matchQuery = [];
    for (var item in tumVeri) {
      if (item.toLowerCase().contains(query.toLowerCase())) {
        matchQuery.add(item);
      }
    }
    return ListView.builder(
        itemCount: matchQuery.length,
        itemBuilder: (context, index){
          var result = matchQuery[index];
          return ListTile(
            title: Text(result),
          );
        }
    );
  }
}
