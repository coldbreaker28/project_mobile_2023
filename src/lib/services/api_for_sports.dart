import 'dart:convert';
import 'package:http/http.dart';
import 'package:test1/models/article.dart';
class ApiService {

  final String endPointUrl =
      "https://newsapi.org/v2/top-headlines?country=us&category=sports&apiKey=9d54506936af4353988b3b5f92ea4ec3";

  Future<List<Article>> getArticle() async {
    Response res = await get(Uri.parse(endPointUrl));

    if (res.statusCode == 200) {
      Map<String, dynamic> json = jsonDecode(res.body);

      List<dynamic> body = json['articles'];

      List<Article> articles =
          body.map((dynamic item) => Article.fromJson(item)).toList();

      return articles;
    } else {
      throw ("Can't get the Articles");
    }
  }
}