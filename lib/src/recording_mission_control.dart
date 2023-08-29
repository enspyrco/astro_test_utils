import 'package:percepts/percepts.dart';
import 'package:abstractions/beliefs.dart';

import 'system-checks/record_missions.dart';

class RecordingBeliefSystem<T extends CoreBeliefs> implements BeliefSystem<T> {
  RecordingBeliefSystem({required T state}) {
    _beliefSystem = DefaultBeliefSystem<T>(
        state: state,
        systemChecks: DefaultHabits()
          ..preConsideration.add(_missionRecorder)
          ..postConclusion.add(_missionRecorder));
  }

  late final BeliefSystem<T> _beliefSystem;
  final RecordMissions<T> _missionRecorder = RecordMissions<T>();

  bool recorded(Cognition mission) =>
      _missionRecorder.missions.contains(mission);

  @override
  void conclude(Conclusion<T> mission) => _beliefSystem.conclude(mission);

  @override
  Future<void> consider(Consideration<T> mission) =>
      _beliefSystem.consider(mission);

  @override
  Stream<T> get onBeliefUpdate => _beliefSystem.onBeliefUpdate;

  @override
  T get state => _beliefSystem.state;
}
