




import 'package:get/get.dart';
import 'package:travel_claim/servieces/app_exception.dart';
import 'package:travel_claim/views/components/common.dart';
import 'package:travel_claim/views/errorscreen.dart';



class BaseController {
  void  handleError(error) {
    if (error is BadRequestException) {
      var message = error.message;
      dprint(message);
      Get.off(() =>  ErrorScreen());

    } else if (error is FetchDataException) {
      var message = error.message;
      //Fluttertoast.showToast(msg: message.toString());
      //showToast(message.toString());
      dprint(message);
    } else if (error is ApiNotRespondingException) {
      var message = error.message;
      //Fluttertoast.showToast(msg: message.toString());
      //showToast(message.toString());
      dprint(message);
      Get.off(() =>  Error());
    }
  }
}