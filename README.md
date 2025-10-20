## AI Prompt Engineering (Dart)

A small Dart CLI playground to practice prompt engineering. It wraps the OpenAI Chat Completions API and provides five lightweight "agents" with focused system prompts:

- Summarizer
- Simple Explainer
- Code Reviewer
- Creative Writer
- Q&A Bot

### What this project is for
- **Hands-on prompt design**: experiment with how system and user prompts shape model behavior.
- **Constraint-driven outputs**: use strict formats (bullets, word limits) to improve reliability.
- **Parameter intuition**: tune temperature and token limits to balance creativity vs. control.
- **Reusable abstractions**: a tiny `OpenAIService` and agent classes to keep prompts organized.
- **Interactive learning**: run predefined experiments or try your own inputs in interactive mode.

### Quick start
1) Install Dart (SDK ≥ 3.9).
2) Fetch deps:
```bash
dart pub get
```
3) Run the app:
```bash
dart run bin/ai_prompt_engineering.dart
```

Tip: Provide your OpenAI API key in code or via your own config approach before running.

### What I understand by creating this project
- Clear instructions in system prompts are crucial; they act like policy and tone setters.
- Tight formatting requirements make outputs more consistent and evaluable.
- Small, single-purpose agents encourage modular prompts and easier iteration.
- Good defaults (temperature, max tokens) reduce variability without killing usefulness.
- Fast feedback loops (CLI + experiments) accelerate learning and refinement.
