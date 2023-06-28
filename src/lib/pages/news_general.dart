import 'package:flutter/material.dart';
import 'package:test1/components/custom_list_tile.dart';
import 'package:test1/models/article.dart';

import '../services/api.dart';

class General extends StatefulWidget {
  final String searchQuery;

  const General({Key? key, required this.searchQuery}) : super(key: key);

  @override
  _GeneralState createState() => _GeneralState();
}

class _GeneralState extends State<General> {
  ApiService apiService = ApiService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Hasil Pencarian", style: TextStyle(color: Colors.black)),
      ),
      body: FutureBuilder<List<Article>>(
        future: apiService.getArticle(widget.searchQuery),
        builder: (BuildContext context, AsyncSnapshot<List<Article>> snapshot) {
          if (snapshot.hasData) {
            List<Article>? articles = snapshot.data;
            return ListView.builder(
              itemCount: articles!.length,
              itemBuilder: (context, index) => customListTile(articles[index], context),
            );
          } else if (snapshot.hasError) {
            return Center(
              child: Text("Error: ${snapshot.error}"),
            );
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }
}

