import 'package:get/get.dart';
import 'package:radiologiev2/app/modules/Acceuil/views/center_provider.dart';
import 'package:radiologiev2/models/CenterModel.dart';
class AcceuilController extends GetxController {
  List<Centerv> CentervList = [];
  bool isLoading = true;
  @override
  void onInit() {
    CenterProvider().getCentersList(
      onSuccess: (Centerv) {
        CentervList.addAll(Centerv);
        isLoading = false;
        update();
      },
      onError: (error) {
        isLoading = false;
        update();
        print("Error");
      }, beforeSend: () {  },
    );
    super.onInit();
  }
}





