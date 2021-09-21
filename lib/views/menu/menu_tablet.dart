part of menu_view;

class _MenuTablet extends StatelessWidget {
  final MenuViewModel viewModel;

  _MenuTablet (this.viewModel);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text('MenuTablet'),
      ),
    );
  }
}
