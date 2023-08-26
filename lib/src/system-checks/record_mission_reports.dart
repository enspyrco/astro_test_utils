import 'package:types_for_perception/beliefs.dart';

import '../state/mission_report.dart';

class RecordMissionReports<T extends CoreBeliefs> extends SystemCheck<T> {
  final List<MissionReport> updates = [];
  final Map<Mission, T> stateForMission = {};

  @override
  void call(MissionControl<T> missionControl, Mission mission) async {
    updates.add(MissionReport(mission, missionControl.state));
    stateForMission[mission] = missionControl.state;
  }

  bool includes(Mission mission) => stateForMission[mission] != null;
}
