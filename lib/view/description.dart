import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:psj_movies/utils/colors.dart';

class Description extends StatelessWidget {
  final String name, description, bannerurl, posterurl, vote, launch_on;

  const Description(
      {required this.name,
      required this.description,
      required this.bannerurl,
      required this.posterurl,
      required this.vote,
      required this.launch_on});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: false,
      appBar: AppBar(
        title: Text("Description"),
        elevation: 0,
        backgroundColor: Colors.transparent,
      ),
      backgroundColor: Colours.scaffoldBgColor,
      body: Container(
        child: ListView(
          children: [
            Container(
              height: 250,
              child: Stack(
                children: [
                  Positioned(
                      child: Container(
                    height: 250,
                    width: MediaQuery.of(context).size.width,
                    child: Image.network(
                      bannerurl,
                      fit: BoxFit.cover,
                    ),
                  )),
                  Positioned(
                    bottom: 10,
                    child: Text('⭐ Average Rating - ' + vote),
                  ),
                ],
              ),
            ),
            SizedBox(height: 15),
            Container(
                padding: EdgeInsets.all(10),
                child: Text(
                  name,
                  style: GoogleFonts.aBeeZee(
                      fontWeight: FontWeight.bold, fontSize: 30),
                )),
            Container(
                padding: EdgeInsets.only(left: 10),
                child: Text('Releasing On - ' + launch_on)),
            Row(
              children: [
                Container(
                  height: 200,
                  width: 100,
                  child: Image.network(posterurl),
                ),
                Flexible(
                  child: Container(
                      padding: EdgeInsets.all(10),
                      child: Text(
                        description,
                        style: GoogleFonts.aBeeZee(fontSize: 15),
                      )),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
