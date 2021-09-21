part of menu_view;

class _MenuDesktop extends StatelessWidget {
  final MenuViewModel viewModel;
  
  _MenuDesktop (this.viewModel);
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text('MenuDesktop'),
      ),
    );
  }
}
