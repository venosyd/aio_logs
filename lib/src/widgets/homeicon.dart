///
/// sergio lisan <sels@venosyd.com>
///
/// venosyd © 2019-2020
///
library aio.logs.app.widget.homeicon;

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:aio_flutter/aio_flutter.dart';

///
class HomeIcon extends StatelessWidget {
  ///
  const HomeIcon({
    @required this.icone,
    @required this.action,
    this.selectedcolor = const Color(0xFF424242),
    this.descricao,
    this.selected = false,
  });

  ///
  final IconData icone;

  ///
  final String descricao;

  ///
  final bool selected;

  ///
  final Color selectedcolor;

  ///
  final void Function() action;

  @override
  Widget build(BuildContext context) => Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          //
          FaIcon(
            icone,
            color: selected ? selectedcolor : Colors.white,
            size: 20,
          ),
          //
          Text(
            descricao,
            style: TextStyle(
              color: selected ? selectedcolor : Colors.white,
              fontFamily: 'Open Sans Light',
              fontWeight: selected ? FontWeight.bold : FontWeight.normal,
              fontSize: 11,
            ),
          ),
        ],
      )
          .Padding(const EdgeInsets.all(4))
          .Centered()
          .Sizedbox(width: 64, height: 48)
          .Ripplefy(action: action)
          .Rounded(const BorderRadius.all(Radius.circular(8)));
}
