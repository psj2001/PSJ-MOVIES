import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Upcomming_Moviess extends StatelessWidget {
  final List newep;
  Upcomming_Moviess({
    super.key,
    required this.newep,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200,
      width: double.infinity,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        physics: BouncingScrollPhysics(),
        itemCount: newep.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: Container(
                    decoration: BoxDecoration(
                      image: DecorationImage(
                          image: NetworkImage(
                              'https://image.tmdb.org/t/p/w500' +
                                  newep[index]['poster_path']),
                          fit: BoxFit.fill),
                    ),
                    height: 205,
                    width: 170,
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  newep[index]['title'] != null
                      ? newep[index]['title']
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
