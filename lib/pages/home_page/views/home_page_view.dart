import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo/pages/home_page/controllers/home_page_controller.dart';
import 'package:todo/pages/home_page/views/widgets/custom_card.dart';

class HomePageView extends GetView<HomePageController> {
  const HomePageView({super.key});

  static const String pageRoute = '/';

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: const Center(
            child: Text(
              'home page',
              style: TextStyle(color: Colors.white),
            ),
          ),
          backgroundColor: Colors.blue.shade800,
        ),
        body: Center(
          child: Obx(() => SizedBox(
                width: 500,
                child: controller.items.isEmpty ? _emptyWidget() : _todoList(),
              )),
        ),
        floatingActionButton: _addButton(),
      );

  Widget _addButton() => FloatingActionButton(
        onPressed: controller.addNewItem,
        child: const Icon(Icons.add),
      );

  Widget _emptyWidget() => const Center(
        child: Text('items not found'),
      );

  Widget _todoList() => ListView.builder(
        itemCount: controller.items.length,
        itemBuilder: (context, index) => CustomCard(
          title: controller.items[index].title,
          description: controller.items[index].description,
          isChecked: controller.items[index].isChecked,
          onDeleteTap: () => controller.deleteItem(index),
          onEditTap: () => controller.editItem(index),
          onCheckTap: (newValue) => controller.onChecked(index, newValue),
        ),
      );
}
