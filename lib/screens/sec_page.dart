import 'package:flutter/material.dart';
import 'package:my_expen/constants/pages.dart';
import 'package:my_expen/screens/third_page.dart';

class SecondPage extends StatelessWidget {
  String? data;

  SecondPage(this.data, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              "Second Page",
              style: TextStyle(fontSize: 30),
            ),
            ElevatedButton(
              child: const Text(
                "Navigate to 3rd Page",
                style: TextStyle(fontSize: 22),
              ),
              onPressed: () {
                Navigator.pushNamed(
                  context,
                  thirdPage,
                  arguments: 'from 2nd page',
                );
                // Navigator.push(
                //   context,
                //   MaterialPageRoute(
                //     builder: (_) => const Thirdpage(),
                //   ),
                // );
              },
            ),
          ],
        ),
      ),
    );
  }
}
