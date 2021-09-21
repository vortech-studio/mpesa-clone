import 'package:logger/logger.dart';
import 'package:mpesa_clone/core/locator.dart';
import 'package:mpesa_clone/core/router_constants.dart';
import 'package:stacked/stacked.dart';
import 'package:mpesa_clone/core/logger.dart';
import 'package:stacked_services/stacked_services.dart';

class SplashViewModel extends BaseViewModel {
  late Logger log;

  SplashViewModel() {
    this.log = getLogger(this.runtimeType.toString());
  }

  void init() {
    Future.delayed(const Duration(seconds: 3),
        () => locator<NavigationService>().clearStackAndShow(loginViewRoute));
  }
}
