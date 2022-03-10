import 'package:get/get.dart';
import 'package:radiologiev2/app/data/Services/ServiceOrganisme.dart';
import 'package:radiologiev2/app/data/models/OrganismeModel.dart';

class OrganismeController extends GetxController {
  final ServiceOrganisme so = ServiceOrganisme();
  List<Organisme> listOrganisme = [];
  @override
  void onInit() {
    fetchOrganisme();
  }

  final selected = "organisme".obs;

  void setSelected(String value) {
    selected.value = value;
  }

  fetchOrganisme() async {
    print("***************Fetching Organisme********************");
    var Organismes = await so.fetchOrganisme();
    if (Organismes != null) {
      listOrganisme = Organismes;
    }
  }
}
