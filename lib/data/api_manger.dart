import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:movies_app/models/popular_response.dart';
import 'package:movies_app/models/top_rated_response.dart';
import 'package:movies_app/models/upcoming_response.dart';

abstract class ApiManager {
  static const String defaultErrorMessage =
      "Invalid API key: You must be granted a valid key.";
  static const String baseUrl = "https://api.themoviedb.org";
  static const String apiKey = "1774d0b466b8c9352154c7fb8434cfbc";

  static Future<PopularResponse> loadPopular() async {
    try {
      Uri url = Uri.parse("$baseUrl/3/movie/popular?api_key=$apiKey");
      http.Response response = await http.get(url);
      Map<String, dynamic> mapBody = jsonDecode(response.body);
      PopularResponse popularResponse = PopularResponse.fromJson(mapBody);
      if (response.statusCode >= 200 && response.statusCode < 300) {
        return popularResponse;
      } else {
        throw popularResponse.statusMessage ?? defaultErrorMessage;
      }
    } catch (e) {
      rethrow;
    }
  }

  static Future<UpcomingResponse> loadUpcoming() async {
    try {
      Uri url = Uri.parse("$baseUrl/3/movie/upcoming?api_key=$apiKey");
      http.Response response = await http.get(url);
      Map<String, dynamic> mapBody = jsonDecode(response.body);
      UpcomingResponse upcomingResponse = UpcomingResponse.fromJson(mapBody);
      if (response.statusCode >= 200 && response.statusCode < 300) {
        return upcomingResponse;
      } else {
        throw upcomingResponse.statusMessage ?? defaultErrorMessage;
      }
    } catch (e) {
      rethrow;
    }
  }

  static Future<TopRatedResponse> loadTopRated() async {
    try {
      Uri url = Uri.parse("$baseUrl/3/movie/top_rated?api_key=$apiKey");
      http.Response response = await http.get(url);
      Map<String, dynamic> mapBody = jsonDecode(response.body);
      TopRatedResponse topRatedResponse = TopRatedResponse.fromJson(mapBody);
      if (response.statusCode >= 200 && response.statusCode < 300) {
        return topRatedResponse;
      } else {
        throw topRatedResponse.statusMessage ?? defaultErrorMessage;
      }
    } catch (e) {
      rethrow;
    }
  }
}
