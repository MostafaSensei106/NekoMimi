import 'package:flutter/material.dart';
import 'package:nekomimi/generated/l10n.dart';

class AboutNeko extends StatelessWidget {
  const AboutNeko({super.key});


  void buildAboutTadamonDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Row(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(13.0),
                clipBehavior: Clip.antiAlias,
                child: const FlutterLogo(),

                // Image.asset(
                //   'lib/assets/images/Tadamon_Logo.png',
                //   width: 45,
                //   height: 45,
                // ),
              ),
              const SizedBox(width: 10),
              Column(
                children: [
                  Text(
                    S.of(context).title,
                  ),
                ],
              ),
            ],
          ),
          content: Container(
            padding: const EdgeInsets.all(8.0),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(14.0),
              color: Theme.of(context).colorScheme.surfaceContainer,
            ),
            child:  Text(
              S.of(context).AboutApp,
              textAlign: TextAlign.justify,
            ),
          ),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text(S.of(context).Close),
            ),
            TextButton(
              onPressed: () {
                showLicensePage(context: context);
              },
              child:  Text(
                S.of(context).License,
              ),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Container(
        padding: const EdgeInsets.all(8.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(14.0),
          color: Theme.of(context).colorScheme.surfaceContainerHigh,
        ),
        child: const Icon(
          Icons.info_outline_rounded,
          size: 27,
        ),
      ),
      title:  Text(
        S.of(context).AboutAppListTitle
      ),
      subtitle:  Text(
        S.of(context).AboutAppListSubTitle
      ),
      onTap: () {
        buildAboutTadamonDialog(context);
      },
    );
  }
}
