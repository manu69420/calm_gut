import 'package:http/http.dart' as http;

class RequestFailure implements Exception {}

class ChatApiClient {
  ChatApiClient({http.Client? httpClient})
    : _httpClient = httpClient ?? http.Client();

  static const String _baseUrl = "calm-gut.onrender.com";
  final http.Client _httpClient;

  Future<void> getResponse({required String chatId}) async {
    final request = Uri.https(_baseUrl, "/chat/$chatId");

    final response = await _httpClient.post(request);

    if (response.statusCode != 200) {
      throw RequestFailure();
    }
  }

  Future<void> deleteHistory({required String chatId}) async {
    final request = Uri.https(_baseUrl, "/chat/$chatId/delete_history");

    final response = await _httpClient.delete(request);

    if (response.statusCode != 200) {
      throw RequestFailure();
    }
  }
}
