import 'package:e_news/helper/news.dart';
import 'package:e_news/models/article_model.dart';
import 'package:e_news/views/blog_tile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  News client = News();

  bool _loading = true;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    setState(() {
      _loading = false;
    });
    // getNews();
  }

  // getNews() async {
  //   News newsClass = News();
  //   await newsClass.getNews();
  //   articles = newsClass.news;
  //
  // }

  @override
  Widget build(BuildContext context) {
    final PageController controller = PageController(initialPage: 0);

    return Scaffold(
      body: _loading
          ? LoadingScreen()
          : FutureBuilder(
              future: client.getNews(),
              builder: (BuildContext context,
                  AsyncSnapshot<List<ArticleModel>> snapshot) {
                if (snapshot.hasData) {
                  List<ArticleModel>? articles = snapshot.data;
                  return PageView.builder(
                    itemCount: articles!.length,
                    scrollDirection: Axis.vertical,
                    controller: controller,
                    itemBuilder: (context, index) {
                      return BlogTile(
                        headline: articles[index].title,
                        date: "gh",
                        image: articles[index].urlToImage,
                        content: articles[index].description,
                      );
                    },
                  );
                } else {
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                }
              },
            ),
    );
  }
}

class LoadingScreen extends StatelessWidget {
  const LoadingScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "e",
                  style: TextStyle(fontSize: 25, fontWeight: FontWeight.w600),
                ),
                Text(
                  "News",
                  style: TextStyle(
                      color: Colors.blue,
                      fontSize: 25,
                      fontWeight: FontWeight.w600),
                ),
              ],
            ),
            SizedBox(height: 50),
            CircularProgressIndicator()
          ],
        ),
      ),
    );
  }
}
