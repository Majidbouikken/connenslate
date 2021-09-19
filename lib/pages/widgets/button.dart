import 'package:flutter/material.dart';

class Button extends StatefulWidget {
  final String title;
  final double width;
  final IconData icon;
  final Color iconColor;
  final int style;
  final Function onPressed;

  const Button(
      {Key key,
      @required this.title,
      this.width,
      this.icon,
      this.iconColor,
      this.style = 0,
      this.onPressed})
      : super(key: key);

  @override
  _ButtonState createState() => _ButtonState();
}

class _ButtonState extends State<Button> {
  bool isTapped = false;

  Widget _buildBackLayout() {
    return Padding(
      padding: EdgeInsets.only(top: 8.0),
      child: DecoratedBox(
        position: DecorationPosition.background,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            color: (this.widget.style == 1)
                ? Theme.of(context).dividerColor
                : Theme.of(context).accentColor),
        child: ConstrainedBox(
          constraints: BoxConstraints.expand(width: widget.width, height: 56),
        ),
      ),
    );
  }

  Widget _buildTopLayout() {
    return Padding(
      padding: EdgeInsets.only(top: isTapped ? 8.0 : 0.0,),
      child: DecoratedBox(
        position: DecorationPosition.background,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(16),),
            border: Border.all(
              width: 3,
              color: (this.widget.style == 1)
                  ? Theme.of(context).dividerColor
                  : Theme.of(context).primaryColor,
              style: BorderStyle.solid,
            ),
            color: (this.widget.style == 1)
                ? Theme.of(context).scaffoldBackgroundColor
                : Theme.of(context).primaryColor),
        child: ConstrainedBox(
          constraints: BoxConstraints.expand(width: widget.width, height: 56),
          child: Container(
            padding: EdgeInsets.zero,
            alignment: Alignment.center,
            child: Text(
              this.widget.title,
              style: Theme.of(context).textTheme.button.copyWith(
                  color: this.widget.style == 1
                      ? Theme.of(context).selectedRowColor
                      : Theme.of(context).scaffoldBackgroundColor),
              textAlign: TextAlign.center,
              overflow: TextOverflow.ellipsis,
              maxLines: 1,
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Stack(
        alignment: AlignmentDirectional.topCenter,
        children: <Widget>[_buildBackLayout(), _buildTopLayout()],
      ),
      onTapDown: (TapDownDetails event) {
        if (widget.onPressed != null) setState(() {
          isTapped = true;
        });
      },
      onTapCancel: () {
        if (widget.onPressed != null) setState(() {
          isTapped = false;
        });
      },
      onTapUp: (TapUpDetails event) {
        if (widget.onPressed != null) {
          setState(() {
            isTapped = false;
          });
          widget.onPressed();
        }
      },
    );
  }
}

// a static class with a hash map containing different styles of the Button widget
class ButtonStyles {
  static const int PRIMARY = 0;
  static const int SECONDARY = 1;
}
