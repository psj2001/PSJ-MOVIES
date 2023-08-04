import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../view/description.dart';

class MovieSlider extends StatelessWidget {
  final List toprated;
  MovieSlider({
    super.key,
    required this.toprated,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200,
      width: double.infinity,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        physics: BouncingScrollPhysics(),
        itemCount: toprated.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                InkWell(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => Description(
                            name: toprated[index]['title'] ??
                                'Data not availabele',
                            bannerurl: toprated[index]['backdrop_path'] != null
                                ? 'https://image.tmdb.org/t/p/w500' +
                                    toprated[index]['backdrop_path']
                                : 'https://thumbs.dreamstime.com/z/error-sign-error-message-white-background-error-sign-error-message-simple-vector-icon-125098995.jpg',
                            posterurl: toprated[index]['poster_path'] != null
                                ? 'https://image.tmdb.org/t/p/w500' +
                                    toprated[index]['poster_path']
                                : 'https://thumbs.dreamstime.com/z/error-sign-error-message-white-background-error-sign-error-message-simple-vector-icon-125098995.jpg',
                            description: toprated[index]['overview'] ??
                                'Data not availabele',
                            vote: toprated[index]['vote_average']?.toString() ??
                                '0.00',
                            launch_on: toprated[index]['release_date'] ??
                                'Data not availabele',
                          ),
                        ));
                  },
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    child: Container(
                      decoration: BoxDecoration(
                        image: DecorationImage(
                            image: NetworkImage(
                                'https://image.tmdb.org/t/p/w500' +
                                    toprated[index]['poster_path']),
                            fit: BoxFit.fill),
                      ),
                      height: 205,
                      width: 170,
                    ),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  toprated[index]['title'] != null
                      ? toprated[index]['title']
                      : 'Loading ',
                  style: GoogleFonts.aBeeZee(
                      fontSize: 15, fontWeight: FontWeight.bold),
                )
              ],
            ),
          );
        },
      ),
    );
  }
}
