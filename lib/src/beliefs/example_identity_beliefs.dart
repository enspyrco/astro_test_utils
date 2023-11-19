import 'package:abstractions/identity.dart';
import 'package:abstractions/beliefs.dart';
import 'package:percepts/percepts.dart';

class ExampleIdentityBeliefs implements CoreBeliefs, IdentityConcept {
  ExampleIdentityBeliefs({required this.identity});

  static ExampleIdentityBeliefs get initial =>
      ExampleIdentityBeliefs(identity: DefaultIdentityBeliefs.initial);

  @override
  final DefaultIdentityBeliefs identity;

  @override
  ExampleIdentityBeliefs copyWith({DefaultIdentityBeliefs? identity}) {
    return ExampleIdentityBeliefs(identity: identity ?? this.identity);
  }

  @override
  toJson() => {'identity': identity.toJson()};

  @override
  bool operator ==(Object other) =>
      other is ExampleIdentityBeliefs && other.identity == identity;

  @override
  int get hashCode => identity.hashCode;
}
