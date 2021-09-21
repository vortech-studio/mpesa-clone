part of transact_view;

class _TransactMobile extends StatelessWidget {
  final TransactViewModel viewModel;

  _TransactMobile (this.viewModel);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text('TransactMobile'),
      ),
    );
  }
}
