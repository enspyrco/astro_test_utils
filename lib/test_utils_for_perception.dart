library test_utils_for_perception;

export 'src/belief_system_with_memory.dart';
export 'src/widget_test_harness.dart';
export 'src/beliefs/user_auth_state_test_double.dart';
export 'src/beliefs/identity_beliefs_test_double.dart';
export 'src/beliefs/example_identity_beliefs.dart';

class PerceptionException implements Exception {
  PerceptionException(this.message);
  final String message;
}
