import 'package:flutter/material.dart';
import 'package:film/services/api_service.dart';
import 'package:film/models/movie.dart';
import 'package:film/screens/detail_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen ({super.key});

  @override
  HomeScreenState createState() => HomeScreenState();
}

class HomeScreenState extends State<HomeScreen> {
  final ApiService apiService = ApiService();

  List<Movie> allMovies = [];
  List<Movie> trendingMovies = [];
  List<Movie> popularMovies = [];

  @override
  void initState() {
    super.initState();
    _loadMovies();
  }

  Future<void> _loadMovies() async {
    final List<Map<String, dynamic>> allMoviesData = await apiService.getAllMovies();
    final List<Map<String, dynamic>> trendingMoviesData = await apiService.getTrendingMovies();
    final List<Map<String, dynamic>> popularMoviesData = await apiService.getPopularMovies();

    setState(() {
      allMovies = allMoviesData.map((e) => Movie.fromJson(e)).toList();
      trendingMovies = trendingMoviesData.map((e) => Movie.fromJson(e)).toList();
      popularMovies = popularMoviesData.map((e) => Movie.fromJson(e)).toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Film'),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            buildMoviesList(allMovies, 'All Movies'),
            buildMoviesList(trendingMovies, 'Trending Movies'),
            buildMoviesList(popularMovies, 'Popular Movies'),
          ],
        ),
      ),
    );
  }
}

Widget buildMoviesList(String title, List<Movie> movies) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: Text(
          title,
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),)
        ],
      );
}
class SectionTitle extends StatelessWidget {
  final String title;

  SectionTitle({required this.title});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Text(
        title,
        style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
      ),
    );
  }
}

class MovieList extends StatelessWidget {
  final List<Movie> movies;

  MovieList({required this.movies});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: movies.length,
        itemBuilder: (context, index) {
          final movie = movies[index];
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                Image.network(
                  movie.posterUrl,
                  height: 150,
                ),
                SizedBox(height: 8),
                Text(movie.title),
              ],
            ),
          );
        },
      ),
    );
  }
}