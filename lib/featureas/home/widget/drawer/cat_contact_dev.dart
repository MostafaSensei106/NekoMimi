import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

class TaContactDev extends StatelessWidget {
  const TaContactDev({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).pop();
        showModalBottomSheet(
          isScrollControlled: true,
          context: context,
          builder: (BuildContext context) {
            return Directionality(
              textDirection: TextDirection.rtl,
              child: FractionallySizedBox(
                child: ClipRRect(
                  borderRadius:
                  const BorderRadius.vertical(top: Radius.circular(14)),
                  child: Container(
                    color: Theme.of(context).colorScheme.surface,
                    child: Wrap(
                      children: [
                        _buildHeader(context),
                        _buildContent(context),
                      ],
                    ),
                  ),
                ),
              ),
            );
          },
        );
      },
      child: ListTile(
        leading: _buildLeadingIcon(context),
        title:  const Text('Dev',
        ),
        subtitle:  const Text('دعم, تواصل مع المطور',
        ),
        trailing: _buildTrailingImage(),
      ),
    );
  }

  Widget _buildLeadingIcon(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(14.0),
        color: Theme.of(context).colorScheme.surfaceContainerHigh,
      ),
      child: const FaIcon(FontAwesomeIcons.dev, size: 27),
    );
  }

  Widget _buildTrailingImage() {
    return ClipRRect(
      borderRadius: BorderRadius.circular(20.0),
      clipBehavior: Clip.antiAlias,
      child: Image.asset(
        "assets/images/MHlogo.png",
        isAntiAlias: true,
        filterQuality: FilterQuality.high,
      ),
    );
  }

  Widget _buildHeader(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Container(
            margin: const EdgeInsets.symmetric(vertical: 8.0),
            width: 80.0,
            height: 5.0,
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.primaryFixedDim,
              borderRadius: BorderRadius.circular(4.0),
            ),
          ),
          const Text('رسالة من المطور',
          ),
          const SizedBox(height: 6),
        ],
      ),
    );
  }

  Widget _buildContent(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 4.0),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(14.0),
              color: Theme.of(context).colorScheme.surfaceContainer,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(height: 8.0),
                _buildMessageContainer(context,
                    "سأبقى دائماً ملتزماً بجعل تطبيق تضامن مجانياً للجميع. إذا أعجبك المشروع وترغب في دعمه، أرحب بمساهمتك. دعمك سيمكنني من الاستمرار في تقديم المساعدة لمن يحتاجها."),
                const SizedBox(height: 4.0),
                _buildProfileRow(context, 'شكراً لك.<3'),
                const SizedBox(height: 4.0),
                _buildSupportButton(context),
                const SizedBox(height: 4.0),
                _buildSocialMediaMessage(context),
              ],
            ),
          ),
          Align(
            alignment: Alignment.bottomLeft,
            child: TextButton(
              child: const Text('إغلاق'),
              onPressed: () => Navigator.of(context).pop(),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildMessageContainer(BuildContext context, String message) {
    return Row(
      children: [
        SizedBox(width: 0.172.sw),
        Expanded(
          child: _buildMessage(context, message),
        ),
      ],
    );
  }

  Widget _buildProfileRow(BuildContext context, String message) {
    return Row(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(20.0),
          clipBehavior: Clip.antiAlias,
          child: Image.asset(
            'assets/images/MHlogo.png',
            width: 0.15.sw,
            height: 0.15.sw,
          ),
        ),
        const SizedBox(width: 8.0),
        Expanded(
          child: _buildMessage(context, message),
        ),
      ],
    );
  }

  Widget _buildSupportButton(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: Theme.of(context).colorScheme.secondaryContainer,
            elevation: 1,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(14),
            ),
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          ),
          onPressed: () {},
          child: Row(
            children: [
              Icon(
                Icons.volunteer_activism_outlined,
                size: 25,
                color: Theme.of(context).colorScheme.onSecondaryContainer,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 4.0),
                child: Text(
                  'دعم المطور',
                  textAlign: TextAlign.justify,
                  style: TextStyle(
                    fontFamily: 'Tajawal',
                    color: Theme.of(context).colorScheme.onPrimaryContainer,
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildSocialMediaMessage(BuildContext context) {
    return Row(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(20.0),
          clipBehavior: Clip.antiAlias,
          child: Image.asset(
            'assets/images/MHlogo.png',
            width: 0.15.sw,
            height: 0.15.sw,
          ),
        ),
        const SizedBox(width: 8.0),
        Expanded(
          child: Container(
            padding: const EdgeInsets.all(12.0),
            margin: const EdgeInsets.symmetric(vertical: 8.0),
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.primaryContainer,
              borderRadius: BorderRadius.circular(14.0),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  ' تواصل معي علي  @Mostafa_Sensei106',
                  textAlign: TextAlign.justify,
                  style: TextStyle(
                    fontFamily: 'Tajawal',
                    color: Theme.of(context).colorScheme.onPrimaryContainer,
                  ),
                ),
                _buildSocialMediaRow(context),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildSocialMediaRow(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        _buildIconButton(
          FontAwesomeIcons.linkedin,
          'https://www.linkedin.com/in/mostafa-mahmoud-963a78235/',
          context,
          const Color(0xFF0077B5),
        ),
        _buildIconButton(
          FontAwesomeIcons.github,
          'https://github.com/MostafaSensei106',
          context,
          const Color(0xFF181717),
        ),
        _buildIconButton(
          FontAwesomeIcons.facebook,
          'https://www.facebook.com/MostafaSensei106',
          context,
          const Color(0xFF1877F2),
        ),
        // _buildIconButton(
        //   FontAwesomeIcons.instagram,
        //   'https://www.instagram.com/mostafa_sensei106/',
        //   context,
        //   Color(0xFFC13584),
        // ),
      ],
    );
  }

  Widget _buildIconButton(IconData icon, String url, BuildContext context, Color color) {
    return IconButton(
      icon: FaIcon(icon),
      iconSize: 25.0,
      color: color,
      onPressed: () => _launchURL(url),
    );
  }

  Future<void> _launchURL(String url) async {
    if (!await launchUrl(Uri.parse(url),
        mode: LaunchMode.externalApplication)) {
      throw Exception('Could not launch $url');
    }
  }

  Widget _buildMessage(BuildContext context, String message) {
    return Container(
      padding: const EdgeInsets.all(12.0),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.primaryContainer,
        borderRadius: BorderRadius.circular(14.0),
      ),
      child: Text(
        message,
        textAlign: TextAlign.justify,
        style: TextStyle(
          fontFamily: 'Tajawal',
          color: Theme.of(context).colorScheme.onPrimaryContainer,
        ),
      ),
    );
  }
}
