import 'package:percepts/percepts.dart';
import 'package:locator_for_perception/locator_for_perception.dart';
import 'package:flutter/material.dart';
import 'package:abstractions/beliefs.dart';

import 'system-checks/record_missions.dart';

/// A test harness for wrapping a "widget under test" that provides the
/// functionality that a test may need to interact with the widget or check for
/// expected values and behaviour.
///
/// The `widget` getter returns the `innerWidget` wrapped in a [Scaffold] then
/// a [MaterialApp].
///
/// We will continue to extend the class with more getters for different
/// mini-widget-trees that will be useful as wrappers around `child`.
///
/// The harness creates a [BeliefSystem] and by default adds it to the
/// [Locator]. Passing `addToLocator : false` will stop this behaviour.
///
/// The harness exposes [BeliefSystem.stream] so tests can observe started
/// missions and any associated state change.
class WidgetTestHarness<T extends CoreBeliefs> {
  WidgetTestHarness({
    required T initialState,
    required Widget innerWidget,
    BeliefSystem<T>? beliefSystem,
    Habits? systemChecks,
    bool addToLocator = true,
  }) : _widgetUnderTest = innerWidget {
    _beliefSystem = beliefSystem ??
        DefaultBeliefSystem<T>(
            state: initialState,
            systemChecks: systemChecks
              ?..postConclusion.add(_recordMissions)
              ..preConsideration.add(_recordMissions));
    if (addToLocator) Locator.add<BeliefSystem<T>>(_beliefSystem);
  }

  late final BeliefSystem<T> _beliefSystem;
  final Widget _widgetUnderTest;
  final _recordMissions = RecordMissions<T>();

  Widget get widget => MaterialApp(home: Scaffold(body: _widgetUnderTest));

  T get state => _beliefSystem.state;

  List<Cognition> get recordedMissions => _recordMissions.missions;

  void launch(Consideration<T> mission) => _beliefSystem.consider(mission);
  void land(Conclusion<T> mission) => _beliefSystem.conclude(mission);
}
