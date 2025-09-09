import 'dart:convert';
import 'package:http/http.dart' as http;

class PhoneData {
  final String id;
  final String name;
  final Map<String, dynamic> data;

  PhoneData({required this.id, required this.name, required this.data});

  factory PhoneData.fromJson(Map<String, dynamic> json) {
    return PhoneData(
      id: json['id'],
      name: json['name'],
      data: json['data'] ?? {},
    );
  }
}

Future<List<PhoneData>> fetchedData() async {
  final response = await http.get(
    Uri.parse("http://api.restful-api.dev/objects"),
  );

  if (response.statusCode == 200) {
    final List<dynamic> jsonData = jsonDecode(response.body);
    return jsonData.map((item) => PhoneData.fromJson(item)).toList();
  } else {
    throw Exception('Feild to get Json');
  }
}
