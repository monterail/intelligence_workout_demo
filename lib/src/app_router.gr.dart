// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i3;
import 'package:flutter/material.dart' as _i4;
import 'package:intelligence_demo_hr_tech/src/workout_feature/workout_details_view.dart'
    as _i1;
import 'package:intelligence_demo_hr_tech/src/workout_feature/workout_list_view.dart'
    as _i2;

/// generated route for
/// [_i1.WorkoutDetailsView]
class WorkoutDetailsRoute extends _i3.PageRouteInfo<WorkoutDetailsRouteArgs> {
  WorkoutDetailsRoute({
    _i4.Key? key,
    required String id,
    List<_i3.PageRouteInfo>? children,
  }) : super(
          WorkoutDetailsRoute.name,
          args: WorkoutDetailsRouteArgs(
            key: key,
            id: id,
          ),
          rawPathParams: {'id': id},
          initialChildren: children,
        );

  static const String name = 'WorkoutDetailsRoute';

  static _i3.PageInfo page = _i3.PageInfo(
    name,
    builder: (data) {
      final pathParams = data.inheritedPathParams;
      final args = data.argsAs<WorkoutDetailsRouteArgs>(
          orElse: () =>
              WorkoutDetailsRouteArgs(id: pathParams.getString('id')));
      return _i1.WorkoutDetailsView(
        key: args.key,
        id: args.id,
      );
    },
  );
}

class WorkoutDetailsRouteArgs {
  const WorkoutDetailsRouteArgs({
    this.key,
    required this.id,
  });

  final _i4.Key? key;

  final String id;

  @override
  String toString() {
    return 'WorkoutDetailsRouteArgs{key: $key, id: $id}';
  }
}

/// generated route for
/// [_i2.WorkoutListView]
class WorkoutListRoute extends _i3.PageRouteInfo<void> {
  const WorkoutListRoute({List<_i3.PageRouteInfo>? children})
      : super(
          WorkoutListRoute.name,
          initialChildren: children,
        );

  static const String name = 'WorkoutListRoute';

  static _i3.PageInfo page = _i3.PageInfo(
    name,
    builder: (data) {
      return const _i2.WorkoutListView();
    },
  );
}
