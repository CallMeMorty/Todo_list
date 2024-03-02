import 'package:get/get.dart';
import 'package:todo/pages/home_page/controllers/home_page_controller.dart';

class HomePageBinding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut(() => HomePageController());
  }
}