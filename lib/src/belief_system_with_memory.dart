import 'package:percepts/percepts.dart';
import 'package:abstractions/beliefs.dart';

import 'habits/record_cognition_habit.dart';

class BeliefSystemWithMemory<T extends CoreBeliefs> implements BeliefSystem<T> {
  BeliefSystemWithMemory({required T state}) {
    _beliefSystem = DefaultBeliefSystem<T>(
      beliefs: state,
      habits: DefaultHabits()
        ..preConsideration.add(_cognitionRecorder)
        ..postConclusion.add(_cognitionRecorder),
    );
  }

  late final BeliefSystem<T> _beliefSystem;
  final RecordCognitionHabit<T> _cognitionRecorder = RecordCognitionHabit<T>();

  bool recorded(Cognition mission) =>
      _cognitionRecorder.cognitions.contains(mission);

  @override
  void conclude(Conclusion<T> mission) => _beliefSystem.conclude(mission);

  @override
  Future<void> consider(Consideration<T> mission) =>
      _beliefSystem.consider(mission);

  @override
  Stream<T> get onBeliefUpdate => _beliefSystem.onBeliefUpdate;

  @override
  T get beliefs => _beliefSystem.beliefs;
}
