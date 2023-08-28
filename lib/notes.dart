import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';

class Note extends StatefulWidget {
  final int no;
  final String note, type;
  final Color color, clickedColor;
  const Note(
      {super.key,
      required this.no,
      required this.note,
      required this.color,
      required this.type,
      required this.clickedColor});

  @override
  State<Note> createState() => _NoteState();
}

class _NoteState extends State<Note> {
  late Color color;
  @override
  void initState() {
    // TODO: implement initState
    color = widget.color;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GestureDetector(
        onPanStart: (_) {
          setState(() {
            color = widget.clickedColor;
          });
          final player = AudioPlayer();
          player.play(AssetSource('note${widget.no}.${widget.type}'));
        },
        onPanEnd: (_) {
          setState(() {
            color = widget.color;
          });
        },
        child: Padding(
          padding: const EdgeInsets.all(8),
          child: Container(
              alignment: Alignment.center,
              color: color,
              child: Text(
                widget.note,
                style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF151515)),
              )),
        ),
      ),
    );
  }
}
