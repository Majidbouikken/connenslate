import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:htn2021_project/pages/widgets/widgets.dart';

class Settings extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width - 74,
      decoration: BoxDecoration(
          color: Theme.of(context).scaffoldBackgroundColor,
          border:
          Border(right: BorderSide(color: Theme.of(context).dividerColor, width: 2),)),
      child: SingleChildScrollView(
        child: Container(
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  SizedBox(
                    height: 92,
                  ),
                  SectionTitle(
                    title: "SETTINGS",
                  ),
                  MenuButton(
                    icon: FontAwesomeIcons.globeAfrica,
                    title: "Language",
                    onTap: () {},
                  ),
                  MenuDivider(),
                  MenuButton(
                    icon: (Theme.of(context).brightness == Brightness.dark)
                        ? FontAwesomeIcons.moon
                        : FontAwesomeIcons.sun,
                    title: (Theme.of(context).brightness == Brightness.dark)
                        ? "Light mode"
                        : "Dark mode",
                    onTap: () {
                      //if (_themeChanger.getTheme().brightness == Brightness.light)
                      //  _themeChanger.setTheme(ThemeChanger.darkTheme);
                      //else
                      //  _themeChanger.setTheme(ThemeChanger.lightTheme);
                    },
                  ),
                  MenuDivider(
                    sectionDivider: true,
                  ),
                  SectionTitle(
                    title: "SUPPORT & FEEDBACK",
                  ),
                  MenuButton(
                    icon: FontAwesomeIcons.infoCircle,
                    title: "FAQ",
                    onTap: () {},
                  ),
                  MenuDivider(),
                  MenuButton(
                    icon: FontAwesomeIcons.comment,
                    title: "Send us Feedback",
                    onTap: () {},
                  ),
                  MenuDivider(),
                  MenuButton(
                    icon: FontAwesomeIcons.shieldAlt,
                    title: "Terms & Privacy Policy",
                    onTap: () {},
                  ),
                  MenuDivider(
                    sectionDivider: true,
                  ),
                  SectionTitle(
                    title: "COMMUNITY",
                  ),
                  MenuButton(
                    icon: FontAwesomeIcons.star,
                    title: "Rate Linble in Google Play",
                    onTap: () {},
                  ),
                  MenuDivider(),
                  MenuButton(
                    icon: FontAwesomeIcons.shareSquare,
                    title: "Share with Freinds",
                    onTap: () {},
                  ),
                  MenuDivider(
                    sectionDivider: true,
                  ),
                  SectionTitle(
                    title: "CONNECT WITH US",
                  ),
                  MenuButton(
                    icon: FontAwesomeIcons.facebook,
                    title: "Facebook",
                    onTap: () {},
                  ),
                  MenuDivider(),
                  MenuButton(
                    icon: FontAwesomeIcons.twitter,
                    title: "Twitter",
                    onTap: () {},
                  ),
                  MenuDivider(),
                  MenuButton(
                    icon: FontAwesomeIcons.youtube,
                    title: "Youtube",
                    onTap: () {},
                  ),
                  MenuDivider(),
                  MenuButton(
                    icon: FontAwesomeIcons.instagram,
                    title: "Instagram",
                    onTap: () {},
                  ),
                  MenuDivider(
                    sectionDivider: true,
                  ),
                  SizedBox(height: 64),
                  Image(
                    image: AssetImage('assets/img/greenlogo.png'),
                    height: 24,
                    width: 24,
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  Align(
                    alignment: Alignment.center,
                    child: Text(
                      "Connenslate - Version 0.0.1",
                      style: Theme.of(context).textTheme.subtitle1,
                    ),
                  ),
                  SizedBox(
                    height: 16,
                  ),
                ])),
      ),
    );
  }
}