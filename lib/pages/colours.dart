import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Colours {
  final String name;
  final String jpgAsset;
  final Color bgColor;
  final Color fontColor;

  Colours({
    required this.name,
    required this.jpgAsset,
    required this.bgColor,
    required this.fontColor,
  });
}

class ColoursPage extends StatefulWidget {
  const ColoursPage({Key? key}) : super(key: key);

  @override
  _ColoursPageState createState() => _ColoursPageState();
}

class _ColoursPageState extends State<ColoursPage> {
  final List<Colours> colours = [
    Colours(
      name: 'Blue',
      jpgAsset: 'assets/images/colours/blue.svg',
      bgColor: Colors.lightBlueAccent,
      fontColor: Colors.lightBlueAccent,
    ),
    Colours(
      name: 'Yellow',
      jpgAsset: 'assets/images/colours/yellow.svg',
      bgColor: Colors.yellow.shade600,
      fontColor: Colors.yellow.shade600,
    ),
    Colours(
      name: 'Black',
      jpgAsset: 'assets/images/colours/black.svg',
      bgColor: Colors.black,
      fontColor: Colors.black,
    ),
    Colours(
      name: 'Green',
      jpgAsset: 'assets/images/colours/green.svg',
      bgColor: Colors.green,
      fontColor: Colors.green,
    ),
    Colours(
      name: 'Pink',
      jpgAsset: 'assets/images/colours/pink.svg',
      bgColor: Colors.pink.shade300,
      fontColor: Colors.pink.shade300,
    ),
    Colours(
      name: 'White',
      jpgAsset: 'assets/images/colours/white.svg',
      bgColor: Colors.grey.shade400,
      fontColor: Colors.grey.shade400,
    ),
    Colours(
      name: 'Red',
      jpgAsset: 'assets/images/colours/red.svg',
      bgColor: Colors.red,
      fontColor: Colors.red,
    ),
    Colours(
      name: 'Violet',
      jpgAsset: 'assets/images/colours/violet.svg',
      bgColor: Colors.deepPurple,
      fontColor: Colors.deepPurple,
    ),
    Colours(
      name: 'Brown',
      jpgAsset: 'assets/images/colours/brown.svg',
      bgColor: const Color(0xFF964B00),
      fontColor: const Color(0xFF964B00),
    ),
    Colours(
      name: 'Orange',
      jpgAsset: 'assets/images/colours/orange.svg',
      bgColor: Colors.orange,
      fontColor: Colors.orange,
    ),
  ];

  final FlutterTts flutterTts = FlutterTts();
  int currentIndex = 0;

  void _navigateToNextColour() {
    setState(() {
      currentIndex = (currentIndex + 1) % colours.length;
    });
  }

  void _navigateToPreviousColour() {
    setState(() {
      currentIndex = (currentIndex - 1 + colours.length) % colours.length;
    });
  }

  Future<void> readName(String name) async {
    await flutterTts.setLanguage("EN-IN");
    await flutterTts.speak(name);
  }

  @override
  Widget build(BuildContext context) {
    Colours colour = colours[currentIndex];
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Colours',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 30,
            color: colour.bgColor,
          ),
        ),
      ),
      backgroundColor: colour.bgColor,
      body: Center(
        child: Container(
          padding: const EdgeInsets.all(20),
          constraints: const BoxConstraints(maxWidth: 400, maxHeight: 700),
          decoration: BoxDecoration(
            color: Colors.white.withOpacity(0.7),
            borderRadius: BorderRadius.circular(7.0),
            boxShadow: [
              BoxShadow(
                color: Colors.white.withOpacity(0.2),
                spreadRadius: 2,
                blurRadius: 5,
                offset: const Offset(0, 3),
              ),
            ],
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              GestureDetector(
                onTap: _navigateToNextColour,
                child: Container(
                  width: double.infinity,
                  height: 300,
                  child: SvgPicture.asset(
                    colour.jpgAsset,
                    fit: BoxFit.contain,
                  ),
                ),
              ),
              const SizedBox(height: 20),
              Text(
                colour.name,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 60,
                  fontFamily: 'Comic',
                  color: colour.fontColor,
                ),
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  IconButton(
                    onPressed: _navigateToPreviousColour,
                    icon: const Icon(
                      Icons.arrow_back,
                      size: 30,
                    ),
                  ),
                  const SizedBox(width: 20),
                  IconButton.outlined(
                    highlightColor: Colors.amber,
                    onPressed: () {
                      readName(colour.name);
                    },
                    icon: const Icon(
                      Icons.volume_up_outlined,
                      size: 40,
                    ),
                  ),
                  const SizedBox(width: 20),
                  IconButton(
                    onPressed: _navigateToNextColour,
                    icon: const Icon(
                      Icons.arrow_forward,
                      size: 30,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

}
