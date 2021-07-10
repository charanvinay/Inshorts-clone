import 'package:cached_network_image/cached_network_image.dart';
import 'package:e_news/views/bottom_icons.dart';
import 'package:e_news/views/news_detials.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:webview_flutter/webview_flutter.dart';

class BlogTile extends StatefulWidget {
  final String? author, headline, content, description, url;
  final String image;

  final String? publishedAt;

  const BlogTile({
    Key? key,
    this.headline,
    this.content,
    required this.image,
    this.author,
    this.publishedAt,
    this.description,
    this.url,
  }) : super(key: key);

  @override
  _BlogTileState createState() => _BlogTileState();
}

class _BlogTileState extends State<BlogTile> {
  late final String date, time;
  late final DateTime dt;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    widget.image;
    dt = DateTime.parse(widget.publishedAt!);
    print(dt);
    date = DateFormat.yMMMd().format(dt);
    time = DateFormat.jm().format(dt);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      child: Column(
        children: [
          CachedNetworkImage(
            imageUrl: widget.image,
            placeholder: (context, url) => Center(
              child: SizedBox(
                width: 40.0,
                height: 40.0,
                child: CircularProgressIndicator(
                  color: Colors.black12,
                ),
              ),
            ),
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height * 0.35,
            fit: BoxFit.cover,
          ),
          Container(
            color: Colors.white60,
            height: MediaQuery.of(context).size.height * 0.6,
            padding: EdgeInsets.all(16),
            alignment: Alignment.topLeft,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => NewsDetails(
                          url: widget.url,
                        ),
                      ),
                    );
                  },
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        widget.headline!,
                        style: GoogleFonts.roboto(
                          textStyle: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            margin: EdgeInsets.only(top: 10),
                            width: 40,
                            height: 2,
                            alignment: Alignment.topLeft,
                            color: Colors.blue,
                          ),
                          Container(
                            margin: EdgeInsets.only(top: 4),
                            width: 20,
                            height: 2,
                            alignment: Alignment.topLeft,
                            color: Colors.blue,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 10.0),
                            child: Text(
                              "${date} |  ${time}",
                              style: TextStyle(fontSize: 10),
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(top: 10),
                            child: Text(
                              widget.description!,
                              style: GoogleFonts.roboto(
                                textStyle: TextStyle(
                                  fontSize: 16,
                                  height: 1.5,
                                  fontWeight: FontWeight.w300,
                                  color: Colors.black54,
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 10.0),
                            child: Container(
                              child: Text(
                                widget.author == "Author name not available"
                                    ? "Author name not available"
                                    : "Short by ${widget.author}",
                                style: GoogleFonts.roboto(
                                  textStyle: TextStyle(
                                    fontSize: 12,
                                    fontWeight: FontWeight.w300,
                                    color: Colors.black26,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    BottonIcons(
                      svgSrc: "https://www.svgrepo.com/show/93192/share.svg",
                      text: "Share",
                    ),
                    BottonIcons(
                      svgSrc: "https://www.svgrepo.com/show/39042/download.svg",
                      text: "Save",
                    ),
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
