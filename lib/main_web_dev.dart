///
/// sergio lisan <sels@venosyd.com>
///
/// venosyd ©2016-2020
///
library aio.logs.app.entrypoint.dev;

import 'package:aio_dart/aio_dart.dart';
import 'package:flutter/material.dart';
import 'package:yaml/yaml.dart';

import 'config.dart';
import 'src/app.dart';

///
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final dynamic doc = loadYaml(CONFIG);
  final logindb = doc['login-database'] as String;

  final logsdb = doc['logs-database'] as String;
  final logsauthkey = doc['logs-authkey'] as String;

  final host = doc['development-host'] as String;

  final localdb = HybridDatabase('aio_logs');

  final login = LoginProvider(
    host,
    localdb,
    logindb,
  );

  if (!await login.islogged) {
    // generic token only for basic operations
    login.token = 'c394637108ae3fb38e5c2acc8dd673521'
        '906f7942518a21658e3a0243d94475d';
  }

  final entities = RemoteEntitiesProvider(
    authkey: logsauthkey,
    database: logsdb,
    login: login,
    mongodb: RepositoryProvider(host),
    builder: entitiesMap,
    collectionmap: collectionMap,
  );

  final aio_logs = LogsProvider(
    namespace: 'AIO Logs App',
    repositoryHost: host,
    login: login,
  );

  runApp(AppConfig(
    appName: 'AIO Logs',
    flavorName: 'production',
    login: login,
    logs: aio_logs,
    entities: entities,
    localstorage: localdb,
    child: AIOLogsApp(),
    isdev: true,
  ));
}
