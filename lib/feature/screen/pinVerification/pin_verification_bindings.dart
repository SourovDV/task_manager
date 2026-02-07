import 'package:get/get.dart';
import 'package:task_manager/feature/screen/pinVerification/pin_verification_controller.dart';

class PinVerificationBindings extends Bindings{
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.put(PinVerificationController());
  }

}