part of transact_view;

class _TransactDesktop extends StatelessWidget {
  final TransactViewModel viewModel;
  
  _TransactDesktop (this.viewModel);
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text('TransactDesktop'),
      ),
    );
  }
}
