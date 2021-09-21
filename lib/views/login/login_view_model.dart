import 'package:logger/logger.dart';
import 'package:mpesa_clone/core/locator.dart';
import 'package:mpesa_clone/core/router_constants.dart';
import 'package:stacked/stacked.dart';
import 'package:mpesa_clone/core/logger.dart';
import 'package:stacked_services/stacked_services.dart';

class LoginViewModel extends BaseViewModel {
  late Logger log;

  LoginViewModel() {
    this.log = getLogger(this.runtimeType.toString());
  }

  Future<bool> validatePin(String pin) {
    return runBusyFuture(Future.delayed(const Duration(seconds: 2), () {
      if (pin == "1234") {
        return true;
      } else {
        return false;
      }
    }));
  }

  void openMenuPage() {
    locator<NavigationService>().clearStackAndShow(menuViewRoute);
  }
}
