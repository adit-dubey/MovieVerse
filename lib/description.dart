import 'package:flutter/material.dart';

import 'Utils/text.dart';

class Description extends StatelessWidget {
  final String name, description, bannerurl, posterurl, vote, launch_on;

  const Description(
      {Key key,
      this.name,
      this.description,
      this.bannerurl,
      this.posterurl,
      this.vote,
      this.launch_on,
      String poster_path})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: ListView(children: [
        SizedBox(
          height: 250,
          child: Stack(
            children: [
              Positioned(
                child: SizedBox(
                  height: 250,
                  width: MediaQuery.of(context).size.width,
                  child: Image.network(
                    bannerurl,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Positioned(
                bottom: 10,
                child: modified_text(
                  text: '⭐ Average Rating - ' + vote,
                  size: 18,
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 15),
        Container(
            padding: const EdgeInsets.all(10),
            child: modified_text(text: name ?? 'Not Loaded', size: 24)),
        Container(
            padding: const EdgeInsets.only(left: 10),
            child:
                modified_text(text: 'Releasing On - ' + launch_on, size: 14)),
        Row(
          children: [
            SizedBox(
              height: 200,
              width: 100,
              child: Image.network(posterurl),
            ),
            Flexible(
              child: Container(
                  padding: const EdgeInsets.all(10),
                  child: modified_text(text: description, size: 18)),
            ),
          ],
        )
      ]),
    );
  }
}
