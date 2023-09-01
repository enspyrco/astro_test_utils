import 'package:abstractions/beliefs.dart';

/// We add a [RecordCognitionHabit] to [BeliefSystem.systemChecks] in [WidgetTestHarness]
/// so we can later check that cognitions occured.
class RecordCognitionHabit<T extends CoreBeliefs> extends Habit<T> {
  final List<Cognition> cognitions = [];

  @override
  void call(BeliefSystem<T> beliefSystem, Cognition cognition) async =>
      cognitions.add(cognition);
}
