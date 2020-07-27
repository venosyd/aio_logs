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
        padding: const EdgeInsets.fromLTRB(16, 16, 16, 4),
        color: color(log.type),
        width: 600,
        height: 400,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            //
            //
            if (log.title != null && log.title.isNotEmpty)
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  //
                  const _Texto('Título', bold: true).Width(80),
                  _Texto(log.title)
                      .Padding(const EdgeInsets.symmetric(horizontal: 12))
                      .Expanded(),
                ],
              ).Height(36),
            //
            //
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                //
                const _Texto('Timestamp', bold: true).Width(80),
                _Texto(log.timestampDT)
                    .Padding(const EdgeInsets.symmetric(horizontal: 12))
                    .Expanded(),
                //
                const _Texto('Escopo', bold: true).Width(80),
                _Texto(log.namespace ?? '')
                    .Padding(const EdgeInsets.symmetric(horizontal: 12))
                    .Expanded(),
              ],
            ).Height(36),

            //
            //
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                //
                const _Texto('Módulo', bold: true).Width(80),
                _Texto(log.module ?? '')
                    .Padding(const EdgeInsets.symmetric(horizontal: 12))
                    .Expanded(),
                //
                const _Texto('Usuário', bold: true).Width(80),
                _Texto(log.user ?? '')
                    .Padding(const EdgeInsets.symmetric(horizontal: 12))
                    .Expanded(),
              ],
            ).Height(36),
            //
            //
            const SizedBox(height: 12),
            //
            //
            _Texto(log.details) //
                .Scrollable()
                .Padding(const EdgeInsets.all(12))
                .Colored(Colors.black.withAlpha(25))
                .Rounded(const BorderRadius.all(Radius.circular(16)))
                .Expanded(),
            //
            //
            const SizedBox(height: 12),
            //
            //
            FlatButton(
              shape: const StadiumBorder(),
              onPressed: () => Navigator.pop(context),
              child: const Text('OK',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 14,
                  )),
            ).Height(36),
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
  Widget build(BuildContext context) => SelectableText(
        texto,
        style: TextStyle(
          color: Colors.white,
          fontWeight: bold ? FontWeight.bold : FontWeight.normal,
          fontSize: 12,
        ),
      );
}
