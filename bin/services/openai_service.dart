import 'dart:convert';

import 'package:http/http.dart' as http;

class OpenAIService {
  final String apiKey;

  OpenAIService(this.apiKey);

  Future<String> chat({
    required String systemPrompt,
    required String userPrompt,
    double temperature = 0.7,
    int maxTokens = 300,
  }) async {
    try {
      final response = await http.post(
        Uri.parse('https://api.openai.com/v1/chat/completions'),
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $apiKey',
        },
        body: jsonEncode({
          'model': 'gpt-4o-mini',
          'messages': [
            {'role': 'system', 'content': systemPrompt},
            {'role': 'user', 'content': userPrompt},
          ],
          'max_tokens': maxTokens,
          'temperature': temperature,
        }),
      );

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        final message = data['choices'][0]['message']['content'];        

        return message;
      } else {
        throw Exception('API Error: ${response.body}: ${response.statusCode}');
      }
    } catch (e) {
      rethrow;
    } finally {
      // do nothing now
    }
  }

  Future<String> quickChat(String prompt) {
    return chat(
      systemPrompt: 'You are a helpful AI assistant.',
      userPrompt: prompt,
    );
  }
}
