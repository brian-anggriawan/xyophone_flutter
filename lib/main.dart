import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: MyWidget(),
        backgroundColor: Colors.teal,
      ),
    ),
  );
}

class MyWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    List<Color> list = [
      Colors.red,
      Colors.brown,
      Colors.lightBlue,
      Colors.yellow,
      Colors.pink,
      Colors.orange,
      Colors.purple
    ];

    void playSound(int sound) {
      final player = AudioPlayer();
      player.play(AssetSource('note$sound.wav'));
    }

    Expanded buttonPiano(Color color) {
      return Expanded(
        child: TextButton(
          onPressed: () async {
            int index = list.indexOf(color) + 1;
            playSound(index);
          },
          style: ButtonStyle(
            overlayColor: MaterialStateProperty.resolveWith<Color>(
              (Set<MaterialState> states) {
                if (states.contains(MaterialState.pressed)) {
                  return Colors.lightBlue.withOpacity(0.8);
                }
                return Colors.transparent;
              },
            ),
          ),
          child: Container(
            color: color,
          ),
        ),
      );
    }

    return SafeArea(
      child: Column(
        children: list.map((color) => buttonPiano(color)).toList(),
      ),
    );
  }
}
