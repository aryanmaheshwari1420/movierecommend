// @dart = 2.9

import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:movierecommend/utils/text.dart';
import 'package:movierecommend/widgets/Tvseason.dart';
import 'package:movierecommend/widgets/toprated.dart';
import 'package:movierecommend/widgets/trending.dart';
import 'package:movierecommend/widgets/tv.dart';
import 'package:tmdb_api/tmdb_api.dart';

class Home extends StatefulWidget {
  const Home({Key key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List trendingmovies = [];
  List topratedmovies = [];
  List tv = [];
  final String apikey = '06e8319e056a0595a0abcdeb9f9923ff';
  final acesstoken =
      "eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiIwNmU4MzE5ZTA1NmEwNTk1YTBhYmNkZWI5Zjk5MjNmZiIsInN1YiI6IjYyZWU2YTBkODEzY2I2MDA3YjMzNDA0YSIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.d2GSsPwxFWLbtx7PIkbUGf0t9-ImFY7P9Jfy0wR-iUA";

  @override
  void initState() {
    loadmovies();
    super.initState();
  }

  loadmovies() async {
    TMDB tmdbwithcustomlogs = TMDB(ApiKeys(apikey, acesstoken),
        logConfig: ConfigLogger(showLogs: true, showErrorLogs: true));

    Map trendingresults = await tmdbwithcustomlogs.v3.trending.getTrending();
    Map topratedresult = await tmdbwithcustomlogs.v3.movies.getTopRated();
    Map tvresult = await tmdbwithcustomlogs.v3.tv.getPopular();
    setState(() {
      trendingmovies = trendingresults['results'];
      topratedmovies = topratedresult['results'];
      tv = tvresult['results'];
    });
    // print(trendingmovies);
    // print(topratedresult);
    // print(tv);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            SizedBox(
              height: 80,
              child: Center(
                  child: Text(
                "Choose",
                style: TextStyle(fontSize: 24),
              )),
            ),
            ListTile(
              leading: Icon(Icons.play_arrow_sharp),
              title: Text("TV Seasons"),
              subtitle: Text("Developer"),
              trailing: Icon(Icons.arrow_forward_ios),
              onTap: () {
                Navigator.push(context, MaterialPageRoute(
                  builder: (context) {
                    // return TVSeason();
                  },
                ));
              },
            ),
            SizedBox(
              height: 15,
            ),
            ListTile(
              leading: Icon(Icons.play_arrow_sharp),
              title: Text("TV Episodes"),
              subtitle: Text("Tester"),
              trailing: Icon(Icons.arrow_forward_ios),
              onTap: () {},
            ),
            SizedBox(
              height: 15,
            ),
            ListTile(
              leading: Icon(Icons.play_arrow_sharp),
              title: Text("Guest Seasons"),
              subtitle: Text("Front-End"),
              trailing: Icon(Icons.arrow_forward_ios),
              onTap: () {},
            ),
            SizedBox(
              height: 15,
            ),
            ListTile(
              leading: Icon(Icons.play_arrow_sharp),
              title: Text("Discover"),
              subtitle: Text("Back-End"),
              trailing: Icon(Icons.arrow_forward_ios),
            ),
            SizedBox(
              height: 15,
            ),
            ListTile(
              leading: Icon(Icons.play_arrow_sharp),
              title: Text("Collections"),
              subtitle: Text("Back-End"),
              trailing: Icon(Icons.arrow_forward_ios),
            )
          ],
        ),
      ),
      backgroundColor: Color.fromARGB(255, 39, 38, 36),
      appBar: AppBar(
          backgroundColor: Colors.transparent,
          title: Center(
              child: modified_text(
            text: " Movies Description ???",
            color: Colors.white,
          ))),
      body: ListView(
        children: [
          TV(
            tv: tv,
          ),
          TopratedMovies(
            toprated: topratedmovies,
          ),
          TrendingMovies(
            trending: trendingmovies,
          )
        ],
      ),
    );
  }
}
