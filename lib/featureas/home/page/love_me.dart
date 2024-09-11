import 'dart:io';
import 'package:flutter/material.dart';
import 'package:nekomimi/featureas/home/widget/appbar/cat_app_bar.dart';
import 'package:nekomimi/featureas/home/widget/drawer/cat_drawer.dart';

class LoveMePage extends StatefulWidget {
  const LoveMePage({super.key});

  @override
  _LoveMePageState createState() => _LoveMePageState();
}

class _LoveMePageState extends State<LoveMePage> with SingleTickerProviderStateMixin {
  String _answer = '';
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _showNetworkInfo() async {
    try {
      final result = await InternetAddress.lookup('google.com');
      if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
        final info = '''
حالة الشبكة: متصل
عنوان IP: ${result[0].address}
القطة ضحكت عليك 😹
''';
        _showToast(info);
      }
    } on SocketException catch (_) {
      _showToast('حالة الشبكة: غير متصل\nالقطة ضحكت عليك 😹');
    }
  }

  void _showToast(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        backgroundColor: Colors.purple[300],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CatAppBar(),
      drawer: const CatDrawer(),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const SizedBox(height: 20),
            const Text(
              'بتحبني يا قطقوطة؟',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, fontFamily: 'Cute Arabic Font'),
            ),
            const SizedBox(height: 24),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton.icon(
                  onPressed: () {
                    setState(() {
                      _answer = 'نعم 😻';
                    });
                    _showToast('وانا كمان بحبك يا قطقوطة ❤️');
                  },
                  icon: const Icon(Icons.favorite, color: Colors.pink),
                  label: const Text('نعم', style: TextStyle(fontFamily: 'Cute Arabic Font')),
                  style: ElevatedButton.styleFrom(
                    foregroundColor: Colors.purple[800], backgroundColor: Colors.purple[100],
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),
                ),
                const SizedBox(width: 16),
                ElevatedButton.icon(
                  onPressed: () {
                    setState(() {
                      _answer = 'لا 😿';
                    });
                    _showNetworkInfo();
                  },
                  icon: const Icon(Icons.close, color: Colors.red),
                  label: const Text('لا', style: TextStyle(fontFamily: 'Cute Arabic Font')),
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 24),
            Text(
              _answer,
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: _answer.contains('نعم') ? Colors.pink : Colors.purple,
                fontFamily: 'Cute Arabic Font',
              ),
            ),
          ],
        ),
      ),
    );
  }
}