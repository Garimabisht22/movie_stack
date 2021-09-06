import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:movie_stack/screens/person_screen.dart';

import '../constants.dart';

class TrendingPerson extends StatefulWidget {
  final List trendingPersonDataList;
  TrendingPerson({required this.trendingPersonDataList});

  @override
  _TrendingPersonState createState() => _TrendingPersonState();
}

class _TrendingPersonState extends State<TrendingPerson> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Container(
        // color: Colors.red,
        // width: double.maxFinite,
        height: width / 2.4,
        child: Column(
          children: [
            TitleWidget(
              Heading: 'Trending',
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (buildContext){
                  return PersonScreen(trendingPerson: widget.trendingPersonDataList,);
                }));
              },
              trendingType: 'Person',
            ),
            Container(
              // color: Colors.red,
              height: width / 3.5,
              child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: 5,
                  itemBuilder: (BuildContext, index) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 5),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          CircleAvatar(
                            radius: 45,
                            backgroundImage: NetworkImage(
                                "http://image.tmdb.org/t/p/w500" +
                                    widget.trendingPersonDataList[index]
                                        ["profile_path"]),
                          ),
                          Text(widget.trendingPersonDataList[index]["name"])
                        ],
                      ),
                    );
                  }),
            )
          ],
        ),
      ),
    );
  }
}
