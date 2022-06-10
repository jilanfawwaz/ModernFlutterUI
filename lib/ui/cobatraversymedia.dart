import 'package:english_words/english_words.dart';
import 'package:flutter/material.dart';

class CobaTraversy extends StatefulWidget {
  CobaTraversy({Key? key}) : super(key: key);

  @override
  State<CobaTraversy> createState() => _CobaTraversyState();
}

class _CobaTraversyState extends State<CobaTraversy> {
  List<WordPair> wordPair = [];

  Set<WordPair> savedWord = {};

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Coba Word Pair"),
      ),
      body: ListView.builder(
        itemBuilder: (context, index) {
          if (index.isOdd) {
            return Divider();
          }

          int word = index ~/ 2;
          if (index >= wordPair.length) {
            wordPair.addAll(generateWordPairs().take(10));
          }
          return ListTile(
            title: Text(
              wordPair[word].toString(),
            ),
            trailing: IconButton(
              onPressed: () {
                setState(() {
                  if (savedWord.contains(wordPair[word])) {
                    savedWord.remove(wordPair[word]);
                  } else {
                    savedWord.add(wordPair[word]);
                  }
                });
              },
              icon: Icon(
                savedWord.contains(wordPair[word])
                    ? Icons.favorite
                    : Icons.favorite_border,
                color: savedWord.contains(wordPair[word]) ? Colors.red : null,
              ),
            ),
          );
        },
      ),
    );
  }
}
