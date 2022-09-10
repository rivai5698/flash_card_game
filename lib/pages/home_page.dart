import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cards game'),
        centerTitle: true,
      ),
      body: Container(
        width: double.infinity,
        height: double.infinity,

        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Center(
              child: Text(
                'Chose level: ',
                style: TextStyle(color: Colors.blue, fontSize: 30,fontWeight: FontWeight.bold,),
              ),
            ),
            const SizedBox(
              height: 24,
            ),
            Flexible(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,

                children: [
                  levelButton('Level 1'),
                  levelButton('level 2'),
                  levelButton('Level 3'),
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
          onPressed: () {

          },
          child: Text(
            text,
            style: const TextStyle(color: Colors.white, fontSize: 15),
          )),
    );
  }
}
