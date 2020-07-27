///
/// venosyd ©2016-2020
///
/// sergio lisan <sels@venosyd.com>
///
library aio.logs.dialogs.logdialog;

import 'package:aio_dart/aio_dart.dart';
import 'package:aio_flutter/aio_flutter.dart';
import 'package:flutter/material.dart';

///
class LogDialog extends StatelessWidget {
  ///
  const LogDialog(this.log);

  ///
  final Log log;

  @override
  Widget build(BuildContext context) => BasicDialog(
        padding: const EdgeInsets.all(8),
        color: color(log.type),
        width: 500,
        height: 400,
        child: Column(
          children: [
            //
            if (log.title != null && log.title.isNotEmpty)
              _Header(title: 'Título', info: log.title) //
                  .Centered()
                  .Height(64),
            //
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _Header(title: 'Timestamp', info: log.timestampDT),
                _Header(title: 'Escopo', info: log.namespace ?? ''),
              ],
            ) //
                .Centered()
                .Height(64),
            //
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _Header(title: 'Módulo', info: log.module ?? ''),
                _Header(title: 'Usuário', info: log.user ?? ''),
              ],
            ) //
                .Centered()
                .Height(64),
            //
            _Texto(log.details) //
                .Scrollable()
                .Expanded(),
          ],
        ),
      );

  ///
  Color color(int type) {
    switch (type) {
      case 3:
        return Colors.red;
      case 2:
        return Colors.orange;
      case 1:
        return Colors.blue;
    }

    return Colors.grey;
  }
}

///
class _Texto extends StatelessWidget {
  ///
  const _Texto(this.texto, {this.bold = false});

  ///
  final String texto;

  ///
  final bool bold;

  @override
  Widget build(BuildContext context) => Text(
        texto,
        style: TextStyle(
          color: Colors.white,
          fontWeight: bold ? FontWeight.bold : FontWeight.normal,
          fontSize: 12,
        ),
      );
}

///
class _Header extends StatelessWidget {
  ///
  const _Header({this.title, this.info});

  ///
  final String title;

  ///
  final String info;

  @override
  Widget build(BuildContext context) => Row(
        children: [
          //
          _Texto(title, bold: true).Width(80),
          //
          _Texto(info)
              .Padding(const EdgeInsets.symmetric(horizontal: 12))
              .Expanded(),
        ],
      );
}
