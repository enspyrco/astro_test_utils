import 'package:abstractions/beliefs.dart';

import '../state/mission_report.dart';

class RecordMissionReports<T extends CoreBeliefs> extends Habit<T> {
  final List<MissionReport> updates = [];
  final Map<Cognition, T> stateForMission = {};

  @override
  void call(BeliefSystem<T> beliefSystem, Cognition mission) async {
    updates.add(MissionReport(mission, beliefSystem.beliefs));
    stateForMission[mission] = beliefSystem.beliefs;
  }

  bool includes(Cognition mission) => stateForMission[mission] != null;
}
