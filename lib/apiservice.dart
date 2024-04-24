import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;
import 'lesson_model.dart';

class LessonApiService {
  static Future<LessonModel> fetchLessons() async {
    final response = await http.get(
        Uri.parse('https://632017e19f82827dcf24a655.mockapi.io/api/lessons'));

    if (response.statusCode == 200) {
      Map<String, dynamic> jsonResponse = jsonDecode(response.body);
      print('${response.body}');
      return LessonModel.fromJson(jsonResponse);
    } else {
      throw Exception('Failed to load Lessons');
    }
  }


/*static Future <LessonModel> fetchLessons() async {
    print('Reading from asset');
    final String response =
        await rootBundle.loadString('assets/sample_test.json');

    if (response != null) {
      Map<String, dynamic> jsonResponce = jsonDecode(response);
      print('$jsonResponce}');

      return LessonModel.fromJson(jsonResponce);
    } else {
      throw Exception('Failed to load Lessons');
    }


*/
}