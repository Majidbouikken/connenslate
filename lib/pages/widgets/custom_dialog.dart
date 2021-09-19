import 'dart:async';
import 'dart:ui' show ImageFilter;
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart' hide Flow;
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'button.dart';
import 'demand.dart';

// mat7awasch tefham chah 3ilm kbir

Widget _buildCustomDialogTransitions(
    BuildContext context,
    Animation<double> animation,
    Animation<double> secondaryAnimation,
    Widget child) {
  return FadeTransition(
    opacity: CurvedAnimation(
      parent: animation,
      curve: Curves.easeOut,
    ),
    child: child,
  );
}

Future<T> showCustomDialog<T>({
  @required
  BuildContext context,
  bool barrierDismissible = true,
  @Deprecated(
      'Instead of using the "child" argument, return the child from a closure '
          'provided to the "builder" argument. This will ensure that the BuildContext '
          'is appropriate for widgets built in the dialog. '
          'This feature was deprecated after v0.2.3.')
  Widget child,
  WidgetBuilder builder,
  bool useRootNavigator = true,
  RouteSettings routeSettings,
}) {
  assert(child == null || builder == null);
  assert(useRootNavigator != null);
  assert(debugCheckHasMaterialLocalizations(context));

  final ThemeData theme = Theme.of(context);
  return showGeneralDialog(
    context: context,
    pageBuilder: (BuildContext buildContext, Animation<double> animation,
        Animation<double> secondaryAnimation) {
      final Widget pageChild = child ?? Builder(builder: builder);
      return BackdropFilter(
        filter: new ImageFilter.blur(sigmaX: 16, sigmaY: 16),
        child: SafeArea(
          child: Builder(builder: (BuildContext context) {
            return theme != null
                ? Theme(data: theme, child: pageChild)
                : pageChild;
          }),
        ),
      );
    },
    barrierDismissible: barrierDismissible,
    barrierLabel: MaterialLocalizations.of(context).modalBarrierDismissLabel,
    barrierColor: Theme.of(context).dialogBackgroundColor,
    transitionDuration: const Duration(milliseconds: 0),
    transitionBuilder: _buildCustomDialogTransitions,
    useRootNavigator: useRootNavigator,
    routeSettings: routeSettings,
  );
}

class CustomDialog extends StatefulWidget {
  const CustomDialog({
    Key key,
    this.child,
    this.buttonTitle = '',
    this.onPressed,
    this.noButton = false,
    this.demand,
  }) : super(key: key);

  final Widget child;
  final String buttonTitle;
  final VoidCallback onPressed;
  final bool noButton;
  final Demand demand;

  @override
  _CustomDialogState createState() => _CustomDialogState();
}

class _CustomDialogState extends State<CustomDialog> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Material(
        color: Colors.transparent,
        elevation: 0,
        type: MaterialType.card,
        clipBehavior: Clip.hardEdge,
        child: SizedBox(
          width: MediaQuery.of(context).size.width,
          child: CustomPopupSurface(
            child: widget.child,
            demand: this.widget.demand,
            buttonTitle: widget.buttonTitle,
            onPressed: widget.onPressed,
            noButton: widget.noButton,
          ),
        ),
      ),
    );
  }
}

class CustomPopupSurface extends StatefulWidget {
  const CustomPopupSurface({
    Key key,
    this.isSurfacePainted = true,
    this.child,
    this.buttonTitle = "",
    this.onPressed,
    this.noButton,
    this.demand,
  }) : super(key: key);

  final bool isSurfacePainted;
  final Widget child;
  final String buttonTitle;
  final VoidCallback onPressed;
  final bool noButton;
  final Demand demand;

  @override
  _CustomPopupSurfaceState createState() => _CustomPopupSurfaceState();
}

class _CustomPopupSurfaceState extends State<CustomPopupSurface> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Container(
          width: MediaQuery.of(context).size.width - 48,
          child: Stack(
            children: [
              Container(
                padding: EdgeInsets.all(16),
                margin: EdgeInsets.only(top: 32, left: 8, right: 8),
                width: MediaQuery.of(context).size.width - 64,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
                  border: Border.all(
                      color: this.widget.demand.status == "valid"
                          ? Theme.of(context).primaryColor
                          : Theme.of(context).primaryColor,
                      width: 2),
                  color: Theme.of(context).backgroundColor,
                ),
                child: Container(
                  child: widget.child,
                ),
              ),
              Align(
                alignment: Alignment.topLeft,
                child: GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Container(
                    width: 24,
                    height: 24,
                    margin: EdgeInsets.only(top: 24),
                    decoration: BoxDecoration(
                      color: Theme.of(context).primaryColor,
                      shape: BoxShape.circle,
                    ),
                    child: Icon(
                      FontAwesomeIcons.times,
                      size: 12,
                      color: Theme.of(context).backgroundColor,
                    ),
                  ),
                ),
              ),
              this.widget.demand.status == "none"
                  ? SizedBox()
                  : Align(
                alignment: Alignment.topRight,
                child: Container(
                  width: 24,
                  height: 24,
                  margin: EdgeInsets.only(top: 24),
                  decoration: BoxDecoration(
                    color: this.widget.demand.status == "valid"
                        ? Theme.of(context).primaryColor
                        : Theme.of(context).primaryColor,
                    shape: BoxShape.circle,
                  ),
                  child: Icon(
                    this.widget.demand.status == "valid"
                        ? FontAwesomeIcons.check
                        : FontAwesomeIcons.solidHourglass,
                    size: 12,
                    color: this.widget.demand.status == "valid"
                        ? Colors.white
                        : Theme.of(context).backgroundColor,
                  ),
                ),
              ),
              Align(
                alignment: Alignment.topCenter,
                child: Container(
                    width: 72,
                    height: 72,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(36),
                        border: Border.all(
                            color: this.widget.demand.status == "valid"
                                ? Theme.of(context).primaryColor
                                : Theme.of(context).primaryColor, width: 2)),
                    child: ClipRRect(
                        borderRadius: BorderRadius.circular(34),
                        child: Image.asset(
                          'assets/pdp.png',
                          width: 68,
                          height: 68,
                          fit: BoxFit.cover,
                        ))),
              ),
            ],
          ),
        ),
        SizedBox(
          height: 8,
        ),
        widget.noButton
            ? SizedBox(
          height: 0,
        )
            : Button(
          title: widget.buttonTitle,
          width: MediaQuery.of(context).size.width - 96,
          onPressed: widget.onPressed,
        ),
        SizedBox(
          height: 16,
        ),
      ],
    );
  }
}

