library splash_view;

import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'splash_view_model.dart';

part 'splash_mobile.dart';
part 'splash_tablet.dart';
part 'splash_desktop.dart';

class SplashView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<SplashViewModel>.reactive(
        viewModelBuilder: () => SplashViewModel(),
        onModelReady: (viewModel) {
          viewModel.init();
        },
        builder: (BuildContext context, SplashViewModel viewModel, _) {
          return ScreenTypeLayout(
            mobile: _SplashMobile(viewModel),
            desktop: _SplashDesktop(viewModel),
            tablet: _SplashTablet(viewModel),
          );
        });
  }
}
