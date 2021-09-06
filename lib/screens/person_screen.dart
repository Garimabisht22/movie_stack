import 'package:flutter/material.dart';

import '../constants.dart';

class PersonScreen extends StatefulWidget {
  final List trendingPerson;
  PersonScreen({required this.trendingPerson});
  @override
  _PersonScreenState createState() => _PersonScreenState();
}

class _PersonScreenState extends State<PersonScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: kHeadingBar,
      ),
      body: ListView.builder(
          itemCount:widget.trendingPerson.length,
          itemBuilder: (buildContext, index) {
            var imageLink = widget.trendingPerson[index]["profile_path"];
            print(index);
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                       imageLink == null?  CircleAvatar(
                         child: Text("No image"),
                         backgroundColor: Colors.black,
                         radius: 40,
                       ):CircleAvatar(
                          backgroundImage: NetworkImage(
                              "http://image.tmdb.org/t/p/w500" +
                                  widget.trendingPerson[index]["profile_path"]),
                          radius: 40,
                        ),
                        SizedBox(
                          width: 25,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Text(
                              widget.trendingPerson[index]["name"],
                              style: TextStyle(fontSize: 25),
                            ),
                            Text(
                            widget.trendingPerson[index]["known_for_department"],
                              style:
                                  TextStyle(fontSize: 15, color: Colors.grey),
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    child: Divider(
                      thickness: 1,
                      indent: 8,
                      endIndent: 8,
                      color: Colors.grey,
                    ),
                  )
                ],
              ),
            );
          }),
    );
  }
}
