import 'package:flutter/material.dart';
import 'package:my_expen/constants/pages.dart';
import 'package:my_expen/screens/sec_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              "First Page",
              style: TextStyle(fontSize: 30),
            ),
            ElevatedButton(
              child: const Text(
                "Navigate to 2nd Page",
                style: TextStyle(fontSize: 22),
              ),
              onPressed: () {
                Navigator.pushNamed(
                  context,
                  secondPage,
                  arguments: 'from home page',
                );
                //   Navigator.push(
                //     context,
                //     MaterialPageRoute(
                //       builder: (_) => SecondPage('data'),
                //     ),
                //   );
              },
            ),
          ],
        ),
      ),
    );
  }
}
