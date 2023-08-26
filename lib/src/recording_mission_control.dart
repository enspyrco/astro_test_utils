import 'package:core_of_perception/core_of_perception.dart';
import 'package:types_for_perception/beliefs.dart';

import 'system-checks/record_missions.dart';

class RecordingMissionControl<T extends CoreBeliefs>
    implements MissionControl<T> {
  RecordingMissionControl({required T state}) {
    _missionControl = DefaultMissionControl<T>(
        state: state,
        systemChecks: DefaultSystemChecks()
          ..preLaunch.add(_missionRecorder)
          ..postLand.add(_missionRecorder));
  }

  late final MissionControl<T> _missionControl;
  final RecordMissions<T> _missionRecorder = RecordMissions<T>();

  bool recorded(Mission mission) => _missionRecorder.missions.contains(mission);

  @override
  void land(LandingMission<T> mission) => _missionControl.land(mission);

  @override
  Future<void> launch(AwayMission<T> mission) =>
      _missionControl.launch(mission);

  @override
  Stream<T> get onStateChange => _missionControl.onStateChange;

  @override
  T get state => _missionControl.state;
}
