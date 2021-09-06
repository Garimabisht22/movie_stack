import 'package:flutter/material.dart';
import 'package:movie_stack/constants.dart';

class MoreInfoScreen extends StatefulWidget {
  final List movieData;
  MoreInfoScreen({required this.movieData});
  @override
  _MoreInfoScreenState createState() => _MoreInfoScreenState();
}

class _MoreInfoScreenState extends State<MoreInfoScreen> {

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        title: kHeadingBar,
      ),
      body: ListView.builder(
          scrollDirection: Axis.vertical,
          itemCount: widget.movieData.length,
          itemBuilder: (buildContext, index) {
            String date = widget.movieData[index]['release_date'] ??
                widget.movieData[index]['first_air_date'];
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      flex: 1,
                      child: Container(
                        height: width / 3,
                        //width: width/2.5,
                        decoration: BoxDecoration(
                          borderRadius:
                              BorderRadiusDirectional.all(Radius.circular(10)),
                          color: Colors.white,
                          image: DecorationImage(
                              image: NetworkImage(
                                  "http://image.tmdb.org/t/p/w500" +
                                      widget.movieData[index]["poster_path"]),
                              fit: BoxFit.fill),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Expanded(
                      flex: 2,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                             date.substring(0,4),
                              style: TextStyle(fontSize: 18),
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Text(
                              widget.movieData[index]['title'] ??
                                  widget.movieData[index]['name'],
                              style: TextStyle(fontSize: 22),
                            ),
                            SizedBox(),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(vertical: 8.0),
                              child: Row(
                                children: [
                                  Icon(
                                    Icons.star,
                                    size: 25,
                                  ),
                                  SizedBox(
                                    width: 5,
                                  ),
                                  Text(
                                    widget.movieData[index]['vote_average'].toString(),
                                    style: TextStyle(fontSize: 18),
                                  )
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
            );
          }),
    );
  }
}
