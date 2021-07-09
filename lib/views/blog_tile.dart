import 'package:e_news/views/bottom_icons.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class BlogTile extends StatelessWidget {
  final String? headline, date, image, content;

  const BlogTile({
    Key? key,
    this.headline,
    this.date,
    this.content,
    this.image,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      child: Column(
        children: [
          Image.network(
            image!,
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height * 0.4,
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
                Column(
                  children: [
                    Text(
                      headline!,
                      style: GoogleFonts.roboto(
                        textStyle: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w300,
                        ),
                      ),
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
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
                        Container(
                          margin: EdgeInsets.only(top: 10),
                          child: Text(
                            content!,
                            style: GoogleFonts.roboto(
                              textStyle: TextStyle(
                                fontSize: 16,
                                height: 1.5,
                                fontWeight: FontWeight.w300,
                                color: Colors.black45,
                              ),
                            ),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(top: 25),
                          child: Text(
                            date!,
                            style: GoogleFonts.roboto(
                              textStyle: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.w300,
                                color: Colors.black26,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
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
