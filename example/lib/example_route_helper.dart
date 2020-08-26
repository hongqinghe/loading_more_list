// GENERATED CODE - DO NOT MODIFY BY HAND
// **************************************************************************
// auto generated by https://github.com/fluttercandies/ff_annotation_route
// **************************************************************************

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';

class FFNavigatorObserver extends NavigatorObserver {
  final ShowStatusBarChange showStatusBarChange;
  final RouteChange routeChange;

  FFNavigatorObserver({this.showStatusBarChange, this.routeChange});

  @override
  void didPop(Route route, Route previousRoute) {
    super.didPop(route, previousRoute);
    _showStatusBarChange(previousRoute, route);
    _routeChange(previousRoute);
  }

  @override
  void didPush(Route route, Route previousRoute) {
    super.didPush(route, previousRoute);
    _showStatusBarChange(route, previousRoute);
    _routeChange(route);
  }

  @override
  void didRemove(Route route, Route previousRoute) {
    super.didRemove(route, previousRoute);
    _showStatusBarChange(previousRoute, route);
    _routeChange(previousRoute);
  }

  @override
  void didReplace({Route newRoute, Route oldRoute}) {
    super.didReplace(newRoute: newRoute, oldRoute: oldRoute);
    _showStatusBarChange(newRoute, oldRoute);
    _routeChange(newRoute);
  }

  @override
  void didStartUserGesture(Route route, Route previousRoute) {
    super.didStartUserGesture(route, previousRoute);
  }

  @override
  void didStopUserGesture() {
    super.didStopUserGesture();
  }

  void _showStatusBarChange(Route newRoute, Route oldRoute) {
    if (showStatusBarChange != null) {
      var newSettting = getFFRouteSettings(newRoute);
      var oldSetting = getFFRouteSettings(oldRoute);
      if (newSettting?.showStatusBar != null &&
          newSettting.showStatusBar != oldSetting?.showStatusBar) {
        showStatusBarChange(newSettting.showStatusBar);
      }
    }
  }

  void _routeChange(Route newRoute) {
    if (routeChange != null) {
      var newSettting = getFFRouteSettings(newRoute);
      if (newSettting?.routeName != null) {
        routeChange(newSettting.routeName);
      }
    }
  }

  FFRouteSettings getFFRouteSettings(Route route) {
    if (route != null &&
        route.settings != null &&
        route.settings is FFRouteSettings) {
      return route.settings;
    }
    return null;
  }
}

typedef ShowStatusBarChange = void Function(bool showStatusBar);

typedef RouteChange = void Function(String routeName);

class FFTransparentPageRoute<T> extends PageRouteBuilder<T> {
  FFTransparentPageRoute({
    RouteSettings settings,
    @required RoutePageBuilder pageBuilder,
    RouteTransitionsBuilder transitionsBuilder = _defaultTransitionsBuilder,
    Duration transitionDuration = const Duration(milliseconds: 300),
    bool barrierDismissible = false,
    Color barrierColor,
    String barrierLabel,
    bool maintainState = true,
  })  : assert(pageBuilder != null),
        assert(transitionsBuilder != null),
        assert(barrierDismissible != null),
        assert(maintainState != null),
        super(
            settings: settings,
            opaque: false,
            pageBuilder: pageBuilder,
            transitionsBuilder: transitionsBuilder,
            transitionDuration: transitionDuration,
            barrierDismissible: barrierDismissible,
            barrierColor: barrierColor,
            barrierLabel: barrierLabel,
            maintainState: maintainState);
}

Widget _defaultTransitionsBuilder(
    BuildContext context,
    Animation<double> animation,
    Animation<double> secondaryAnimation,
    Widget child) {
  return child;
}

Route<dynamic> onGenerateRouteHelper(
  RouteSettings settings, {
  Widget notFoundFallback,
  Object arguments,
  WidgetBuilder builder,
}) {
  arguments ??= settings.arguments;

  final RouteResult routeResult = getRouteResult(
    name: settings.name,
    arguments: arguments as Map<String, dynamic>,
  );
  if (routeResult.showStatusBar != null || routeResult.routeName != null) {
    settings = FFRouteSettings(
      name: settings.name,
      routeName: routeResult.routeName,
      arguments: arguments as Map<String, dynamic>,
      showStatusBar: routeResult.showStatusBar,
    );
  }
  Widget page = routeResult.widget ?? notFoundFallback;
  if (page == null) {
    throw Exception(
      '''Route "${settings.name}" returned null. Route Widget must never return null, 
          maybe the reason is that route name did not match with right path.
          You can use parameter[notFoundFallback] to avoid this ugly error.''',
    );
  }

  if (arguments is Map<String, dynamic>) {
    final RouteBuilder builder = arguments['routeBuilder'] as RouteBuilder;
    if (builder != null) {
      return builder(page);
    }
  }

  if (builder != null) {
    page = builder(page, routeResult);
  }

  switch (routeResult.pageRouteType) {
    case PageRouteType.material:
      return MaterialPageRoute<dynamic>(
        settings: settings,
        builder: (BuildContext _) => page,
      );
    case PageRouteType.cupertino:
      return CupertinoPageRoute<dynamic>(
        settings: settings,
        builder: (BuildContext _) => page,
      );
    case PageRouteType.transparent:
      return FFTransparentPageRoute<dynamic>(
        settings: settings,
        pageBuilder: (
          BuildContext _,
          Animation<double> __,
          Animation<double> ___,
        ) =>
            page,
      );
    default:
      return kIsWeb || !Platform.isIOS
          ? MaterialPageRoute<dynamic>(
              settings: settings,
              builder: (BuildContext _) => page,
            )
          : CupertinoPageRoute<dynamic>(
              settings: settings,
              builder: (BuildContext _) => page,
            );
  }
}

typedef RouteBuilder = PageRoute<dynamic> Function(Widget page);

class FFRouteSettings extends RouteSettings {
  final String routeName;
  final bool showStatusBar;
  const FFRouteSettings({
    this.routeName,
    this.showStatusBar,
    String name,
    bool isInitialRoute = false,
    Object arguments,
  }) : super(name: name, arguments: arguments);
}

/// Signature for a function that creates a widget, e.g.
typedef WidgetBuilder = Widget Function(Widget child, RouteResult routeResult);
