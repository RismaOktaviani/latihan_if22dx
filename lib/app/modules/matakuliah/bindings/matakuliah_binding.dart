import 'package:get/get.dart';


class MatakuliahBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<MatakuliahBinding>(
      () => MatakuliahBinding(),
    );
  }
}
