import 'package:flutter/material.dart';

class AboutNeko extends StatelessWidget {
  const AboutNeko({super.key});

  static const String AppName = 'Neko Mimi';
  static const String aboutTadamon = 'About App';

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
                child:  FlutterLogo(),

                // Image.asset(
                //   'lib/assets/images/Tadamon_Logo.png',
                //   width: 45,
                //   height: 45,
                // ),
              ),
              const SizedBox(width: 10),
              const Column(
                children: [
                  Text(
                    AppName,
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
            child: const Text(
              'Neko Mimi is A trolling application I made when I was sitting empty and couldnt find anything to do so enjoy',
              textAlign: TextAlign.justify,
            ),
          ),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text(
                'Close',
              ),
            ),
            TextButton(
              onPressed: () {
                showLicensePage(context: context);
              },
              child: const Text(
                'License',
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
      title: const Text(
        aboutTadamon,
      ),
      subtitle: const Text(
        'More Details About App',
      ),
      onTap: () {
        buildAboutTadamonDialog(context);
      },
    );
  }
}
