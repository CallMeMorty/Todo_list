import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:todo/shared/models/todo_item_model.dart';

class ModifyPageController extends GetxController {
  ModifyPageController(this.model);

  final TodoItemModel? model;

  final TextEditingController titleTextController = TextEditingController();
  final TextEditingController descriptionTextController =
      TextEditingController();
  RxBool isChecked = RxBool(false);

  GlobalKey<FormState> formKey = GlobalKey();

  @override
  void onInit() {
    initializedData();
    super.onInit();
  }

  void initializedData() {
    if (model != null) {
      titleTextController.text = model!.title;
      descriptionTextController.text = model!.description;
      isChecked.value = model!.isChecked;
    }
  }

  void onSubmit() {
    if (!(formKey.currentState?.validate() ?? false)) {
      return;
    }

    TodoItemModel localeModel = TodoItemModel(
      title: titleTextController.text,
      description: descriptionTextController.text,
      isChecked: isChecked.value,
    );

    Get.back(result: localeModel.toMap());
  }
}
