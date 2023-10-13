// import 'package:abstractions/identity.dart';

// import '../../test_utils_for_perception.dart';

// class IdentityBeliefsTestDouble implements IdentityBeliefs {
//   IdentityBeliefsTestDouble({
//     required this.credentials,
//     required this.userAuthState,
//   });

//   @override
//   final Map<IdentityProvider, String> credentials;
//   @override
//   final UserAuthStateTestDouble userAuthState;

//   @override
//   IdentityBeliefsTestDouble copyWith({
//     Map<IdentityProvider, String>? credentials,
//     UserAuthStateTestDouble? userAuthState,
//   }) =>
//       IdentityBeliefsTestDouble(
//         credentials: credentials ?? this.credentials,
//         userAuthState: userAuthState ?? this.userAuthState,
//       );

//   @override
//   Map<String, Object?> toJson() => {
//         'credentials': credentials,
//         'userAuthState': userAuthState.toJson(),
//       };

//   @override
//   String toString() =>
//       'userAuthState: $userAuthState, credentials: $credentials';

//   @override
//   int get hashCode => Object.hash(credentials, userAuthState);

//   @override
//   bool operator ==(Object other) =>
//       other is IdentityBeliefsTestDouble &&
//       credentials == other.credentials &&
//       userAuthState == other.userAuthState;
// }
