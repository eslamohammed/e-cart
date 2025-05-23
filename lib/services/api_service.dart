import 'dart:convert';
import 'package:ecart/utils/constants.dart';
import 'package:http/http.dart' as http;
import '../models/product.dart';

class ApiService {

  static Future<List<Product>> fetchProducts() async {
    final response = await http.get(Uri.parse(Constants.baseUrl));
    if (response.statusCode == 200) {
      final List<dynamic> data = json.decode(response.body);
      return data.map((e) => Product.fromJson(e)).toList();
    } else {
      throw Exception('Failed to load products');
    }
  }
}
