import '../services/openai_service.dart';

class Summarizer {
  final OpenAIService ai;

  Summarizer(this.ai);

  Future<String> summarize(String text) {
    const systemPrompt = '''
      You are a professional summarization expert.
      Your job is to extract the most important information from text.
      Always respond with exactly 3 bullet points.
      Each bullet point should be concise (max 15 words).
      Focus on key facts, not opinions.
      ''';

    final userPrompt =
        '''
      Summarize the following text in exactly 3 bullet points:
      $text
      Remember: 3 bullet points, each max 15 words, focus on key facts.
      ''';

    return ai.chat(
      systemPrompt: systemPrompt,
      userPrompt: userPrompt,
      temperature: 0.3,
      maxTokens: 200,
    );
  }
}

class SimpleExplainer {
  final OpenAIService ai;

  SimpleExplainer(this.ai);

  Future<String> explain(String topic) async {
    const systemPrompt = '''
      You are an expert teacher who explains complex topics simply.
      Use analogies, simple words, and clear examples.
      Explain as if talking to a curious 10-year-old child.
      Avoid jargon and technical terms unless you explain them first.
      Keep explanations under 150 words.
      ''';

    final userPrompt =
        '''
      Explain this topic in simple terms that a 10-year-old would understand:

      Topic: $topic

      Use an analogy or real-world example to make it clear.
      ''';

    return ai.chat(
      systemPrompt: systemPrompt,
      userPrompt: userPrompt,
      temperature: 0.5, // Medium temperature = clear but engaging
      maxTokens: 250,
    );
  }
}

/// Agent 3: Code Reviewer
/// Reviews code and suggests improvements
class CodeReviewer {
  final OpenAIService ai;

  CodeReviewer(this.ai);

  Future<String> review(String code, {String? language}) async {
    final lang = language ?? 'unknown';

    const systemPrompt = '''
      You are a senior software engineer conducting a code review.
      Analyze code for:
      1. Bugs and potential errors
      2. Performance issues
      3. Code clarity and readability
      4. Best practices violations
      5. Security concerns

      Format your response as:
      ✅ What's good
      ⚠️  Issues found
      💡 Suggestions for improvement

      Be specific and constructive.
      ''';

    final userPrompt =
        '''
      Review this $lang code:
      ```$lang
      $code
      ```

      Provide a professional code review with specific, actionable feedback.
      ''';

    return ai.chat(
      systemPrompt: systemPrompt,
      userPrompt: userPrompt,
      temperature: 0.2, // Very low temperature = precise, technical
      maxTokens: 400,
    );
  }
}

/// Agent 4: Creative Writer
/// Writes creative short stories
class CreativeWriter {
  final OpenAIService ai;

  CreativeWriter(this.ai);

  Future<String> writeStory(String topic, {String? genre}) async {
    final storyGenre = genre ?? 'general fiction';

    const systemPrompt = '''
      You are a creative fiction writer with a gift for storytelling.
      Write engaging short stories with:
      - Clear beginning, middle, and end
      - Vivid descriptions
      - Relatable characters
      - A meaningful message or twist

      Keep stories between 150-200 words.
      Make every word count.
      ''';

    final userPrompt =
        '''
      Write a short $storyGenre story about: $topic

      Requirements:
      - 150-200 words
      - Engaging narrative
      - Clear story arc
      - Meaningful ending
      ''';

    return ai.chat(
      systemPrompt: systemPrompt,
      userPrompt: userPrompt,
      temperature: 0.9, // High temperature = creative, varied
      maxTokens: 350,
    );
  }
}

/// Agent 5: Q&A Bot
/// Answers questions with accurate, helpful responses
class QABot {
  final OpenAIService ai;

  QABot(this.ai);

  Future<String> answer(String question, {bool detailedAnswer = false}) async {
    final depth = detailedAnswer ? 'detailed' : 'concise';

    const systemPrompt = '''
      You are a knowledgeable Q&A assistant.
      Provide accurate, helpful, and well-structured answers.

      Answer format:
      1. Direct answer first (1-2 sentences)
      2. Supporting explanation (if needed)
      3. Example or analogy (if helpful)

      Be factual and cite when uncertain.
      If you don't know, say so clearly.
      ''';

    final userPrompt =
        '''
      Question: $question

      Provide a $depth answer that is accurate and helpful.
      ''';

    return ai.chat(
      systemPrompt: systemPrompt,
      userPrompt: userPrompt,
      temperature: 0.4, // Balanced temperature = accurate but friendly
      maxTokens: detailedAnswer ? 400 : 200,
    );
  }
}
