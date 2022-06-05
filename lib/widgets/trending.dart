import 'package:flutter/material.dart';
import '../description.dart';
import '../utils/text.dart';

class TrendingMovies extends StatelessWidget {
  final List trending;

  const TrendingMovies({Key key, this.trending}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          modified_text(
            text: 'Trending Movies',
            size: 26,
          ),
          const SizedBox(height: 10),
          SizedBox(
              height: 270,
              child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: trending.length,
                  itemBuilder: (context, index) {
                    return InkWell(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => Description(
                                name: trending[index]['title'],
                                bannerurl: 'https://image.tmdb.org/t/p/w500' +
                                    trending[index]['backdrop_path'],
                                posterurl: 'https://image.tmdb.org/t/p/w500' +
                                    trending[index]['poster_path'],
                                description: trending[index]['overview'],
                                vote:
                                    trending[index]['vote_average'].toString(),
                                launch_on: trending[index]['release_date'],
                              ),
                            ),
                          );
                        },
                        child: trending[index]['title'] != null
                            ? SizedBox(
                                width: 140,
                                child: Column(
                                  children: [
                                    Container(
                                      decoration: BoxDecoration(
                                        image: DecorationImage(
                                          image: NetworkImage(
                                              'https://image.tmdb.org/t/p/w500' +
                                                  trending[index]
                                                      ['poster_path']),
                                        ),
                                      ),
                                      height: 200,
                                    ),
                                    const SizedBox(height: 5),
                                    modified_text(
                                        size: 15,
                                        text: trending[index]['title'] ??
                                            'Loading')
                                  ],
                                ),
                              )
                            : const SizedBox());
                  }))
        ],
      ),
    );
  }
}
