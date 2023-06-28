import 'package:flutter/material.dart';
import 'package:test1/components/custom_list_tile.dart';
import 'package:test1/models/article.dart';
import 'package:test1/services/api_for_health.dart';

class Health extends StatefulWidget {
  const Health({super.key});

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<Health> {
  ApiService client = ApiService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
        future: client.getArticle(),
        builder: (BuildContext context, AsyncSnapshot<List<Article>> snapshot) {
          if (snapshot.hasData) {
            List<Article>? articles = snapshot.data;
            return ListView.builder(
              itemCount: articles!.length,
              itemBuilder: (context, index) =>
                  customListTile(articles[index], context),
            );
          }
          return const Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }
}
