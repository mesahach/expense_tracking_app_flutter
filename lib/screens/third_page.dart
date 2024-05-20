import 'package:flutter/material.dart';
import 'package:my_expen/constants/pages.dart';

class Thirdpage extends StatelessWidget {
  const Thirdpage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              "Thrid Page",
              style: TextStyle(fontSize: 30),
            ),
            ElevatedButton(
              child: const Text(
                "Navigate to 1st Page",
                style: TextStyle(fontSize: 22),
              ),
              onPressed: () {
                Navigator.pushNamed(
                  context,
                  homePage,
                  arguments: 'from third page',
                );
                // Navigator.push(
                //   context,
                //   MaterialPageRoute(
                //     builder: (_) => SecondPage('data'),
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
