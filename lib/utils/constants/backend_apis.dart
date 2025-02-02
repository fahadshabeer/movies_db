import 'dart:convert';

class BackendApis {
  static const baseUrl = "https://api.themoviedb.org/3";
  static const thumbnailBaseUrl = "https://image.tmdb.org/t/p/w300";
  static const coverBaseUrl = "https://image.tmdb.org/t/p/w780";

  static const discoverMovies = "$baseUrl/discover/movie?include_adult=false";
  static const movieDetails = "$baseUrl/movie/";
  static const apiKey = "789d434f7151a055716ed9ca1b1c863c";
}
