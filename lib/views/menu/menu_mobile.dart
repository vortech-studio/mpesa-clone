part of menu_view;

class _MenuMobile extends StatelessWidget {
  final MenuViewModel viewModel;

  _MenuMobile(this.viewModel);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageTransitionSwitcher(
        duration: const Duration(milliseconds: 300),
        reverse: viewModel.reverse,
        transitionBuilder: (
          Widget child,
          Animation<double> animation,
          Animation<double> secondaryAnimation,
        ) {
          return SharedAxisTransition(
            child: child,
            animation: animation,
            secondaryAnimation: secondaryAnimation,
            transitionType: SharedAxisTransitionType.horizontal,
          );
        },
        child: getViewForIndex(viewModel.currentIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: greenColor,
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.white,
        currentIndex: viewModel.currentIndex,
        onTap: viewModel.setIndex,
        selectedFontSize: 12.0,
        items: [
          BottomNavigationBarItem(
            label: 'HOME',
            icon: Image.asset(
              'assets/images/home.png',
              scale: 3,
            ),
            activeIcon: Image.asset(
              'assets/images/home_selected.png',
              scale: 3,
            ),
          ),
          BottomNavigationBarItem(
            label: 'TRANSACT',
            icon: Image.asset(
              'assets/images/transact.png',
              scale: 3,
            ),
            activeIcon: Image.asset(
              'assets/images/transact_selected.png',
              scale: 3,
            ),
          ),
          BottomNavigationBarItem(
            label: 'DISCOVER',
            icon: Image.asset(
              'assets/images/discover.png',
              scale: 3,
            ),
            activeIcon: Image.asset(
              'assets/images/discover_selected.png',
              scale: 3,
            ),
          ),
          BottomNavigationBarItem(
            label: 'SPEND',
            icon: Image.asset(
              'assets/images/spend.png',
              scale: 3,
            ),
            activeIcon: Image.asset(
              'assets/images/spend_selected.png',
              scale: 3,
            ),
          ),
          BottomNavigationBarItem(
            label: 'GROW',
            icon: Image.asset(
              'assets/images/grow.png',
              scale: 3,
            ),
            activeIcon: Image.asset(
              'assets/images/grow_selected.png',
              scale: 3,
            ),
          ),
        ],
      ),
    );
  }

  Widget getViewForIndex(int index) {
    switch (index) {
      case 0:
        return HomeView();
      case 1:
        return TransactView();
      case 2:
        return HomeView();
      case 3:
        return HomeView();
      case 4:
        return HomeView();
      default:
        return Container();
    }
  }
}
