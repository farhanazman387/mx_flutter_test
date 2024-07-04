import 'package:http/http.dart' as http;

class ApiService {
  final String apiUrl = "https://fakestoreapi.com/products";

  Future<http.Response> fetchProducts() async {
    return await http.get(Uri.parse(apiUrl));
  }
}