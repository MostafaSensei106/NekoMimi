import 'dart:convert';
import 'package:http/http.dart' as http;

class ApiService {
  final String baseUrl = 'http://127.0.0.1:8000'; // تأكد من استخدام عنوان IP الصحيح

  Future<Map<String, dynamic>> sendIpAddress(String ipAddress) async {
    final response = await http.post(
      Uri.parse('$baseUrl/get_ip_info/'),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({'ip_address': ipAddress}),
    );

    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      throw Exception('Failed to load IP info');
    }
  }
}
