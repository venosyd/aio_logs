///
/// sergio lisan <sels@venosyd.com>
///
/// venosyd ©2016-2020
///
library aio.logs.screens.splash;

import 'package:aio_dart/aio_dart.dart';
import 'package:aio_flutter/aio_flutter.dart';
import 'package:flutter/material.dart';

import '../../app.dart';
import '../_screens_.dart';

///
class Splash extends StatelessWidget {
  @override
  Widget build(BuildContext context) => FutureBuilder<bool>(
        future: _islogged(context),
        //
        builder: (_, snap) => snap.hasData
            ? (snap.data ? HomeScreen() : LoginScreen())
            : const CircularLoader(),
      );

  ///
  Future<bool> _islogged(BuildContext context) async {
    await Future.delayed(const Duration(seconds: 2), () {});
    return await Providers.of<LoginProvider>(context).islogged;
  }
}
