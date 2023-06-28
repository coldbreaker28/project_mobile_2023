import 'package:flutter/material.dart';
import 'package:test1/models/article.dart';
import 'package:test1/models/source.dart';
import 'package:test1/pages/detail_article.dart';

// class HistoryPage extends StatefulWidget {
//   const HistoryPage({Key? key}) : super(key: key);

//   @override
//   _HistoryPageState createState() => _HistoryPageState();
// }

// class _HistoryPageState extends State<HistoryPage> {
//   List<String> userHistory = [];

//   void updateHistory(List<Article> articles) {
//     setState(() {
//       userHistory.addAll(articles.map((article) => article.title));
//     });
//   }
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: ListView.builder(
//         itemCount: userHistory.length,
//         itemBuilder: (BuildContext context, int index) {
//           final history = userHistory[index];
//           return ListTile(
//             title: Text(history),
//             onTap: () {
//               showDialog(
//                 context: context,
//                 builder: (context) => AlertDialog(
//                   title: const Text('Detail Berita'),
//                   content: Text('Anda membuka berita: $history'),
//                   actions: [
//                     TextButton(
//                       onPressed: () {
//                         Navigator.of(context).pop();
//                       },
//                       child: const Text('Tutup'),
//                     ),
//                   ],
//                 ),
//               );
//             },
//           );
//         },
//       ),
//     );
//   }
// }

class History extends StatelessWidget {
  final List<String> userHistory;

  const History({Key? key, required this.userHistory}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<Article> articleList = userHistory.map((title) => Article(title: title, source: Source(id: '', name: ''), author: '', description: '', url: '', urlToImage: '', publishedAt: '', content: '',)).toList();

    return Scaffold(
      appBar: AppBar(
        title: const Text('History'),
        automaticallyImplyLeading: false,
      ),
      body: ListView.builder(
        itemCount: articleList.length,
        itemBuilder: (context, index) {
          final article = articleList[index];
          return ListTile(
            title: Text(article.title),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ArticlePage(article: article),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
