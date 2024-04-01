import 'package:movies_app/models/dates.dart';
import 'package:movies_app/models/results.dart';

class UpcomingResponse {
  Dates? dates;
  num? page;
  List<Results>? results;
  num? totalPages;
  num? totalResults;
  String? statusCode;
  String? statusMessage;

  UpcomingResponse(
      {this.totalPages,
      this.results,
      this.page,
      this.totalResults,
      this.dates,
      this.statusCode,
      this.statusMessage});

  UpcomingResponse.fromJson(dynamic json) {
    dates = json['dates'] != null ? Dates.fromJson(json['dates']) : null;
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
    if (dates != null) {
      map['dates'] = dates?.toJson();
    }
    map['page'] = page;
    if (results != null) {
      map['results'] = results?.map((v) => v.toJson()).toList();
    }
    map['total_pages'] = totalPages;
    map['total_results'] = totalResults;
    return map;
  }
}
