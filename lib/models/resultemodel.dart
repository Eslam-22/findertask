import 'package:http/http.dart' as http;
import 'package:findertask/models/results.dart';
import 'package:findertask/models/status.dart';
import 'dart:convert';

Future<ResultModel> fetchcard() async {
  print("-----------------------------");

  final response = await http.get(
      'http://finders.azurewebsites.net/api/posts/all?premium=0&fbclid=IwAR0MmtouVDYRRoBu_3CK_HQl7Gw-6Enx0bdp8D6jlwOICv5BPGp3SWmEEvY');
     print(response);
  print("-----------------------------");
  if (response.statusCode == 200) {
    // If the server did return a 200 OK response,
    // then parse the JSON.
    return ResultModel.fromJson(jsonDecode(response.body));
  } else {
    // If the server did not return a 200 OK response,
    // then throw an exception.
    throw Exception('Failed to load album');
  }
}


class ResultModel {
  Status status;
  List<Results> results;
  ResultModel({this.status, this.results});
  ResultModel.fromJson(Map<String, dynamic> json) {
    status =
        json['status'] != null ? new Status.fromJson(json['status']) : null;
    if (json['results'] != null) {
      results = new List<Results>();
      json['results'].forEach((v) {
        results.add(new Results.fromJson(v));
      });
    }
  }
}
