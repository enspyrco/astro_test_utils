import 'package:abstractions/beliefs.dart';

class CognitiveProcess<T extends CoreBeliefs> {
  CognitiveProcess(this.cognition, this.beliefs);
  final Cognition cognition;
  final T beliefs;
}
