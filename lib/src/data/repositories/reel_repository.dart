import 'package:assessment/src/data/models/reel_model.dart';
import 'package:http/http.dart' as http;

class ReelRepository {
  static const String baseUrl =
      'https://backend-cj4o057m.fctl.app/bytes/scroll';

  static Future<List<Datum>> fetchReels({
    required int page,
    required int limit,
  }) async {
    final response = await http.get(
      Uri.parse(
        'https://backend-cj4o057m.fctl.app/bytes/scroll?page=$page&limit=$limit',
      ),
    );

    if (response.statusCode == 200) {
      final data = reelModelFromJson(response.body);
      return data.data!.data!;
    } else {
      throw Exception('Failed to load bytes');
    }
  }
}
