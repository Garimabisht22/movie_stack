import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

class SliderWidget extends StatefulWidget {
  final List BannerImageUrl;
  SliderWidget({required this.BannerImageUrl});
  @override
  _SliderWidgetState createState() => _SliderWidgetState();
}

class _SliderWidgetState extends State<SliderWidget> {
  int currentindex = 0;

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;

    return CarouselSlider.builder(
      itemCount: widget.BannerImageUrl.length,
      options: CarouselOptions(
        viewportFraction: 0.9,
        initialPage: currentindex,
        height: width / 2,
        autoPlay: true,
        autoPlayCurve: Curves.ease,
        enableInfiniteScroll: false,
      ),
      itemBuilder: (BuildContext context, int index, int realIndex) {
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(10)),
              image: DecorationImage(
                image: NetworkImage("http://image.tmdb.org/t/p/w500" +
                    widget.BannerImageUrl[index]['poster_path']),
                fit: BoxFit.fill,
              ),
            ),
          ),
        );
      },
    );
  }
}
