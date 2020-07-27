///
/// venosyd ©2016-2020
///
/// sergio lisan <sels@venosyd.com>
///
library aio.logs.home.fragment.logs;

import 'package:aio_dart/aio_dart.dart';
import 'package:aio_flutter/aio_flutter.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:responsive_builder/responsive_builder.dart';

import '../../../../app.dart';
import '../../../../dialogs/_dialogs.dart';

part 'large.dart';
part 'mobile.dart';

///
class LogsFragment extends StatelessWidget {
  ///
  const LogsFragment(this.namespace, this.type);

  ///
  final Namespace namespace;

  ///
  final int type;

  @override
  Widget build(BuildContext context) => ScreenTypeLayout(
        mobile: _MobileFragment(namespace, type),
        tablet: _LargeFragment(namespace, type),
        desktop: _LargeFragment(namespace, type),
      );
}

///
mixin _Logics {
  ///
  String space(int times) => '\t' * times;

  String _shrink(String value) {
    value ??= '';
    value = value.length > 30 ? '${value.substring(0, 27)}...' : value;

    return value;
  }

  ///
  Future<List<Log>> logs(
    BuildContext context,
    TextEditingController queryctrl,
    String namespace,
    double type,
  ) async {
    final entities = Providers.of<EntitiesRepository>(context);
    var logs = await entities.listByQuery<Log>(<String, dynamic>{
      if (namespace != 'Todos') 'namespace': namespace,
      'type': type,
    });

    final query = (queryctrl.text ?? '').toLowerCase();
    if (query.isNotEmpty)
      logs = logs.where((l) => '$l'.toLowerCase().contains(query)).toList();

    return logs.reversed.toList();
  }

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
class _TitleDefinition extends StatelessWidget {
  ///
  const _TitleDefinition(this.title, this.text);

  ///
  final String title;

  ///
  final String text;

  @override
  Widget build(BuildContext context) => Row(
        children: [
          Text(
            title,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 12,
            ),
          ).Width(100),
          Text(
            text,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 12,
            ),
          ).Expanded(),
        ],
      );
}
