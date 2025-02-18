import 'package:cached_network_image/cached_network_image.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:go_router/go_router.dart';
import 'package:mental_health_app/core/routes.dart';
import 'package:mental_health_app/presentation/about_developer.dart';
import 'package:mental_health_app/presentation/tech_used.dart';
import 'package:mental_health_app/translations/locale_keys.dart';

class DrawerWidget extends StatelessWidget {
  const DrawerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
            topRight: Radius.circular(0), bottomRight: Radius.circular(0)),
      ),
      child: ListView(
        children: [
          DrawerHeader(
            // to delete the padding of drawer header
            padding: EdgeInsets.zero,
            child: Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: CachedNetworkImageProvider(
                      '${FirebaseAuth.instance.currentUser?.photoURL ?? ''}'),
                  fit: BoxFit.cover,
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Align(
                  alignment: Alignment.bottomLeft,
                  child: AutoSizeText(
                    '${FirebaseAuth.instance.currentUser?.email}',
                    style: Theme.of(context).textTheme.labelSmall?.copyWith(
                          color: FirebaseAuth.instance.currentUser?.photoURL ==
                                  null
                              ? Colors.black
                              : Colors.white,
                        ),
                  ),
                ),
              ),
            ),
          ),
          ListTile(
            onTap: () {
              context.go(Routes.aboutDeveloperScreenRoute);
            },
            title: GestureDetector(
                child: AutoSizeText(
                    LocaleKeys.drawer_widget_about_developer.tr())),
          ),
          ListTile(
            title: GestureDetector(
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => TechUsedScreen()));
              },
              child: AutoSizeText(
                  LocaleKeys.drawer_widget_tech_used_to_make_app.tr()),
            ),
          ),
          ListTile(
            title: GestureDetector(
              onTap: () async {
                showDialog(
                    context: context,
                    builder: (context) => AlertDialog(
                          title: Text(
                              LocaleKeys.drawer_widget_title_logout.tr(),
                              style: Theme.of(context).textTheme.labelMedium,
                              textAlign: TextAlign.start),
                          content: Text(
                            '${LocaleKeys.drawer_widget_my_sir.tr()} ${FirebaseAuth.instance.currentUser?.displayName ?? ""} ${LocaleKeys.drawer_widget_title_description.tr()}',
                            style: Theme.of(context)
                                .textTheme
                                .labelSmall
                                ?.copyWith(fontSize: 24),
                          ),
                          icon: Align(
                              alignment: Alignment.topLeft,
                              child: Icon(
                                Icons.cancel,
                                color: Colors.red,
                                size: 48,
                              )),
                          actions: [
                            // dont log out
                            TextButton(
                                onPressed: () async {
                                  Navigator.pop(context);
                                },
                                child: Text(
                                  LocaleKeys.drawer_widget_title_cancel_button
                                      .tr(),
                                  style: TextStyle(
                                      color: Colors.red, fontSize: 20),
                                )),
                            // dont log out
                            TextButton(
                                onPressed: () async {
                                  await FirebaseAuth.instance.signOut();
                                  Navigator.pop(context);
                                },
                                child: Text(
                                  LocaleKeys.drawer_widget_title_login_button
                                      .tr(),
                                  style: TextStyle(
                                      color: Colors.black, fontSize: 20),
                                ))
                          ],
                        ));
                // log out from app
              },
              child: AutoSizeText(
                '${LocaleKeys.drawer_widget_title_login_button.tr()}',
                style: TextStyle(color: Colors.red, fontSize: 16),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
