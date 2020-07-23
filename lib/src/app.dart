///
/// sergio lisan <sels@venosyd.com>
///
/// venosyd ©2016-2020
///
library aio.logs.app;

import 'package:aio_dart/aio_dart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:meta/meta.dart';

import 'screens/_screens_.dart';

///
/// Entrypoint Widget
///
class AIOLogsApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) => MaterialApp(
        title: AppConfig.of(context).appName,
        debugShowCheckedModeBanner: false,
        // rotas
        initialRoute: '/',
        routes: {
          '/': (_) => Splash(),
          '/home': (_) => HomeScreen(),
          '/login': (_) => LoginScreen(),
        },
        // localizacao
        localizationsDelegates: const [
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        supportedLocales: const [Locale('pt')],
      );
}

///
/// Widget de Configuracoes do App
///
class AppConfig extends InheritedWidget {
  ///
  const AppConfig({
    @required this.appName,
    @required this.flavorName,
    @required Widget child,
    this.login,
    this.logs,
    this.localstorage,
    this.entities,
    this.isdev = false,
  }) : super(child: child);

  ///
  final String appName;

  ///
  final String flavorName;

  ///
  final LoginProvider login;

  ///
  final LogsProvider logs;

  ///
  final Database localstorage;

  ///
  final EntitiesRepository entities;

  ///
  final bool isdev;

  ///
  bool get isnotdev => !isdev;

  ///
  static AppConfig of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<AppConfig>();
  }

  @override
  bool updateShouldNotify(InheritedWidget oldWidget) => false;
}

///
/// classe com funcoes de auxilio para providers
///
abstract class Providers {
  /// servicos disponiveis no app
  static final Map<String, Function> services = {
    '$EntitiesRepository': (BuildContext ctx) => AppConfig.of(ctx).entities,
    '$LoginProvider': (BuildContext ctx) => AppConfig.of(ctx).login,
    '$LogsProvider': (BuildContext ctx) => AppConfig.of(ctx).logs,
    '$Database': (BuildContext ctx) => AppConfig.of(ctx).localstorage,
  };

  ///
  static T of<T>(BuildContext context) => services['$T'](context) as T;
}
