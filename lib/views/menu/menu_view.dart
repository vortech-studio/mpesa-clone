library menu_view;

import 'package:animations/animations.dart';
import 'package:flutter/material.dart';
import 'package:mpesa_clone/theme/theme.dart';
import 'package:mpesa_clone/views/home/home_view.dart';
import 'package:mpesa_clone/views/transact/transact_view.dart';
import 'package:stacked/stacked.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'menu_view_model.dart';

part 'menu_mobile.dart';
part 'menu_tablet.dart';
part 'menu_desktop.dart';

class MenuView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<MenuViewModel>.reactive(
        viewModelBuilder: () => MenuViewModel(),
        onModelReady: (viewModel) {
          // Do something once your viewModel is initialized
        },
        builder: (BuildContext context, MenuViewModel viewModel, _) {
          return ScreenTypeLayout(
            mobile: _MenuMobile(viewModel),
            desktop: _MenuDesktop(viewModel),
            tablet: _MenuTablet(viewModel),
          );
        });
  }
}
