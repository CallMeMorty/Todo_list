import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo/pages/modify_page/controllers/modify_page_controller.dart';

class ModifyPageView extends GetView<ModifyPageController> {
  const ModifyPageView({super.key});

  static const String pageRoute = '/modify-page';

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: Center(
            child: Text(
              '${controller.model != null ? 'edit' : 'add'} page',
              style: const TextStyle(color: Colors.white),
            ),
          ),
          backgroundColor: Colors.blue.shade800,
        ),
        body: Center(
          child: SizedBox(
            width: 500,
            child: Form(
              key: controller.formKey,
              child: Column(
                children: [
                  Expanded(
                    child: Column(
                      children: [
                        _title(),
                        _description(),
                        _checkbox(),
                      ],
                    ),
                  ),
                  _submitButton(),
                ],
              ),
            ),
          ),
        ),
      );

  Widget _title() => Padding(
        padding: const EdgeInsets.all(16),
        child: TextFormField(
          controller: controller.titleTextController,
          validator: (value) =>
              value != null && value.isNotEmpty ? null : 'title is not empty',
          autovalidateMode: AutovalidateMode.onUserInteraction,
          decoration: const InputDecoration(label: Text('insert title')),
        ),
      );

  Widget _description() => Padding(
        padding: const EdgeInsets.all(16),
        child: TextFormField(
          controller: controller.descriptionTextController,
          validator: (value) => value != null && value.isNotEmpty
              ? null
              : 'description is not empty',
          autovalidateMode: AutovalidateMode.onUserInteraction,
           maxLines: 5,
          decoration: const InputDecoration(label: Text('insert description')),
        ),
      );

  Widget _checkbox() => Padding(
        padding: const EdgeInsets.all(16),
        child: Row(
          children: [
            const Text('is done ???'),
            const SizedBox(
              width: 16,
            ),
            Obx(() => Checkbox(
                  value: controller.isChecked.value,
                  onChanged: (value) => controller.isChecked(value),
                )),
          ],
        ),
      );

  Widget _submitButton() => FilledButton(
        onPressed: controller.onSubmit,
        child: const Center(
          child: Text('submit'),
        ),
      );
}
