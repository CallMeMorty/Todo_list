import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo/pages/modify_page/views/modify_page_view.dart';
import 'package:todo/shared/models/todo_item_model.dart';

class HomePageController extends GetxController {
  RxList<TodoItemModel> items = <TodoItemModel>[].obs;

  Future<void> addNewItem() async {
    final result = await Get.toNamed(ModifyPageView.pageRoute);

    if (result != null) {
      items.add(TodoItemModel.fromMap(result));
      _showAddSnackBar();
    }
  }

  Future<void> editItem(int index) async {
    final result = await Get.toNamed(
      ModifyPageView.pageRoute,
      parameters: items[index].toMap(),
    );

    if (result != null) {
      items[index] = TodoItemModel.fromMap(result);
      _showEditSnackBar();
    }
  }

  void onChecked(int index, bool? newValue) {
    items[index] = items[index].copyWith(isChecked: newValue);
  }

  void deleteItem(int index) {
    items.removeAt(index);
    _showDeleteSnackBar();
  }

  void _showAddSnackBar() {
    Get.showSnackbar(
      const GetSnackBar(
        backgroundColor: Colors.green,
        message: 'item added to list',
        duration: Duration(
          milliseconds: 700,
        ),
      ),
    );
  }

  void _showEditSnackBar() {
    Get.showSnackbar(
      const GetSnackBar(
        backgroundColor: Colors.orange,
        message: 'item edited on list',
        duration: Duration(
          milliseconds: 700,
        ),
      ),
    );
  }

  void _showDeleteSnackBar() {
    Get.showSnackbar(
      const GetSnackBar(
        backgroundColor: Colors.red,
        message: 'item deleted from list',
        duration: Duration(
          milliseconds: 700,
        ),
      ),
    );
  }
}
