import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:assignment6/database_helper.dart';

class GameScreen extends StatefulWidget {
  @override
  _GameScreenState createState() => _GameScreenState();
}

class _GameScreenState extends State<GameScreen> {
  List<Map<String, dynamic>> _phonics = [];
  final AudioPlayer _audioPlayer = AudioPlayer();
  String? _selectedImage;
  String? _selectedAudio;

  @override
  void initState() {
    super.initState();
    _loadPhonics();
  }

  Future<void> _loadPhonics() async {
    final dbHelper = DatabaseHelper.instance;
    final phonics = await dbHelper.getPhonics();
    setState(() {
      _phonics = phonics ?? [];
    });
  }

  void _playSound(String audioPath) async {
    if (audioPath.isNotEmpty) {
      await _audioPlayer.stop(); // Stop any currently playing sound
      await _audioPlayer.setSource(AssetSource(audioPath));
      await _audioPlayer.resume();
    }
  }

  @override
  void dispose() {
    _audioPlayer.dispose(); // Dispose of the audio player
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Phonics'),
      ),
      body: Column(
        children: [
          if (_selectedImage != null)
            GestureDetector(
              onTap: () => _playSound(_selectedAudio ?? ''),
              child: Column(
                children: [
                  Image.asset(
                    _selectedImage!,
                    height: 200,
                  ),
                  Icon(
                    Icons.volume_up,
                    size: 40,
                  ),
                ],
              ),
            ),
          Expanded(
            child: GridView.builder(
              padding: const EdgeInsets.all(10.0),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                crossAxisSpacing: 10.0,
                mainAxisSpacing: 10.0,
              ),
              itemCount: _phonics.length,
              itemBuilder: (context, index) {
                final phonic = _phonics[index];
                final image = phonic['small_img'] as String? ?? '';
                final audio = phonic['audio'] as String? ?? '';
                final letter = phonic['letter'] as String? ?? '';

                return GestureDetector(
                  onTap: () {
                    setState(() {
                      _selectedImage = phonic['big_img'];
                      _selectedAudio = audio;
                    });
                    _playSound(audio);
                  },
                  child: Column(
                    children: [
                      if (image.isNotEmpty)
                        Expanded(child: Image.asset(image)),
                      Text(letter),
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
