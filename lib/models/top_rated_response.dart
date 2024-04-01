import 'package:movies_app/models/results.dart';

class TopRatedResponse {
  num? page;
  List<Results>? results;
  num? totalPages;
  num? totalResults;
  String? statusCode;
  String? statusMessage;

  TopRatedResponse(
      {this.totalResults,
      this.page,
      this.results,
      this.totalPages,
      this.statusCode,
      this.statusMessage});

  TopRatedResponse.fromJson(dynamic json) {
    page = json['page'];
    statusCode = json['code'];
    statusMessage = json['message'];
    if (json['results'] != null) {
      results = [];
      json['results'].forEach((v) {
        results?.add(Results.fromJson(v));
      });
    }
    totalPages = json['total_pages'];
    totalResults = json['total_results'];
  }

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['page'] = page;
    if (results != null) {
      map['results'] = results?.map((v) => v.toJson()).toList();
    }
    map['total_pages'] = totalPages;
    map['total_results'] = totalResults;
    return map;
  }
}
