import 'package:flutter/material.dart';

String bannerApi = "https://api.themoviedb.org/3/movie/upcoming?api_key=c4824776bf6f08433a4c4e7cd75a6acc";
String trendingPersonApi = "https://api.themoviedb.org/3/trending/person/day?api_key=c4824776bf6f08433a4c4e7cd75a6acc";
String trendingMoviesApi = "https://api.themoviedb.org/3/trending/movies/day?api_key=c4824776bf6f08433a4c4e7cd75a6acc";
String trendingTvShowsApi = "https://api.themoviedb.org/3/trending/tv/day?api_key=c4824776bf6f08433a4c4e7cd75a6acc";
String PopularMoviesApi = "https://api.themoviedb.org/3/movie/popular?api_key=c4824776bf6f08433a4c4e7cd75a6acc";


Widget kHeadingBar = Row(
  mainAxisAlignment: MainAxisAlignment.spaceBetween,
  children: [
    Text(
      "Movie Stack",
      style: TextStyle(fontFamily: "Open_Sans",letterSpacing: 1),
    ),
    Icon(Icons.search)
  ],
);

class TitleWidget extends StatelessWidget {
  final String trendingType;
  final String Heading;
  final VoidCallback onTap;

  TitleWidget({required this.Heading, required this.trendingType, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.baseline,
        textBaseline: TextBaseline.alphabetic,
        children: [
          Text(Heading,style: TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: 22
          ),),
          SizedBox(
            width: 15,
          ),
          Text(trendingType,style: TextStyle(
              color: Colors.grey,
              fontWeight: FontWeight.w600
          ),),
          Expanded(
            child: SizedBox(
            ),
          ),
          TextButton(
            onPressed: onTap,
            child: Text(
              "More",style: TextStyle(
                fontWeight: FontWeight.w700,
                color: Color(0xffC31432)
            ),
            ),
          )
        ],
      ),
    );
  }
}
