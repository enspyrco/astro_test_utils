import 'package:abstractions/beliefs.dart';

/// We add a [RecordMissions] to [BeliefSystem.systemChecks] in [WidgetTestHarness]
/// so we can later check that missions were launched or landed.
class RecordMissions<T extends CoreBeliefs> extends Habit<T> {
  final List<Cognition> missions = [];

  @override
  void call(BeliefSystem<T> beliefSystem, Cognition mission) async =>
      missions.add(mission);
}
