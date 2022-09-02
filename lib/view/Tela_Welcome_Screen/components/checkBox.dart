import 'package:flutter/material.dart';

class checkBoxWidget extends StatefulWidget {

  final Function(bool) onChanged;

  const checkBoxWidget({required this.onChanged});

  @override
  _checkBoxWidgetState createState() => _checkBoxWidgetState();
}

class _checkBoxWidgetState extends State<checkBoxWidget> {
  bool _checked = false;

  @override
  Widget build(BuildContext context) {
    return Row(
     children: [
      Checkbox(value: _checked,
       onChanged: (value) {
        setState(() {
          _checked = !_checked;
        });
        widget.onChanged(_checked);
      }),
      Text('Não exibir mais'),
     ],
    );
  }
}