import 'package:flutter/material.dart';
import '../style/concave_decoration.dart';

class NeumorphicButton extends StatefulWidget {
  final bool isChosen;
  final bool isPill;
  final onPressed;
  final String text;
  final Color textColor;
  final double textSize;

  NeumorphicButton({
    Key key,
    @required this.text,
    this.textColor,
    this.textSize,
    this.isPill = false,
    @required this.onPressed,
    this.isChosen = false,
  }) : super(key: key);

  @override
  _NeumorphicButtonState createState() => _NeumorphicButtonState();
}

class _NeumorphicButtonState extends State<NeumorphicButton> {
  bool _isPressed = false;

  void _onPointerDown(PointerDownEvent event) {
    setState(() {
      _isPressed = true;
      widget.onPressed();
    });
  }

  void _onPointerUp(PointerUpEvent event) {
    setState(() {
      _isPressed = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    final innerShadow = ConcaveDecoration(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(50.0),
        ),
        colors: [Color.fromRGBO(179, 179, 179, 1), Colors.white],
        depression: 10);

    final outerShadow = BoxDecoration(
      border: (widget.isPill)
          ? Border.all(color: Theme.of(context).backgroundColor, width: 4)
          : Border.all(color: Colors.transparent),
      borderRadius: BorderRadius.circular(50.0),
      color: (widget.isPill)
          ? Theme.of(context).primaryColor
          : Theme.of(context).backgroundColor,
      boxShadow: [
        BoxShadow(
          blurRadius: 15,
          offset: -Offset(5, 5),
          color: Colors.white,
        ),
        BoxShadow(
          blurRadius: 15,
          offset: Offset(4.5, 4.5),
          color: Color.fromRGBO(216, 213, 208, 1),
        )
      ],
    );

    return Container(
      width: MediaQuery.of(context).size.width / 5,
      height: (widget.isPill)
          ? (MediaQuery.of(context).size.width / 5) * 2
          : MediaQuery.of(context).size.width / 5,
      child: Listener(
          onPointerDown: _onPointerDown,
          onPointerUp: _onPointerUp,
          child: Stack(
            children: <Widget>[
              AnimatedContainer(
                duration: Duration(milliseconds: 5),
                decoration: (_isPressed) ? innerShadow : outerShadow,
              ),
              Align(
                alignment: Alignment(0, 0),
                child: Text(
                  widget.text,
                  style: TextStyle(
                    fontSize: 24.0,
                    color: (widget.isPill) ? Colors.white : Colors.black,
                  ),
                ),
              )
            ],
          )),
    );
  }
}
