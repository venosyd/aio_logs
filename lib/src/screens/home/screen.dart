///
/// venosyd ©2016-2020
///
/// sergio lisan <sels@venosyd.com>
///
library aio.logs.screens.home;

import 'package:aio_dart/aio_dart.dart';
import 'package:aio_flutter/aio_flutter.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:responsive_builder/responsive_builder.dart';

import '../../app.dart';
import '../../widgets/_widgets_.dart';
import 'fragments/_fragments_.dart';

part 'large.dart';
part 'mobile.dart';

///
class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) => SafeArea(
        child: Scaffold(
          appBar: EmptyAppBar(),
          //
          body: ScreenTypeLayout(
            mobile: const _MobileScreen(),
            tablet: const _LargeScreen(),
            desktop: const _LargeScreen(),
          ),
        ),
      );
}

///
mixin _Logics {
  ///
  static final TODOS = Namespace(name: 'Todos');

  ///
  Future<List<Namespace>> namespaces(BuildContext context) async {
    final entities = Providers.of<EntitiesRepository>(context);
    final namespaces = await entities.all<Namespace>();
    namespaces.insert(0, TODOS);

    return namespaces;
  }

  ///
  void logout(BuildContext context) {
    final login = Providers.of<LoginProvider>(context);
    login.logout().then((_) => Navigator.popAndPushNamed(context, '/login'));
  }
}
