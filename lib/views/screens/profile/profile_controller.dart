import 'package:get/get.dart';
import 'package:travel_claim/global/globalValues.dart';
import 'package:travel_claim/servieces/api_controller.dart';
import 'package:travel_claim/views/components/common.dart';

class ProfileController extends GetxController{
  late Future <dynamic> futureform;
  var g = Global();
  RxString lstrEmpId =''.obs;
  RxString lstrEmpName =''.obs;
  RxString lstrEmpDepartment=''.obs;
  RxString lstrEmpBranch =''.obs;
  RxString lstrEmpBaseLoc =''.obs;
  RxString lstrEmpDesignation =''.obs;
  RxString lstrEmpGrade =''.obs;
  RxString lstrEmpReportingperson =''.obs;
  RxString lstrEmpEmail =''.obs;
  RxString lstrEmpMobileNo =''.obs;
  RxBool isLoading=false.obs;





  apiGetProfile(){
    futureform = ApiCall().apiGetProfileDatas();
    futureform.then((value) => apiGetProfileRes(value));
  }

  apiGetProfileRes(value){
    try{
      dprint("Apiiiivaluee......................");
      dprint(value);

      if(g.fnValCheck(value)){
        isLoading.value =true;
        var sts  =  value["success"];
        var msg  =  value["message"]??"";
        if(sts=="success"){
          dprint("4444444444444444444444444444444444444444444");
          var data =  value["data"];
          lstrEmpId.value = data["emp_id"]??"";
          lstrEmpName.value = data["emp_name"]??"";
          lstrEmpDepartment.value = data["emp_department"]??"";
          lstrEmpBranch.value = data["emp_branch"]??"";
          lstrEmpBaseLoc.value = data["emp_baselocation"]??"";
          lstrEmpDesignation.value = data["emp_designation"]??"";
          lstrEmpGrade.value = data["emp_grade"]??"";
          lstrEmpReportingperson.value = data["reporting_person"]??"";
          lstrEmpEmail.value = data["email"]??"";
          lstrEmpMobileNo.value = data["emp_phonenumber"]??"";
          dprint("g.t  ypedataOfTripList ${ data}");
        }

      }
    }catch(e){
      dprint(e);
    }


  }


}