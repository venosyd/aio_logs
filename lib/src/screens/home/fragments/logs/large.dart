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
            ? Column(
                children: [
                  if (snap.data.isNotEmpty)
                    UxDataTable(
                      columns: <UxDataColumn>[
                        UxDataColumn(
                          label: _TableHeader('Timestamp', widget.type),
                        ),
                        UxDataColumn(
                          label: _TableHeader('Escopo', widget.type),
                        ),
                        UxDataColumn(
                          label: _TableHeader('Módulo', widget.type),
                        ),
                        UxDataColumn(
                          label: _TableHeader('Título', widget.type),
                        ),
                        UxDataColumn(
                          label: _TableHeader('Usuário', widget.type),
                        ),
                        UxDataColumn(
                          label: _TableHeader('Detalhes', widget.type),
                        ),
                        const UxDataColumn(label: Text(' ')),
                      ],
                      rows: <UxDataRow>[
                        for (final log in snap.data)
                          UxDataRow(
                            cells: <UxDataCell>[
                              UxDataCell(Text(log.timestampDT)),
                              UxDataCell(Text(log.namespace ?? '')),
                              UxDataCell(Text(log.module ?? '')),
                              UxDataCell(Text(log.title ?? '')),
                              UxDataCell(Text(log.user ?? '')),
                              UxDataCell(Text(_shrink(log.details))),
                              UxDataCell(
                                FlatButton(
                                  onPressed: () => showDialog<LogDialog>(
                                    context: context,
                                    builder: (_) => LogDialog(log),
                                  ),
                                  child: const FaIcon(
                                    FontAwesomeIcons.infoCircle,
                                    color: Colors.grey,
                                    size: 16,
                                  ),
                                ).Clickable(),
                              ),
                            ],
                          ),
                      ],
                    ) //
                        .Scrollable()
                        .Expanded(),

                  //
                  if (snap.data.isNotEmpty)
                    RoundedTextField(
                      text: 'Busca',
                      controller: _queryctrl,
                      onchanged: (_) => setState(() {}),
                    )
                        .Padding(const EdgeInsets.all(16))
                        .Width(400)
                        .Centered()
                        .Height(72),

                  //
                  if (snap.data.isEmpty)
                    const Text(
                      'Nenhum log nessa categoria ainda',
                      style: TextStyle(
                        color: Colors.grey,
                        fontSize: 16,
                        fontFamily: 'Open Sans Light',
                      ),
                    ) //
                        .Centered()
                        .Height(MediaQuery.of(context).size.height - 120),
                ],
              )
            : const CircularLoader(),
      );
}
