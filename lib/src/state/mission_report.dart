import 'package:types_for_perception/beliefs.dart';

class MissionReport<T extends CoreBeliefs> {
  MissionReport(this.mission, this.state);
  final Mission mission;
  final T state;
}
