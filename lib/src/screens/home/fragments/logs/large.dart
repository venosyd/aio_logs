///
/// venosyd ©2016-2020
///
/// sergio lisan <sels@venosyd.com>
///
part of aio.logs.home.fragment.logs;

///
class _LargeFragment extends StatefulWidget {
  ///
  const _LargeFragment(this.namespace, this.type);

  ///
  final Namespace namespace;

  ///
  final int type;

  @override
  __LargeFragmentState createState() => __LargeFragmentState();
}

///
class __LargeFragmentState extends State<_LargeFragment> with _Logics {
  ///
  final TextEditingController _queryctrl = TextEditingController();

  ///
  String get namespace => widget.namespace.name;

  ///
  double get type => widget.type.toDouble();

  @override
  Widget build(BuildContext context) => FutureBuilder<List<Log>>(
        future: logs(context, _queryctrl, namespace, type),
        builder: (_, snap) => snap.hasData
            ? Stack(
                children: [
                  //

                  if (snap.data.isNotEmpty)
                    //
                    Positioned.fill(
                      child: Wrap(
                        children: [
                          for (final log in snap.data)
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              children: [
                                //
                                Text(
                                  log.timestampDT,
                                  style: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 14,
                                  ),
                                ),
                                //
                                const SizedBox(height: 8),
                                //
                                _TitleDefinition(
                                  'Namespace',
                                  log.namespace ?? '',
                                ),
                                //
                                const SizedBox(height: 8),
                                //
                                _TitleDefinition(
                                  'Título',
                                  log.title ?? '',
                                ),
                                //
                                const SizedBox(height: 8),
                                //
                                _TitleDefinition(
                                  'Módulo',
                                  log.module ?? '',
                                ),
                                //
                                const SizedBox(height: 8),
                                //
                                _TitleDefinition(
                                  'Usuário',
                                  log.user ?? '',
                                ),
                                //
                                const SizedBox(height: 32),
                                //
                                Text(
                                  log.details ?? '',
                                  style: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 12,
                                  ),
                                ),
                              ],
                            )
                                .Width(350)
                                .Padding(const EdgeInsets.all(24))
                                .Colored(color(widget.type))
                                .Rounded(
                                    const BorderRadius.all(Radius.circular(8)))
                                .Margin(const EdgeInsets.all(16)),
                          //
                          const SizedBox(width: 600, height: 80),
                        ],
                      ).Centered().Scrollable().Sizedbox(
                            width: MediaQuery.of(context).size.width,
                            height: MediaQuery.of(context).size.height - 120,
                          ),
                    ),

                  //
                  if (snap.data.isNotEmpty)
                    //
                    Positioned(
                      bottom: 0,
                      left: 0,
                      width: MediaQuery.of(context).size.width,
                      height: 72,
                      child: RoundedTextField(
                        text: 'Busca',
                        controller: _queryctrl,
                        onchanged: (_) => setState(() {}),
                      )
                          .Padding(const EdgeInsets.all(16))
                          .Sizedbox(width: 300, height: 72)
                          .Centered()
                          .Colored(Colors.white.withAlpha(120))
                          .Blur()
                          .Rounded(const BorderRadius.only(
                            topLeft: Radius.elliptical(64, 12),
                            topRight: Radius.elliptical(64, 12),
                          )),
                    ),

                  //
                  if (snap.data.isEmpty)
                    Positioned.fill(
                      child: const Text(
                        'Nenhum log nessa categoria ainda',
                        style: TextStyle(
                          color: Colors.grey,
                          fontSize: 16,
                          fontFamily: 'Open Sans Light',
                        ),
                      ).Centered().Sizedbox(
                            width: MediaQuery.of(context).size.width,
                            height: MediaQuery.of(context).size.height - 120,
                          ),
                    ),
                ],
              )
            : const CircularLoader(),
      );
}
