import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/cupertino.dart';
import 'package:app_proyecto_actividades/models/actividad_models.dart';

class ApiClient {
  Future<Activity> getActivity() async {
    late Activity activity;
    const url = 'https://www.boredapi.com/api/activity/';
    final response = await http.get(Uri.parse(url));
    if (response.statusCode < 300) {
      final jsonResponse = jsonDecode(response.body);
      activity = Activity.fromJson(jsonResponse);
    } else {
      debugPrint(response.body);
    }
    return activity;
  }
}
