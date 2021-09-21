import 'package:logger/logger.dart';
import 'package:stacked/stacked.dart';
import 'package:mpesa_clone/core/logger.dart';

class MenuViewModel extends IndexTrackingViewModel {
  late Logger log;

  MenuViewModel() {
    log = getLogger(this.runtimeType.toString());
  }
}
