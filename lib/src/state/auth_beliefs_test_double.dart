import 'package:types_for_auth/types_for_auth.dart';
import 'package:types_for_perception/auth_beliefs.dart';

class AuthBeliefsTestDouble implements AuthBeliefs {
  AuthBeliefsTestDouble({
    required this.user,
  });

  @override
  final UserAuthState user;

  @override
  AuthBeliefsTestDouble copyWith({
    UserAuthState? user,
  }) =>
      AuthBeliefsTestDouble(
        user: user ?? this.user,
      );

  @override
  Map<String, Object?> toJson() => {
        'user': user,
      };

  @override
  String toString() => 'user: $user, ';

  @override
  int get hashCode => user.hashCode;

  @override
  bool operator ==(Object other) =>
      other is AuthBeliefsTestDouble && user == other.user;
}
