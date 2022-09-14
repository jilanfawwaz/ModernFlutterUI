import 'package:english_words/english_words.dart';
import 'package:flutter/material.dart';

class CobaTraversy extends StatefulWidget {
  const CobaTraversy({Key? key}) : super(key: key);

  @override
  State<CobaTraversy> createState() => _CobaTraversyState();
}

class _CobaTraversyState extends State<CobaTraversy> {
  List<WordPair> wordPair = [];

  //NOTE:Set<> , versi lite dari map yang gaada key nya, nilai data dalam set tidak bisa sama, tidak bisa akses nilai spesifik yang ada di dalam set, hanya bisa mengecek apakah contain atau tidak 
  Set<WordPair> savedWord = {};

  Widget wordList() {
    return ListView.builder(
      itemBuilder: (context, index) {
        if (index.isOdd) return Divider();

        //int word = index ~/ 2;
        final word = index ~/ 2;
        if (index >= wordPair.length) {
          wordPair.addAll(generateWordPairs().take(10));
        }
        //final alreadySaved = savedWord.contains(wordPair[word]);
        return wordTile(wordPair[word]);
      },
    );
  }

  Widget wordTile(WordPair wordPair) {
    final alreadySaved = savedWord.contains(wordPair);
    return ListTile(
      title: Text(
        //wordPair.asPascalCase.toString(),
        wordPair.asPascalCase,
      ),
      trailing: IconButton(
        onPressed: () {
          setState(() {
            if (alreadySaved) {
              savedWord.remove(wordPair);
            } else {
              savedWord.add(wordPair);
            }
          });
        },
        icon: Icon(
          alreadySaved ? Icons.favorite : Icons.favorite_border,
          color: alreadySaved ? Colors.red : null,
        ),
      ),
    );
  }

  Widget favoritePage() {
    return Scaffold(
      appBar: AppBar(
        title: Text("Favorite Word"),
      ),
      // body: savedWord.isEmpty
      //     ? Center(child: Text("You didn't like anything"))
      //     : ListView(
      //         children: savedWord.map(
      //           (WordPair e) {
      //             //children: savedWord.map((e) {
      //             return Column(
      //               children: [
      //                 ListTile(
      //                   title: Text(e.asPascalCase.toString()),
      //                 ),
      //                 Divider(),
      //               ],
      //             );
      //           },
      //         ).toList(),
      //       ),

      body: savedWord.isEmpty
          ? Center(child: Text("You didn't like anything"))
          : ListView.builder(
              itemCount: savedWord.length,
              itemBuilder: (context, index) {
                return Column(
                  children: [
                    ListTile(
                      title: Text(savedWord.toList()[index].toString()),
                      // trailing: IconButton(
                      //   onPressed: () {
                      //     setState(() {
                      //       if (savedWord
                      //           .contains(savedWord.toList()[index])) {
                      //         savedWord.remove(savedWord.toList()[index]);
                      //       } else {
                      //         savedWord.add(savedWord.toList()[index]);
                      //       }
                      //     });
                      //   },
                      //   icon: Icon(
                      //       savedWord.contains(savedWord.toList()[index])
                      //           ? Icons.favorite
                      //           : Icons.favorite_border,
                      //       color: Colors.red),
                      // ),
                    ),
                    Divider(),
                  ],
                );
              },
            ),
    );
  }

  pushSaved() {
    return Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => favoritePage(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Coba Word Pair"),
        actions: [
          IconButton(
              onPressed: () {
                pushSaved();
              },
              icon: Icon(Icons.list))
        ],
      ),
      body: wordList(),
    );
  }
}
