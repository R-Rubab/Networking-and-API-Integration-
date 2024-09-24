import 'package:http/http.dart' as http;

import '../utils/export_files/export.dart';

class ApiService {
  final String baseUrl = 'https://jsonplaceholder.typicode.com';

  Future<List<Post>> fetchPosts() async {
    try {
      final response = await http.get(Uri.parse('$baseUrl/posts'));

      if (response.statusCode == 200) {
        List jsonResponse = json.decode(response.body);
        Utils.toastMessage('Successfully! Post APIS');
        return jsonResponse.map((post) => Post.fromJson(post)).toList();
      } else {
        Utils.toastMessage('${response.statusCode}');

        throw Exception(
            'Failed to load posts. \nStatus code: ${response.statusCode}');
      }
    } catch (error) {
      Utils.toastMessage('Error: $error');
      throw Exception('Failed to load posts. \nError: $error');
    }
  }
}
