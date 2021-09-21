library transact_view;

import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'transact_view_model.dart';

part 'transact_mobile.dart';
part 'transact_tablet.dart';
part 'transact_desktop.dart';

class TransactView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<TransactViewModel>.reactive(
        viewModelBuilder: () => TransactViewModel(),
        onModelReady: (viewModel) {
          // Do something once your viewModel is initialized
        },
        builder: (BuildContext context, TransactViewModel viewModel, _) {
          return ScreenTypeLayout(
            mobile: _TransactMobile(viewModel),
            desktop: _TransactDesktop(viewModel),
            tablet: _TransactTablet(viewModel),
          );
        });
  }
}
