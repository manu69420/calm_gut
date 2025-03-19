import 'package:chat_api/chat_api_client.dart';
import 'package:http/http.dart' as http;
import 'package:mocktail/mocktail.dart';
import 'package:test/test.dart';

class MockHttpClient extends Mock implements http.Client {}

class MockResponse extends Mock implements http.Response {}

class FakeUri extends Fake implements Uri {}

void main() {
  group('ChatApiClient', () {
    late http.Client httpClient;
    late ChatApiClient chatApiClient;

    setUpAll(() {
      registerFallbackValue(FakeUri());
    });

    setUp(() {
      httpClient = MockHttpClient();
      chatApiClient = ChatApiClient(httpClient: httpClient);
    });

    group('constructor', () {
      test('does not require an httpClient', () {
        expect(ChatApiClient(), isNotNull);
      });
    });

    group('getRespone', () {
      const mockChatId = 'mock_chat_id';
      test('makes correct http request', () async {
        final response = MockResponse();
        when(() => response.statusCode).thenThrow(200);
        when(() => httpClient.post(any())).thenAnswer((_) async => response);
        try {
          await chatApiClient.getResponse(chatId: mockChatId);
        } catch (_) {
          verify(
            () => httpClient.post(
              Uri.https('calm-gut.onrender.com', 'chat/$mockChatId'),
            ),
          ).called(1);
        }
      });

      test('throws RequestFailure on non-200 response', () async {
        final response = MockResponse();
        when(() => response.statusCode).thenReturn(400);
        when(() => httpClient.post(any())).thenAnswer((_) async => response);
        expect(
          () async => chatApiClient.getResponse(chatId: mockChatId),
          throwsA(isA<RequestFailure>()),
        );
      });
    });
  });
}
