///
/// venosyd ©2016-2020
///
/// sergio lisan <sels@venosyd.com>
///
part of aio.logs.home.fragment.logs;

///
class _MobileFragment extends StatefulWidget {
  ///
  const _MobileFragment(this.namespace, this.type);

  ///
  final Namespace namespace;

  ///
  final int type;

  @override
  __MobileFragmentState createState() => __MobileFragmentState();
}

///
class __MobileFragmentState extends State<_MobileFragment> with _Logics {
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
                    Positioned.fill(
                      child: ListView.builder(
                        padding: const EdgeInsets.only(bottom: 96),
                        itemCount: snap.data.length,
                        itemBuilder: (_, i) => Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            //
                            Text(
                              snap.data[i].timestampDT,
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 14,
                              ),
                            ),
                            //
                            const SizedBox(height: 8),
                            //
                            Text(
                              'Namespace${space(4)}${snap.data[i].namespace ?? ''}',
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 12,
                              ),
                            ),
                            //
                            const SizedBox(height: 8),
                            //
                            Text(
                              'Título${space(16)}${snap.data[i].title ?? ''}',
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 12,
                              ),
                            ),
                            //
                            const SizedBox(height: 8),
                            //
                            Text(
                              'Módulo${space(12)}${snap.data[i].module ?? ''}',
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 12,
                              ),
                            ),
                            //
                            const SizedBox(height: 8),
                            //
                            Text(
                              'Usuário${space(12)}${snap.data[i].user ?? ''}',
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 12,
                              ),
                            ),
                            //
                            const SizedBox(height: 32),
                            //
                            Text(
                              snap.data[i].details ?? '',
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 12,
                              ),
                            ),
                          ],
                        )
                            .Padding(const EdgeInsets.all(24))
                            .Colored(color(widget.type))
                            .Rounded(const BorderRadius.all(Radius.circular(8)))
                            .Margin(const EdgeInsets.all(16)),
                      ).Sizedbox(
                        width: MediaQuery.of(context).size.width,
                        height: MediaQuery.of(context).size.height - 120,
                      ),
                    ),

                  //
                  if (snap.data.isNotEmpty)
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
                          .Blur(),
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
                            )),
                ],
              )
            : const CircularLoader(),
      );
}
