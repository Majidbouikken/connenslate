import 'package:flutter/material.dart';
import 'package:htn2021_project/domain/theme.dart';

class EditText extends StatefulWidget {
  final TextEditingController controller;
  final String savedText;
  final String labelText;
  final String hintText;
  final String error;
  final int maxLines;
  final IconData icon;
  final ValueChanged<String> onChanged;
  final ValueChanged<String> onSaved;
  final ValueChanged<String> onSubmitted;
  final ValueChanged<String> validator;
  final TextInputType textInputType;
  final Widget suffixIcon;
  final bool enabled;
  final bool obscureText;
  final bool autoFocus;
  final double internalWeight;
  final double externalWeight;
  final EdgeInsets margin;

  const EditText(
      {Key key,
      this.controller,
      this.savedText,
      this.labelText,
      this.hintText,
      this.error,
      this.maxLines = 1,
      this.icon,
      this.onChanged,
      this.onSaved,
      this.onSubmitted,
      this.validator,
      this.textInputType,
      this.suffixIcon,
      this.enabled = true,
      this.obscureText = false,
      this.autoFocus = false,
      this.internalWeight,
      this.externalWeight,
      this.margin})
      : super(key: key);

  @override
  _EditTextState createState() => _EditTextState();
}

class _EditTextState extends State<EditText> {
  bool _border;
  FocusNode _focus = new FocusNode();

  @override
  void initState() {
    super.initState();
    _border = false;
    _focus = FocusNode();
    _focus.addListener(_onFocusChange);
    // todo: add a text initial value
  }

  /// Notify the text field whenever focus is true,
  /// to change the border color
  void _onFocusChange() {
    if (_focus.hasFocus == true)
      // todo: change the setstate
      setState(() {
        _border = true;
      });
    else
      setState(() {
        _border = false;
      });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (this.widget.labelText != null) ...[
          Container(
            child: Text(
              this.widget.labelText,
              style:
                  Theme.of(context).textTheme.headline6.copyWith(fontSize: 20),
            ),
          ),
          SizedBox(
            height: 8.0,
          )
        ],
        Container(
          height: 48,
          decoration: BoxDecoration(
            color: Theme.of(context).backgroundColor,
            borderRadius: BorderRadius.circular(16),
            border: Border.all(width: 3, color: Theme.of(context).dividerColor),
          ),
          child: Center(
            child: TextFormField(
              focusNode: _focus,
              enabled: this.widget.enabled,
              autofocus: this.widget.autoFocus,
              controller: this.widget.controller,
              maxLines: this.widget.maxLines,
              initialValue: this.widget.savedText,
              textAlignVertical: TextAlignVertical.center,
              onSaved: this.widget.onSaved,
              onChanged: this.widget.onChanged,
              onFieldSubmitted: this.widget.onSubmitted,
              validator: this.widget.validator,
              keyboardType: this.widget.textInputType,
              style: (!this.widget.enabled)
                  ? Theme.of(context).textTheme.headline6.copyWith(
                      color: Theme.of(context).cardColor.withOpacity(1.0))
                  : Theme.of(context).textTheme.headline6.copyWith(color: Theme.of(context).selectedRowColor),
              cursorColor: blueColor,
              obscureText: this.widget.obscureText,
              decoration: (this.widget.icon != null)
                  ? InputDecoration(
                      isDense: true,
                      prefixIcon: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8.0),
                        child: Icon(
                          this.widget.icon,
                          size: 24,
                          color: Theme.of(context).unselectedWidgetColor,
                        ),
                      ),
                      suffixIcon: this.widget.suffixIcon,
                      border: InputBorder.none,
                      hintText: this.widget.hintText,
                      hintStyle: Theme.of(context)
                          .textTheme
                          .headline6
                          .copyWith(color: Theme.of(context).hintColor),
                    )
                  : InputDecoration(
                      isDense: true,
                      contentPadding: EdgeInsets.symmetric(horizontal: 16),
                      suffixIcon: this.widget.suffixIcon,
                      border: InputBorder.none,
                      hintText: this.widget.hintText,
                      hintStyle: Theme.of(context)
                          .textTheme
                          .headline6
                          .copyWith(color: Theme.of(context).hintColor),
                    ),
            ),
          ),
        )
      ],
    );
  }
}
