import 'package:logger/logger.dart';
import 'package:stacked/stacked.dart';
import 'package:mpesa_clone/core/logger.dart';

class TransactViewModel extends BaseViewModel {
  late Logger log;

  TransactViewModel() {
    this.log = getLogger(this.runtimeType.toString());
  }
}
