part of transact_view;

class _TransactTablet extends StatelessWidget {
  final TransactViewModel viewModel;

  _TransactTablet (this.viewModel);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text('TransactTablet'),
      ),
    );
  }
}
