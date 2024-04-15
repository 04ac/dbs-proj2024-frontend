import 'dart:convert';
import 'package:intl/intl.dart';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

class AuthRepo {
  static Future<http.Response> createCustomer(
      String uname, String passwd) async {
    final DateTime now = DateTime.now();
    final String currentDate = DateFormat('yyyy-mm-dd').format(now);

    final client = http.Client();

    final url = Uri.parse('https://dbs-proj2024-backend.vercel.app/customers/');
    final headers = {'Content-Type': 'application/json'};
    final body = {
      'name': uname,
      'account_created': currentDate,
      'passwd': passwd
    };

    final response =
        await client.post(url, headers: headers, body: jsonEncode(body));

    if (response.statusCode == 200) {
      final Map<String, dynamic> responseData = jsonDecode(response.body);
      if (kDebugMode) {
        print(
            'Customer created successfully with id: ${responseData['customer_id']}');
      }
    } else {
      if (kDebugMode) {
        print('Failed to create customer: ${response.statusCode}');
        print(response.body);
      }
    }
    return response;
  }
}
