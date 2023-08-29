import 'package:abstractions/beliefs.dart';

class MissionReport<T extends CoreBeliefs> {
  MissionReport(this.mission, this.state);
  final Cognition mission;
  final T state;
}
