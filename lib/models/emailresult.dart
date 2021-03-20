import 'package:http/http.dart' as http;
import 'package:findertask/models/emailresult.dart';
import 'package:findertask/models/status.dart';
import 'dart:convert';

import '../main.dart';
Future<EmailResult> fetchemail(email) async {

  final response =
  await http.get('http://finders.azurewebsites.net/api/check?email='+email+'&fbclid=IwAR1E49MWtpXeZZJ627GvyrwnlX1qmyFYKc-J_bJh0losaGwIBRHd1jgFnys');
   alice.onHttpResponse(response);

  if (response.statusCode == 200) {
    print('func of email result');
    // If the server did return a 200 OK response,
    // then parse the JSON.

    return EmailResult.fromJson(jsonDecode(response.body));
  } else {
   print(' invalide email');

    throw Exception('Failed to load album');
  }
}
class EmailResult {
  Status status;

  EmailResult({this.status});

  EmailResult.fromJson(Map<String, dynamic> json) {
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