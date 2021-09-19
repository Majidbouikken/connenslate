import 'package:flutter/material.dart';
import 'package:htn2021_project/domain/theme.dart';

class UserTypeButton extends StatefulWidget {
  final bool selected;
  final String leadText;
  final String subText;
  final String assetImage;
  final double width;
  final Function onPressed;

  const UserTypeButton(
      {Key key,
      this.width,
      this.onPressed,
      this.assetImage,
      this.leadText,
      this.subText,
        this.selected = false})
      : super(key: key);

  @override
  _UserTypeButtonState createState() => _UserTypeButtonState();
}

class _UserTypeButtonState extends State<UserTypeButton> {
  bool isTapped = false;

  Widget _buildBackLayout() {
    return Padding(
      padding: EdgeInsets.only(top: 8.0),
      child: DecoratedBox(
        position: DecorationPosition.background,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            color: (widget.selected) ? blueColor : Theme.of(context).dividerColor),
        child: ConstrainedBox(
          constraints: BoxConstraints.expand(width: widget.width, height: 160),
        ),
      ),
    );
  }

  Widget _buildTopLayout() {
    return Padding(
      padding: EdgeInsets.only(
        top: isTapped ? 8.0 : 0.0,
      ),
      child: DecoratedBox(
        position: DecorationPosition.background,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.all(
              Radius.circular(16),
            ),
            border: Border.all(
              width: 3,
              color: (widget.selected) ? blueColor : Theme.of(context).dividerColor,
              style: BorderStyle.solid,
            ),
            color: (widget.selected) ? (Theme.of(context).brightness == Brightness.light)? lightBlueColor : darkBlueColor : Theme.of(context).scaffoldBackgroundColor),
        child: ConstrainedBox(
          constraints: BoxConstraints.expand(
            width: widget.width,
            height: 160,
          ),
          child: Container(
            padding: EdgeInsets.zero,
            alignment: Alignment.center,
            margin: EdgeInsets.all(16.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Image(
                    image: AssetImage(widget.assetImage),
                    height: 88,
                  ),
                ),
                Expanded(
                    child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.leadText,
                      style: Theme.of(context).textTheme.headline5,
                    ),
                    if(widget.subText != null) ...[
                      SizedBox(
                        height: 8.0,
                      ),
                      Text(
                        widget.subText,
                        style: Theme.of(context).textTheme.headline6,
                      ),
                    ]
                  ],
                ))
              ],
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
        setState(() {
          isTapped = true;
        });
      },
      onTapCancel: () {
        setState(() {
          isTapped = false;
        });
      },
      onTapUp: (TapUpDetails event) {
        setState(() {
          isTapped = false;
        });
        widget.onPressed();
      },
    );
  }
}
