import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';
import 'package:file_selector/file_selector.dart';

void main() {
  runApp(const PadsApp());
}

class PadsApp extends StatelessWidget {
  const PadsApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: PadScreen(),
    );
  }
}

class PadScreen extends StatefulWidget {
  const PadScreen({super.key});

  @override
  State<PadScreen> createState() => _PadScreenState();
}

class _PadScreenState extends State<PadScreen> {
  final AudioPlayer _player = AudioPlayer();

  Future<void> _pickAndPlay() async {
    final XFile? file = await openFile(
      acceptedTypeGroups: [
        XTypeGroup(
          label: 'audio',
          extensions: ['mp3', 'wav', 'ogg'],
        ),
      ],
    );

    if (file != null) {
      await _player.setFilePath(file.path);
      _player.play();
    }
  }

  @override
  void dispose() {
    _player.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: GestureDetector(
          onTap: _pickAndPlay,
          child: Container(
            width: 140,
            height: 140,
            decoration: BoxDecoration(
              color: Colors.orange,
              borderRadius: BorderRadius.circular(16),
            ),
            child: const Center(
              child: Text(
                "PAD",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
