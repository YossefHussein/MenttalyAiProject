import 'package:cached_network_image/cached_network_image.dart';
import 'package:clipboard/clipboard.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:go_router/go_router.dart';
import 'package:mental_health_app/core/routes.dart';
import 'package:mental_health_app/features/presentation/account/page/setting_screen.dart';
import 'package:mental_health_app/presentation/about_developer.dart';
import 'package:mental_health_app/presentation/support_developer.dart';
import 'package:mental_health_app/presentation/tech_used.dart';
import 'package:mental_health_app/translations/locale_keys.dart';

import '../../auth_screens/widgets/widgets.dart';

class DrawerWidget extends StatelessWidget {
  const DrawerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Drawer(
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              topRight: Radius.circular(0), bottomRight: Radius.circular(0)),
        ),
        child: ListView(
          children: [
            DrawerHeader(
              // to delete the padding of drawer header
              padding: EdgeInsets.zero,
              // image of user
              child: Container(
                decoration: BoxDecoration(
                  image: DecorationImage(
                    // for cached the image
                    image: CachedNetworkImageProvider(
                        FirebaseAuth.instance.currentUser?.photoURL ?? ''),
                    fit: BoxFit.cover,
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Align(
                    alignment: Alignment.bottomLeft,
                    child: GestureDetector(
                      // display email
                      child: AutoSizeText(
                        '${FirebaseAuth.instance.currentUser?.email}',
                        style: Theme.of(context).textTheme.labelSmall?.copyWith(
                              color:
                                  FirebaseAuth.instance.currentUser?.photoURL ==
                                          null
                                      ? Colors.black
                                      : Colors.white,
                            ),
                      ),
                      // copy email
                      onTap: () {
                        FlutterClipboard.copy(
                                '${FirebaseAuth.instance.currentUser?.email}')
                            .then(
                          (value) => sendMSG('copied'),
                        );
                      },
                    ),
                  ),
                ),
              ),
            ),
            // go to settings
            ListTile(
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => SettingScreen()));
              },
              title: GestureDetector(
                child: AutoSizeText(
                  LocaleKeys.drawer_widget_settings_app.tr(),
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
              ),
            ),
            // about screen
            ListTile(
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => AboutDeveloper()));
              },
              title: GestureDetector(
                child: AutoSizeText(
                  LocaleKeys.drawer_widget_about_developer.tr(),
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
              ),
            ),
            // tech used
            ListTile(
              title: GestureDetector(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => SupportDeveloper()));
                },
                child: AutoSizeText(
                  LocaleKeys.drawer_widget_support_developer.tr(),
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
              ),
            ),
            ListTile(
              title: GestureDetector(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => TechUsedScreen()));
                },
                child: AutoSizeText(
                  LocaleKeys.drawer_widget_tech_used_to_make_app.tr(),
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
              ),
            ),
            ListTile(
              title: GestureDetector(
                onTap: () async {
                  showCupertinoDialog(
                      context: context,
                      builder: (context) => CupertinoAlertDialog(
                            // title
                            title: Text(
                              LocaleKeys.drawer_widget_title_logout.tr(),
                              style: Theme.of(context)
                                  .textTheme
                                  .labelMedium
                                  ?.copyWith(
                                      color: true == Brightness.light
                                          ? Colors.black
                                          : Colors.black),
                              textAlign: TextAlign.start,
                            ),
                            content: Text(
                              '${LocaleKeys.drawer_widget_my_sir.tr()} ${FirebaseAuth.instance.currentUser?.displayName ?? ""} ${LocaleKeys.drawer_widget_title_description.tr()}',
                              style: Theme.of(context)
                                  .textTheme
                                  .bodySmall
                                  ?.copyWith(
                                    color: true == Brightness.light
                                        ? Colors.black
                                        : Colors.black,
                                  ),
                            ),
                            actions: [
                              // don't log out
                              CupertinoDialogAction(
                                  onPressed: () async {
                                    Navigator.pop(context);
                                  },
                                  child: Text(
                                    LocaleKeys.drawer_widget_title_cancel_button
                                        .tr(),
                                    style: TextStyle(
                                        color: Colors.red, fontSize: 20),
                                  )),
                              // log out
                              CupertinoDialogAction(
                                  onPressed: () async {
                                    await FirebaseAuth.instance.signOut();
                                    context.go(Routes.authScreenRoute);
                                    Navigator.pop(context);
                                  },
                                  child: Text(
                                    LocaleKeys.drawer_widget_title_logout_button
                                        .tr(),
                                    style: TextStyle(
                                        color: Colors.blue, fontSize: 20),
                                  ))
                            ],
                          ));
                },
                // log out from app
                child: Text(
                  LocaleKeys.drawer_widget_title_logout_button.tr(),
                  style: TextStyle(color: Colors.red, fontSize: 20),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
