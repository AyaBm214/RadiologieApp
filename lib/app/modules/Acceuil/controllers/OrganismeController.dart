import 'package:get/get.dart';
import 'package:radiologiev2/models/OrganismeModel.dart';
import 'package:radiologiev2/models/Services/ServiceOrganisme.dart';


class OrganismeController extends GetxController {
 final ServiceOrganisme so= ServiceOrganisme();
  List<Organisme> listOrganisme = [];
  @override
  void onInit() {
    fetchOrganisme();
  }
 final selected = "organisme".obs;

 void setSelected(String value){
  selected.value = value;
 }

   fetchOrganisme() async {
    print("***************Fetching Organisme********************");
    var Organismes = await so.fetchOrganisme();
    if (Organismes != null) {
      listOrganisme= Organismes;
    }
  }
}