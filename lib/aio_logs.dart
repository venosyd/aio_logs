///
/// sergio lisan <sels@venosyd.com>
///
/// venosyd ©2016-2020
///
library aio.logs;

import 'package:aio_dart/aio_dart.dart';
import 'package:flutter/material.dart';

import 'src/app.dart';

///
class AIOLogs {
  ///
  const AIOLogs({
    @required this.login_database,
    @required this.logs_database,
    @required this.logs_authkey,
    @required this.host,
    this.local_database = 'aio_logs',
    this.app_name = 'AIO Logs',
    this.flavor = 'production',
    this.isdev = false,
  });

  ///
  final String app_name;

  ///
  final String flavor;

  ///
  final String login_database;

  ///
  final String logs_database;

  ///
  final String logs_authkey;

  ///
  final String local_database;

  ///
  final String host;

  ///
  final bool isdev;

  ///
  Future<void> run() async {
    WidgetsFlutterBinding.ensureInitialized();

    final localdb = HybridDatabase(local_database);

    final login = LoginProvider(
      host,
      localdb,
      login_database,
    );

    if (!await login.islogged) {
      // generic token only for basic operations
      login.token = 'c394637108ae3fb38e5c2acc8dd673521'
          '906f7942518a21658e3a0243d94475d';
    }

    final entities = RemoteEntitiesProvider(
      authkey: logs_authkey,
      database: logs_database,
      login: login,
      mongodb: RepositoryProvider(host),
      builder: entitiesMap,
      collectionmap: collectionMap,
    );

    final aio_logs = LogsProvider(
      namespace: '$app_name App',
      repositoryHost: host,
      login: login,
    );

    runApp(AppConfig(
      appName: app_name,
      flavorName: flavor,
      login: login,
      logs: aio_logs,
      entities: entities,
      localstorage: localdb,
      child: AIOLogsApp(),
      isdev: isdev,
    ));
  }
}
