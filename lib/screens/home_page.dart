import 'package:flutter/material.dart';
import 'package:movie_stack/constants.dart';
import 'package:movie_stack/screens/more_information_screen.dart';
import 'package:movie_stack/widgets/slider_widget.dart';
import 'package:movie_stack/widgets/trending_person.dart';
import 'package:movie_stack/widgets/trending_tiles.dart';

class HomePage extends StatefulWidget {
  final List SliderDataList;
  final List trendingPersonDataList;
  final List trendingMoviesDataList;
  final List trendingTvShowDataList;
  final List PopularMoviesDataList;
  HomePage(
      {required this.trendingTvShowDataList,
      required this.trendingPersonDataList,
      required this.trendingMoviesDataList,
      required this.PopularMoviesDataList,
      required this.SliderDataList});

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(title: kHeadingBar),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SliderWidget(BannerImageUrl: widget.SliderDataList,),
            TrendingPerson(trendingPersonDataList: widget.trendingPersonDataList,),
            TrendingTiles(
              trendingType: 'Movies',
              Heading: 'Trending',
              onTapProperty: () {
                Navigator.push(context, MaterialPageRoute(builder: (buildContext){
                  return MoreInfoScreen(movieData: widget.trendingMoviesDataList,);
                }));
              }, dataList: widget.trendingMoviesDataList,
            ),
            TrendingTiles(
              trendingType: 'Tv Show',
              Heading: 'Trending',
              onTapProperty: () {Navigator.push(context, MaterialPageRoute(builder: (buildContext){
                return MoreInfoScreen(movieData: widget.trendingTvShowDataList,);
              }));}, dataList: widget.trendingTvShowDataList,
            ),
            TrendingTiles(
              trendingType: 'Movies',
              Heading: 'Popular',
              onTapProperty: () {Navigator.push(context, MaterialPageRoute(builder: (buildContext){
                return MoreInfoScreen(movieData: widget.PopularMoviesDataList,);
              }));}, dataList: widget.PopularMoviesDataList,
            ),
          ],
        ),
      ),
    );
  }
}
