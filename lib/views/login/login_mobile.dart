part of login_view;

class _LoginMobile extends StatefulWidget {
  final LoginViewModel viewModel;

  _LoginMobile(this.viewModel);

  @override
  __LoginMobileState createState() => __LoginMobileState();
}

class __LoginMobileState extends State<_LoginMobile> {
  var onTapRecognizer;

  TextEditingController textEditingController = TextEditingController();
  late StreamController<ErrorAnimationType> errorController;

  bool hasError = false;
  bool showError = false;

  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  final formKey = GlobalKey<FormState>();

  @override
  void initState() {
    onTapRecognizer = TapGestureRecognizer()
      ..onTap = () {
        Navigator.pop(context);
      };
    errorController = StreamController<ErrorAnimationType>();
    super.initState();
  }

  @override
  void dispose() {
    errorController.close();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Expanded(
              flex: 5,
              child: Column(
                children: [
                  SizedBox(height: 32.0),
                  CircleAvatar(
                    backgroundColor: blueColor.withOpacity(.1),
                    radius: 36,
                    child: Text(
                      'KK',
                      style: Theme.of(context).textTheme.headline5!.copyWith(
                            color: blueColor,
                            fontWeight: FontWeight.w500,
                          ),
                    ),
                  ),
                  SizedBox(height: 16.0),
                  Text(
                    'KELVIN KIPKORIR',
                    style: Theme.of(context).textTheme.headline6!.copyWith(
                          fontWeight: FontWeight.w400,
                        ),
                  ),
                  Text('254714322405'),
                  SizedBox(height: 64.0),
                  Text(
                    widget.viewModel.isBusy
                        ? 'VALIDATIING PIN...'
                        : showError
                            ? 'WRONG M-PESA PIN, PLEASE TRY AGAIN'
                            : 'ENTER M-PESA PIN:',
                    style: widget.viewModel.isBusy
                        ? Theme.of(context)
                            .textTheme
                            .bodyText2!
                            .copyWith(color: greenColor)
                        : showError
                            ? Theme.of(context)
                                .textTheme
                                .bodyText2!
                                .copyWith(color: Colors.red)
                            : Theme.of(context).textTheme.bodyText2!,
                  ),
                  SizedBox(height: 16.0),
                  AbsorbPointer(
                    absorbing: true,
                    child: PinCodeTextField(
                      appContext: context,
                      mainAxisAlignment: MainAxisAlignment.center,
                      length: 4,
                      obscureText: true,
                      obscuringWidget: CircleAvatar(
                        backgroundColor: hasError ? Colors.red : greenColor,
                        radius: 10.0,
                      ),
                      animationType: AnimationType.scale,
                      pinTheme: PinTheme(
                          shape: PinCodeFieldShape.circle,
                          activeFillColor: Colors.transparent,
                          inactiveFillColor: Colors.transparent,
                          selectedFillColor: Colors.transparent,
                          activeColor: Colors.grey.shade300,
                          inactiveColor: Colors.grey.shade300,
                          selectedColor: Colors.grey.shade300,
                          fieldHeight: 50,
                          fieldWidth: 50,
                          fieldOuterPadding:
                              const EdgeInsets.symmetric(horizontal: 6.0)),
                      animationDuration: Duration(milliseconds: 300),
                      textStyle: TextStyle(fontSize: 20, height: 1.6),
                      enableActiveFill: true,
                      errorAnimationController: errorController,
                      controller: textEditingController,
                      showCursor: false,
                      onCompleted: (v) {
                        widget.viewModel
                            .validatePin(textEditingController.text)
                            .then((value) {
                          print(value);
                          if (value == true) {
                            widget.viewModel.openMenuPage();
                          } else {
                            errorController.add(ErrorAnimationType.shake);
                            setState(() {
                              showError = true;
                              hasError = true;
                              Future.delayed(const Duration(seconds: 1),
                                  () => textEditingController.text = "");
                            });
                          }
                        });
                      },
                      onChanged: (value) {
                        setState(() {
                          if (hasError) hasError = false;
                          textEditingController.text = value;
                          if (textEditingController.text.length > 0)
                            showError = false;
                        });
                      },
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              flex: 4,
              child: NumericKeyboard(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                textColor: Colors.grey.shade600,
                rightIcon: Icon(
                  Icons.backspace_outlined,
                  color: Colors.grey,
                  size: 32.0,
                ),
                rightButtonFn: () {
                  setState(() {
                    if (textEditingController.text != "") {
                      textEditingController.text = textEditingController.text
                          .substring(0, textEditingController.text.length - 1);
                    }
                  });
                },
                onKeyboardTap: (value) {
                  setState(() {
                    textEditingController.text += value;
                  });
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
