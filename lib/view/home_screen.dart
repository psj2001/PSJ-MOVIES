import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tmdb_api/tmdb_api.dart';

import '../utils/widgets/movie_slider.dart';
import '../utils/widgets/trending_slider.dart';
import '../utils/widgets/upcomming.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List trendingmovies = [];
  List topratedmovies = [];
  bool isLoading = true;
  List tv = [];
  final String apikey = '94bd278a07c79bc9d12e4dd9b5596276';
  final readaccesstoken =
      'eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiI5NGJkMjc4YTA3Yzc5YmM5ZDEyZTRkZDliNTU5NjI3NiIsInN1YiI6IjYzNjFmZDU2ZDA0ZDFhMDA3YzhhMDM0ZSIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.yIhSsUCczR4dtuY-kO_RdO4zJ8nG6GKcl6UA3r4DGJU';

  void initState() {
    loadmovies();

    super.initState();
  }

  void loadmovies() async {
    TMDB tmdbWithCustomLogs = TMDB(
      ApiKeys(apikey, readaccesstoken),
      logConfig: ConfigLogger(
        showLogs: true,
        showErrorLogs: true,
      ),
    );

    Map trendingresult = await tmdbWithCustomLogs.v3.trending
        .getTrending(); // fetch all the trending movies
    Map topratedresult = await tmdbWithCustomLogs.v3.movies.getTopRated();
    Map tvresult = await tmdbWithCustomLogs.v3.movies.getUpcoming();
    setState(() {
      trendingmovies = trendingresult['results'];
      topratedmovies = topratedresult['results'];
      tv = tvresult['results'];
    });
    print(trendingmovies);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Image.asset(
          'assets/psj.png',
          fit: BoxFit.cover,
          filterQuality: FilterQuality.high,
          height: 40,
        ),
        centerTitle: true,
        actions: [
          PopupMenuButton(itemBuilder: (context) {
            return [
              PopupMenuItem(
                child: Text("Logout"),
                onTap: () {
                  setState(() {
                    FirebaseAuth.instance.signOut();
                  });
                },
              ),
            ];
          }),
        ],
      ),
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 85,
              ),
              TrendingSlider(
                trending: trendingmovies,
              ),
              SizedBox(
                height: 35,
              ),
              Text(
                "Top rated movies",
                style: GoogleFonts.aBeeZee(
                  fontSize: 25,
                ),
              ),
              SizedBox(
                height: 35,
              ),
              SizedBox(
                height: 250,
                child: MovieSlider(
                  toprated: topratedmovies,
                ),
              ),
              SizedBox(
                height: 35,
              ),
              Text(
                "Upcoming movies",
                style: GoogleFonts.aBeeZee(
                  fontSize: 25,
                ),
              ),
              SizedBox(
                height: 35,
              ),
              SizedBox(
                height: 250,
                child: Upcomming_Moviess(
                  newep: tv,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
