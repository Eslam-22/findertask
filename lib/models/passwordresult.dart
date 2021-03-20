import 'package:findertask/models/emailresult.dart';
import 'package:http/http.dart' as http;
import 'package:findertask/models/passwordresult.dart';
import 'package:findertask/models/status.dart';
import 'dart:convert';
import '../main.dart';
Future<PasswordResult> fetchpassword(password,email) async {


  final response =
  await http.post('http://finders.azurewebsites.net/api/login?password='+password+'&email='+email+'&fbclid=IwAR2XC7555ipotCkJVgPdOjte4QhZ0zvIe-gpI9rv346nWJg4mhT3wIG7vIs');
  alice.onHttpResponse(response);

  if (response.statusCode == 200) {
        print(' http://finders.azurewebsites.net/api/login?password='+password+'&email='+email+'&fbclid=IwAR2XC7555ipotCkJVgPdOjte4QhZ0zvIe-gpI9rv346nWJg4mhT3wIG7vIs');
    // If the server did return a 200 OK response,
    // then parse the JSON.

    return PasswordResult.fromJson(jsonDecode(response.body));
  } else {
    // If the server did not return a 200 OK response,
    // then throw an exception.
    throw Exception('Failed to load data');
  }
}
class PasswordResult {
  Status status;
  PasswordResult({this.status});

  PasswordResult.fromJson(Map<String, dynamic> json) {
    status =
    json['status'] != null ? new Status.fromJson(json['status']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.status != null) {
      data['status'] = this.status.toJson();
    }
    return data;
  }
}