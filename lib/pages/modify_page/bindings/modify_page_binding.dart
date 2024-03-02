import 'package:get/get.dart';
import 'package:todo/pages/modify_page/controllers/modify_page_controller.dart';
import 'package:todo/shared/models/todo_item_model.dart';

class ModifyPageBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(
      () => ModifyPageController(
        Get.parameters.isNotEmpty
            ? TodoItemModel.fromMap(Get.parameters)
            : null,
      ),
    );
  }
}
