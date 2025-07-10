import 'package:sworks_mobile/features/widgets/custom_check_box.dart';
import 'package:flutter/material.dart';

class TodoCardItem extends StatefulWidget {
  final String title;
  final Function(bool?) onChanged;
  final bool isChecked;
  const TodoCardItem({
    super.key,
    required this.title,
    required this.onChanged,
    required this.isChecked,
  });

  @override
  State<TodoCardItem> createState() => _TodoCardItemState();
}

class _TodoCardItemState extends State<TodoCardItem> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 12),
      child: Card(
        child: ListTile(
          leading: CustomCheckbox(
            value: widget.isChecked,
            onChanged: widget.onChanged,
          ),
          title: Text(
            widget.title,
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.normal,
              color: Colors.black,
            ),
          ),
        ),
      ),
    );
  }
}
