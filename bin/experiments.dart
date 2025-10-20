import 'dart:io';

import './services/openai_service.dart';
import 'ai_templates/prompt_templates.dart';

Future<void> experiment1_Summarizer(Summarizer summarizer) async {
  print('\n${'═' * 60}');
  print('EXPERIMENT 1: SUMMARIZER');
  print('═' * 60);
  
  const longText = '''
Flutter is Google's UI toolkit for building beautiful, natively compiled 
applications for mobile, web, and desktop from a single codebase. Flutter 
works with existing code, is used by developers and organizations around 
the world, and is free and open source. Flutter's framework is written in 
Dart, a modern object-oriented programming language. Dart is optimized for 
UI development and can be compiled to native machine code. The Flutter 
framework provides a rich set of pre-built widgets that you can use to 
quickly build complex UIs. You can also create your own custom widgets by 
composing existing widgets or painting directly to the canvas.
''';
  
  print('\n📄 Original text (${longText.length} characters)\n');
  print('🤖 Summarizing...\n');
  
  final summary = await summarizer.summarize(longText);
  
  print('📋 SUMMARY:');
  print(summary);
  print('\n');
}

/// Experiment 2: Test Simple Explainer
Future<void> experiment2_Explainer(SimpleExplainer explainer) async {
  print('\n${'═' * 60}');
  print('EXPERIMENT 2: SIMPLE EXPLAINER');
  print('═' * 60);
  
  const topics = [
    'What is a blockchain?',
    'How does machine learning work?',
    'What is the BLoC pattern in Flutter?',
  ];
  
  for (final topic in topics) {
    print('\n❓ Topic: $topic');
    print('🤖 Explaining...\n');
    
    final explanation = await explainer.explain(topic);
    
    print('💡 EXPLANATION:');
    print(explanation);
    print('\n${'-' * 60}');
  }
}

/// Experiment 3: Test Code Reviewer
Future<void> experiment3_CodeReviewer(CodeReviewer reviewer) async {
  print('\n${'═' * 60}');
  print('EXPERIMENT 3: CODE REVIEWER');
  print('═' * 60);
  
  const dartCode = '''
void fetchUserData(String userId) {
  var response = http.get('https://api.example.com/users/' + userId);
  var data = json.decode(response.body);
  print(data['name']);
}
''';
  
  print('\n💻 Code to review:');
  print(dartCode);
  print('🤖 Reviewing...\n');
  
  final review = await reviewer.review(dartCode, language: 'Dart');
  
  print('📝 CODE REVIEW:');
  print(review);
  print('\n');
}

/// Experiment 4: Test Creative Writer
Future<void> experiment4_CreativeWriter(CreativeWriter writer) async {
  print('\n${'═' * 60}');
  print('EXPERIMENT 4: CREATIVE WRITER');
  print('═' * 60);
  
  const prompts = [
    ('A programmer who discovers their code is alive', 'sci-fi'),
    ('A yoga teacher in a futuristic city', 'science fiction'),
  ];
  
  for (final (topic, genre) in prompts) {
    print('\n✍️  Topic: $topic');
    print('🎭 Genre: $genre');
    print('🤖 Writing...\n');
    
    final story = await writer.writeStory(topic, genre: genre);
    
    print('📖 STORY:');
    print(story);
    print('\n${'-' * 60}');
  }
}

/// Experiment 5: Test Q&A Bot
Future<void> experiment5_QABot(QABot qaBot) async {
  print('\n${'═' * 60}');
  print('EXPERIMENT 5: Q&A BOT');
  print('═' * 60);
  
  const questions = [
    'What is the time complexity of merge sort?',
    'Why is Flutter fast?',
    'What is the difference between State and StatefulWidget?',
  ];
  
  for (final question in questions) {
    print('\n❓ Question: $question');
    print('🤖 Answering...\n');
    
    final answer = await qaBot.answer(question);
    
    print('✅ ANSWER:');
    print(answer);
    print('\n${'-' * 60}');
  }
}

/// Interactive mode - let user test custom prompts
Future<void> interactiveMode(
  OpenAIService ai,
  Summarizer summarizer,
  SimpleExplainer explainer,
  CodeReviewer reviewer,
  CreativeWriter writer,
  QABot qaBot,
) async {
  print('\n${'═' * 60}');
  print('INTERACTIVE MODE');
  print('═' * 60);
  print('\nChoose an agent to test with custom input:');
  print('1. Summarizer');
  print('2. Explainer');
  print('3. Code Reviewer');
  print('4. Creative Writer');
  print('5. Q&A Bot');
  print('6. Skip\n');
  
  stdout.write('Enter choice (1-6): ');
  final choice = stdin.readLineSync();
  
  if (choice == '6' || choice == null) {
    print('\nExperiments complete! 🎉\n');
    return;
  }
  
  switch (choice) {
    case '1':
      stdout.write('\nEnter text to summarize: ');
      final text = stdin.readLineSync() ?? '';
      if (text.isNotEmpty) {
        print('\n🤖 Summarizing...\n');
        final result = await summarizer.summarize(text);
        print('📋 SUMMARY:\n$result\n');
      }
      break;
      
    case '2':
      stdout.write('\nEnter topic to explain: ');
      final topic = stdin.readLineSync() ?? '';
      if (topic.isNotEmpty) {
        print('\n🤖 Explaining...\n');
        final result = await explainer.explain(topic);
        print('💡 EXPLANATION:\n$result\n');
      }
      break;
      
    case '3':
      stdout.write('\nEnter code to review: ');
      final code = stdin.readLineSync() ?? '';
      if (code.isNotEmpty) {
        print('\n🤖 Reviewing...\n');
        final result = await reviewer.review(code);
        print('📝 REVIEW:\n$result\n');
      }
      break;
      
    case '4':
      stdout.write('\nEnter story topic: ');
      final topic = stdin.readLineSync() ?? '';
      if (topic.isNotEmpty) {
        print('\n🤖 Writing...\n');
        final result = await writer.writeStory(topic);
        print('📖 STORY:\n$result\n');
      }
      break;
      
    case '5':
      stdout.write('\nEnter question: ');
      final question = stdin.readLineSync() ?? '';
      if (question.isNotEmpty) {
        print('\n🤖 Answering...\n');
        final result = await qaBot.answer(question);
        print('✅ ANSWER:\n$result\n');
      }
      break;
      
    default:
      print('Invalid choice!\n');
  }
  
  print('Experiments complete! 🎉\n');
}