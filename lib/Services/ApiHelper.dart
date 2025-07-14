import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

// helper class to handle GET requests
//***************************************************** */
class HelperApiGet {
  Future<dynamic> Get({required String url, @required String? token}) async {
    final headers = <String, String>{
      'Content-Type': 'application/json',
      'Accept': 'application/json',
    };
    if (token != null) {
      headers['Authorization'] = 'Bearer $token';
    }
    try {
      // إرسال طلب HTTP GET
      http.Response response = await http.get(Uri.parse(url));

      // التحقق من نجاح الطلب
      if (response.statusCode == 200) {
        // تحويل JSON إلى List<dynamic>
        return jsonDecode(response.body);
      } else {
        // في حالة فشل الطلب
        throw Exception('Failed to load data: ${response.statusCode}');
      }
    } catch (e) {
      // معالجة الأخطاء (مثل مشاكل الاتصال)
      throw Exception('Error fetching data: $e');
    }
  }
}

//***************************************************** */
// helper class to handle POST requests
class HelperApiPost {
  Future<Map<String, dynamic>> post({
    required String url,
    required Map<String, dynamic> body,
    required String? token,
  }) async {
    try {
      // إعداد الرؤوس
      final headers = <String, String>{
        'Content-Type': 'application/json',
        'Accept': 'application/json',
      };
      if (token != null) {
        headers['Authorization'] = 'Bearer $token';
      }

      // إرسال طلب HTTP POST
      final response = await http.post(
        Uri.parse(url),
        headers: headers,
        body: jsonEncode(body),
      );

      // التحقق من نجاح الطلب
      if (response.statusCode >= 200 && response.statusCode < 300) {
        return jsonDecode(response.body) as Map<String, dynamic>;
      } else {
        throw Exception(
          'Failed to post data: ${response.statusCode}, ${response.body}',
        );
      }
    } catch (e) {
      throw Exception('Error posting data: $e');
    }
  }
}

//***************************************************** */
// helper class to handle PUT requests

// ...existing code...
class HelperApiPut {
  Future<Map<String, dynamic>> put({
    required String url,
    required Map<String, dynamic> body,
    String? token,
  }) async {
    try {
      final headers = <String, String>{
        'Content-Type': 'application/json', // تم تصحيح نوع المحتوى هنا
        'Accept': 'application/json',
      };
      if (token != null) {
        headers['Authorization'] = 'Bearer $token';
      }

      final response = await http.put(
        Uri.parse(url),
        headers: headers,
        body: jsonEncode(body),
      );

      if (response.statusCode >= 200 && response.statusCode < 300) {
        return jsonDecode(response.body) as Map<String, dynamic>;
      } else {
        throw Exception(
          'Failed to update data: ${response.statusCode}, ${response.body}',
        );
      }
    } catch (e) {
      throw Exception('Error updating data: $e');
    }
  }
}

// ...existing code...
