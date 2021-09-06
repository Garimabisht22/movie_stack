import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:movie_stack/constants.dart';

class TrendingTiles extends StatefulWidget {
  final String trendingType;
  final String Heading;
  final VoidCallback onTapProperty;
  final List dataList;
TrendingTiles({required this.trendingType,required this.Heading,required this.onTapProperty,required this.dataList});

  @override
  _TrendingTilesState createState() => _TrendingTilesState();
}

class _TrendingTilesState extends State<TrendingTiles> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Container(
     // color: Colors.cyan,
        height: width/2,
        child: Column(
          children: [
            TitleWidget(Heading: widget.Heading, trendingType: widget.trendingType, onTap: widget.onTapProperty),
            Container(
           //   color: Colors.pink,
              height: width/2.8,
              child: ListView.builder(
               //   physics: const NeverScrollableScrollPhysics(), //<--here
                  itemCount: widget.dataList.length,
                scrollDirection: Axis.horizontal,
                  itemBuilder:(BuildContext, index){
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Stack(
                    alignment: AlignmentDirectional.topEnd,
                    children: [
                      Container(
                        width: width/3.5,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadiusDirectional.all(Radius.circular(10)),
                          // color: Colors.white,
                            image: DecorationImage(
                                image: NetworkImage("http://image.tmdb.org/t/p/w500"+widget.dataList[index]["poster_path"]),
                              fit: BoxFit.fill
                            ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(4.0),
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.grey.shade800.withOpacity(0.8),
                            borderRadius: BorderRadius.all(Radius.circular(30)),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(vertical: 1.0,horizontal: 8),
                            child: Text(widget.dataList[index]['vote_average'].toString()),
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              }),
            ),

          ],
        ),
      ),
    );
  }
}
