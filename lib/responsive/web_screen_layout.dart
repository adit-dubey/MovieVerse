// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:tmdb_api/tmdb_api.dart';

import '../utils/text.dart';
import '../widgets/toprated.dart';
import '../widgets/trending.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: WebScreenLayout(),
      theme: ThemeData(brightness: Brightness.dark, primaryColor: Colors.green),
    );
  }
}

class WebScreenLayout extends StatefulWidget {
  const WebScreenLayout({Key key}) : super(key: key);

  @override
  _WebScreenLayout createState() => _WebScreenLayout();
}

class _WebScreenLayout extends State<WebScreenLayout> {
  final String apikey = '67af5e631dcbb4d0981b06996fcd47bc';
  final String readaccesstoken =
      'eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiI2N2FmNWU2MzFkY2JiNGQwOTgxYjA2OTk2ZmNkNDdiYyIsInN1YiI6IjYwNzQ1OTA0ZjkyNTMyMDAyOTFmZDczYSIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.C_Bkz_T8OybTGo3HfYsESNjN46LBYdw3LHdF-1TzYYs';
  List trendingmovies = [];
  List topratedmovies = [];
  List tv = [];

  @override
  void initState() {
    super.initState();
    loadmovies();
  }

  loadmovies() async {
    TMDB tmdbWithCustomLogs = TMDB(
      ApiKeys(apikey, readaccesstoken),
      logConfig: const ConfigLogger(
        showLogs: true,
        showErrorLogs: true,
      ),
    );

    Map trendingresult = await tmdbWithCustomLogs.v3.trending.getTrending();
    Map topratedresult = await tmdbWithCustomLogs.v3.movies.getTopRated();

    setState(() {
      topratedmovies = topratedresult['results'];
      trendingmovies = trendingresult['results'];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: modified_text(text: 'MovieVerse'),
        backgroundColor: Colors.transparent,
      ),
      body: ListView(
        children: [
          TopRatedMovies(
            toprated: topratedmovies,
          ),
          TrendingMovies(
            trending: trendingmovies,
          ),
        ],
      ),
    );
  }
}
