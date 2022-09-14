import 'package:flutter/material.dart';

import 'card_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cards game'),
        centerTitle: true,
      ),
      body: SizedBox(
        width: double.infinity,
        height: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Center(
              child: Text(
                'Chose level: ',
                style: TextStyle(
                  color: Colors.blue,
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const SizedBox(
              height: 32,
            ),
            Flexible(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const CardPage(
                                      level: 1,
                                      column: 2,
                                    )));
                      },
                      child: const Text(
                        'Level 1',
                        style: TextStyle(color: Colors.white, fontSize: 15),
                      )),
                  ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const CardPage(
                                      level: 2,
                                      column: 2,
                                    )));
                      },
                      child: const Text(
                        'Level 2',
                        style: TextStyle(color: Colors.white, fontSize: 15),
                      )),
                  ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const CardPage(
                                      level: 3,
                                      column: 4,
                                    )));
                      },
                      child: const Text(
                        'Level 3',
                        style: TextStyle(color: Colors.white, fontSize: 15),
                      )),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget levelButton(String text) {
    return Container(
      color: Colors.blue,
      child: ElevatedButton(
          onPressed: () {},
          child: Text(
            text,
            style: const TextStyle(color: Colors.white, fontSize: 15),
          )),
    );
  }
}
