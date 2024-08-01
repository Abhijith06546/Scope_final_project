import 'dart:convert';
import 'package:http/http.dart' as http;
import 'placement.dart';

class PlacementService {
  Future<List<Placement>> fetchPlacements({int count = 20}) async {
    final response = await http.get(Uri.parse('https://randomuser.me/api/?results=$count'));

    if (response.statusCode == 200) {
      List<dynamic> data = json.decode(response.body)['results'];
      return data.map((json) => Placement.fromJson(json)).toList();
      //data.map((json) list of JSON objects, where each JSON object is a map
    } else {
      throw Exception('Failed to load placements');
    }
  }
}
