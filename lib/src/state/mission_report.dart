import 'package:types_for_perception/core_types.dart';
import 'package:types_for_perception/state_types.dart';

class MissionReport<T extends AstroState> {
  MissionReport(this.mission, this.state);
  final Mission mission;
  final T state;
}
