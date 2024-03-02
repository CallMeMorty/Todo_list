import 'package:flutter/material.dart';

class CustomCard extends StatelessWidget {
  const CustomCard({
    super.key,
    required this.title,
    required this.description,
    required this.isChecked,
    required this.onDeleteTap,
    required this.onEditTap,
    required this.onCheckTap,
  });

  final String title;
  final String description;
  final bool isChecked;
  final void Function() onDeleteTap;
  final void Function() onEditTap;
  final void Function(bool? value) onCheckTap;

  @override
  Widget build(BuildContext context) => Padding(
    padding: const EdgeInsets.all(16),
    child: DecoratedBox(
          decoration: _boxDecoration(),
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _content(),
                _actions(),
              ],
            ),
          ),
        ),
  );

  BoxDecoration _boxDecoration() => BoxDecoration(
        color: Colors.lightBlueAccent,
        border: Border.all(
          color: isChecked ? Colors.blue.shade800 : Colors.transparent,
          width: 3,
        ),
        borderRadius: const BorderRadius.all(
          Radius.circular(12),
        ),
      );

  Widget _actions() => Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          _checkButton(),
          _editButton(),
          _deleteButton(),
        ],
      );

  Widget _editButton() => Padding(
        padding: const EdgeInsets.all(8.0),
        child: IconButton(
          onPressed: onEditTap,
          icon: const Icon(
            Icons.edit,
            color: Colors.orange,
          ),
        ),
      );

  Widget _deleteButton() => Padding(
        padding: const EdgeInsets.all(8.0),
        child: IconButton(
          onPressed: onDeleteTap,
          icon: const Icon(
            Icons.delete,
            color: Colors.red,
          ),
        ),
      );

  Widget _checkButton() => Padding(
        padding: const EdgeInsets.all(8.0),
        child: Checkbox(
          value: isChecked,
          onChanged: onCheckTap,
          activeColor: Colors.green,
        ),
      );

  Widget _content() => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _title(),
          _description(),
        ],
      );

  Padding _description() => Padding(
      padding: const EdgeInsets.all(16),
      child: Text(
        description,
        style: _textStyle(),
      ),
    );

  Widget _title() => Padding(
        padding: const EdgeInsets.all(16),
        child: Text(
          title,
          style: _textStyle(),
        ),
      );

  TextStyle _textStyle() => TextStyle(
        decoration:
            isChecked ? TextDecoration.lineThrough : TextDecoration.none,
    fontSize: 20,
      );
}
