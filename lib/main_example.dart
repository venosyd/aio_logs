///
/// sergio lisan <sels@venosyd.com>
///
/// venosyd ©2016-2020
///
library aio.logs.app.example;

import 'aio_logs.dart';

///
void main() => const AIOLogs(
      login_database: '<login_database_name>',
      logs_database: '<logs_database_name>',
      logs_authkey: '<logs_authkey>',
      host: 'http(s)://<host>',
      local_database: 'aio_logs',
      app_name: 'AIO Logs',
      flavor: 'production',
      isdev: false,
    ).run();
