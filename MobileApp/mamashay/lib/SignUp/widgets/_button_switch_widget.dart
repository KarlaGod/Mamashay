import 'package:flutter/material.dart';

class ButtonSwitch extends StatefulWidget {
  final bool value;
  final ValueChanged<bool>? onChanged;

  const ButtonSwitch({Key? key, required this.value, this.onChanged})
      : super(key: key);

  @override
  _ButtonSwitchState createState() => _ButtonSwitchState();
}

class _ButtonSwitchState extends State<ButtonSwitch> {
  bool _switchValue = false;
  Color _switchColor = Colors.grey;

  bool _value = false;

  @override
  void initState() {
    super.initState();
    _value = widget.value;
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          _value = !_value;
          widget.onChanged?.call(_value);
        });
      },
      child: Container(
        width: 30.0,
        height: 15.0,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20.0),
          color: _value ? Color.fromRGBO(107, 123, 66, 1) : Colors.grey,
        ),
        child: Stack(
          children: [
            AnimatedPositioned(
              duration: Duration(milliseconds: 300),
              curve: Curves.ease,
              left: _value ? 15.0 : 0.0,
              child: Container(
                width: 15.0,
                height: 15.0,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black12,
                      blurRadius: 5.0,
                      spreadRadius: 1.0,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
