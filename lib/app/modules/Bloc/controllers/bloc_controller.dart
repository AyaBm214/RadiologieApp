import 'package:get/get.dart';
import 'package:radiologiev2/app/data/Services/ServiceCompteRenduBloc.dart';
import 'package:radiologiev2/app/data/models/CompteRenduBlocModel.dart';
import 'package:radiologiev2/app/data/models/authentification.dart';

class BlocController extends GetxController {
  final ServiceCompteRenduBloc serviceCompteRenduBloc =
      ServiceCompteRenduBloc();
  RxList<CompteRenduBloc> listCompteBloc =
      List<CompteRenduBloc>.empty(growable: true).obs;
  RxList<CompteRenduBloc> Patienttrouve = <CompteRenduBloc>[].obs;
  RxBool isLoaded = false.obs;
  RxBool isSearching = false.obs;
  RxString searchInput = "".obs;
  Authentification configuration = Authentification();

  @override
  void onInit() {
    super.onInit();
    fetchCompteRenduBloc();
    isLoaded.value = false;
  }

  fetchCompteRenduBloc() async {
    print("mmmmmmm");
    var comptes = await ServiceCompteRenduBloc.fetchCompteRenduBloc();
    if (comptes != null) {
      listCompteBloc.value = comptes;
      Patienttrouve.value = listCompteBloc;
      // ignore: empty_statements
    }
    return listCompteBloc;
  }

  void changeStatus(bool change) {
    isSearching.value = change;
  }

  searchPatient(String input) {
    List<CompteRenduBloc> results = listCompteBloc
        .where((element) => element.patient
            .toString()
            .toLowerCase()
            .contains(input.toLowerCase()))
        .toList();
    Patienttrouve.value = results.obs;
  }
}
