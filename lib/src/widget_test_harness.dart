import 'package:percepts/percepts.dart';
import 'package:locator_for_perception/locator_for_perception.dart';
import 'package:flutter/material.dart';
import 'package:abstractions/beliefs.dart';

import 'habits/record_cognition_habit.dart';

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
/// The harness exposes [BeliefSystem.stream] so tests can observe cognitive
/// processes (ie. cognition and any associated belief updates).
class WidgetTestHarness<T extends CoreBeliefs> {
  WidgetTestHarness({
    required T initialBeliefs,
    required Widget innerWidget,
    BeliefSystem<T>? beliefSystem,
    Habits? habits,
    bool addToLocator = true,
  }) : _widgetUnderTest = innerWidget {
    _beliefSystem = beliefSystem ??
        DefaultBeliefSystem<T>(
            beliefs: initialBeliefs,
            habits: habits
              ?..postConclusion.add(_recordCognitions)
              ..preConsideration.add(_recordCognitions));
    if (addToLocator) Locator.add<BeliefSystem<T>>(_beliefSystem);
  }

  late final BeliefSystem<T> _beliefSystem;
  final Widget _widgetUnderTest;
  final _recordCognitions = RecordCognitionHabit<T>();

  Widget get widget => MaterialApp(home: Scaffold(body: _widgetUnderTest));

  T get state => _beliefSystem.beliefs;

  List<Cognition> get recordedCognitions => _recordCognitions.cognitions;

  void consider(Consideration<T> consideration) =>
      _beliefSystem.consider(consideration);
  void conclude(Conclusion<T> conclusion) => _beliefSystem.conclude(conclusion);
}
