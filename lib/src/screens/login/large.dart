///
/// sergio lisan <sels@venosyd.com>
///
/// venosyd ©2016-2020
///
part of aio.logs.screens.login;

///
class _LargeScreen extends StatefulWidget {
  ///
  const _LargeScreen();

  @override
  __LargeScreenState createState() => __LargeScreenState();
}

///
class __LargeScreenState extends State<_LargeScreen> with _Logics {
  ///
  final TextEditingController _loginctrl = TextEditingController();

  ///
  final TextEditingController _passwdctrl = TextEditingController();

  ///
  bool _loading = false;
  bool get loading => _loading;
  set loading(bool value) => setState(() => _loading = value);

  @override
  Widget build(BuildContext context) => Row(
        children: [
          //
          //
          Image.asset('assets/png/logo_white.png', height: 64)
              .Height(64)
              .Centered()
              .Colored(const Color(0xFF212121))
              .Expanded(),
          //
          //
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              //
              RoundedTextField(
                text: 'login',
                controller: _loginctrl,
                inputType: TextInputType.emailAddress,
              ).Sizedbox(width: 256, height: 42),
              //
              RoundedTextField(
                text: 'passwd',
                controller: _passwdctrl,
                obscure: true,
              ).Sizedbox(width: 256, height: 42),
              //
              FlatButton(
                onPressed: () {
                  loading = !loading;
                  login(context, _loginctrl.text, _passwdctrl.text)
                      .then((_) => loading = !loading);
                },
                color: const Color(0xFF616161),
                shape: const StadiumBorder(),
                child: Text(
                  loading ? 'entrando...' : 'entrar',
                  style: const TextStyle(color: Colors.white),
                ),
              ).Sizedbox(width: 196, height: 48),
            ],
          ).Sizedbox(width: 500, height: 200).Centered(),
        ],
      ).Colored(Colors.white);
}
