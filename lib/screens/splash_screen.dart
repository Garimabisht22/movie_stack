import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:movie_stack/screens/home_page.dart';

import '../constants.dart';
import '../movie_service.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    getData();
  }

  Future<dynamic> getData() async {
    var bannerData = await MovieService().getData(bannerApi);
    var trendingPersonData = await MovieService().getData(trendingPersonApi);
    var trendingMoviesData = await MovieService().getData(trendingMoviesApi);
    var trendingTvShowData = await MovieService().getData(trendingTvShowsApi);
    var PopularMoviesData = await MovieService().getData(PopularMoviesApi);

    Navigator.push(context, MaterialPageRoute(builder: (context) {
      return HomePage(
        PopularMoviesDataList: PopularMoviesData['results'],
        trendingMoviesDataList: trendingMoviesData['results'],
        trendingTvShowDataList: trendingTvShowData['results'],
        trendingPersonDataList: trendingPersonData['results'],
        SliderDataList: bannerData['results'],
      );
    }));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Uploading Movies",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 25,
                    fontWeight: FontWeight.w500),
              ),SizedBox(
                height: 10,
              ),
              SpinKitCircle(
                color: Colors.white,
                size: 50.0,
                //lineWidth: 30,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
