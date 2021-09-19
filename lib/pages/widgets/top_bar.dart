import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class TopBar extends StatelessWidget {
  final Function returnFunction;
  final int currentPage, numPages;

  const TopBar({Key key, this.currentPage = 0, this.numPages = 2, this.returnFunction}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Container(
        height: 56,
        child: Row(
          children: [
            GestureDetector(
              onTap: returnFunction,
              child: Icon(
                FontAwesomeIcons.arrowLeft,
                color: Theme.of(context).unselectedWidgetColor,
                size: 24,
              ),
            ),
            SizedBox(
              width: 16,
            ),
            Stack(
              alignment: Alignment.centerLeft,
              children: [
                Container(
                  height: 16,
                  width: MediaQuery.of(context).size.width - 32.0 - 24 - 16,
                  decoration: BoxDecoration(
                      color: Theme.of(context).backgroundColor,
                      borderRadius: BorderRadius.circular(8.0)),
                ),
                AnimatedContainer(
                  duration: Duration(
                    milliseconds: 200
                  ),
                  curve: Curves.easeInOut,
                  height: 16,
                  width: (MediaQuery.of(context).size.width - 32.0 - 24 - 16) *
                      (currentPage / (numPages-1)),
                  decoration: BoxDecoration(
                      color: Theme.of(context).primaryColor,
                      borderRadius: BorderRadius.circular(8.0)),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
