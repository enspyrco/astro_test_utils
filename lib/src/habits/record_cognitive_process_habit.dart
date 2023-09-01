import 'package:abstractions/beliefs.dart';

import '../beliefs/cognitive_process.dart';

class RecordCognitiveProcessHabit<T extends CoreBeliefs> extends Habit<T> {
  final List<CognitiveProcess> updates = [];
  final Map<Cognition, T> beliefForCognition = {};

  @override
  void call(BeliefSystem<T> beliefSystem, Cognition cognition) async {
    updates.add(CognitiveProcess(cognition, beliefSystem.beliefs));
    beliefForCognition[cognition] = beliefSystem.beliefs;
  }

  bool includes(Cognition mission) => beliefForCognition[mission] != null;
}
