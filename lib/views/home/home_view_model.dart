import 'package:logger/logger.dart';
import 'package:stacked/stacked.dart';
import 'package:mpesa_clone/core/logger.dart';

class HomeViewModel extends BaseViewModel {
  late Logger log;

  HomeViewModel() {
    this.log = getLogger(this.runtimeType.toString());
  }
}
