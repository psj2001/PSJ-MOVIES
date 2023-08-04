import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

import '../../view/description.dart';

class TrendingSlider extends StatelessWidget {
  final List trending;
  TrendingSlider({
    super.key,
    required this.trending,
  });
  bool isLoading = false;
  @override
  Widget build(BuildContext context) {
    return isLoading
        ? Center(
            child: CircularProgressIndicator(),
          )
        : SizedBox(
            width: double.infinity,
            child: CarouselSlider.builder(
                itemCount: trending.length,
                itemBuilder: (context, index, pageViewIndex) {
                  return InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => Description(
                              name: trending[index]['title'] ??
                                  'Data not availabele',
                              bannerurl: trending[index]['backdrop_path'] !=
                                      null
                                  ? 'https://image.tmdb.org/t/p/w500' +
                                      trending[index]['backdrop_path']
                                  : 'https://thumbs.dreamstime.com/z/error-sign-error-message-white-background-error-sign-error-message-simple-vector-icon-125098995.jpg',
                              posterurl: trending[index]['poster_path'] != null
                                  ? 'https://image.tmdb.org/t/p/w500' +
                                      trending[index]['poster_path']
                                  : 'https://thumbs.dreamstime.com/z/error-sign-error-message-white-background-error-sign-error-message-simple-vector-icon-125098995.jpg',
                              description: trending[index]['overview'] ??
                                  'Data not availabele',
                              vote:
                                  trending[index]['vote_average']?.toString() ??
                                      '0.00',
                              launch_on: trending[index]['release_date'] ??
                                  'Data not availabele',
                            ),
                          ));
                    },
                    child: ClipRRect(
                        borderRadius: BorderRadius.circular(12),
                        child: Container(
                          height: 300,
                          width: 200,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: NetworkImage(
                                  'https://image.tmdb.org/t/p/w500' +
                                      trending[index]['poster_path']),
                            ),
                          ),
                        )),
                  );
                },
                options: CarouselOptions(
                    height: 300,
                    autoPlay: true,
                    viewportFraction: 0.55,
                    enlargeCenterPage: true,
                    pageSnapping: true,
                    autoPlayCurve: Curves.fastOutSlowIn,
                    autoPlayAnimationDuration: Duration(seconds: 2))),
          );
  }
}
