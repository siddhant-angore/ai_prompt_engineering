import './services/openai_service.dart';
import 'ai_templates/prompt_templates.dart';
import 'experiments.dart';

void main(List<String> arguments) async {
  final OpenAIService ai = OpenAIService('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');

  print(await ai.quickChat('What is AI?'));

  // Initialize all agents
  final summarizer = Summarizer(ai);
  final explainer = SimpleExplainer(ai);
  final reviewer = CodeReviewer(ai);
  final writer = CreativeWriter(ai);
  final qaBot = QABot(ai);
  
  // Run experiments
  await experiment1_Summarizer(summarizer);
  await experiment2_Explainer(explainer);
  await experiment3_CodeReviewer(reviewer);
  await experiment4_CreativeWriter(writer);
  await experiment5_QABot(qaBot);

  await interactiveMode(ai, summarizer, explainer, reviewer, writer, qaBot);
}


