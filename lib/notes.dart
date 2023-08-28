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
    Orientation orientation = MediaQuery.of(context).orientation;
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
            padding: (orientation == Orientation.portrait)
                ? EdgeInsets.symmetric(vertical: 8, horizontal: widget.no * 5)
                : EdgeInsets.fromLTRB(8, 8, 8, widget.no * 5),
            child: Container(
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  color: color,
                ),
                child: (orientation == Orientation.portrait)
                    ? Row(
                        children: [
                          const SizedBox(
                            width: 30,
                          ),
                          const CircleAvatar(
                            radius: 8,
                            backgroundColor: Color(0xFF151515),
                          ),
                          const Spacer(),
                          Text(
                            widget.note,
                            style: const TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: Color(0xFF151515)),
                          ),
                          const Spacer(),
                          const CircleAvatar(
                            radius: 8,
                            backgroundColor: Color(0xFF151515),
                          ),
                          const SizedBox(
                            width: 30,
                          ),
                        ],
                      )
                    : Column(
                        children: [
                          const SizedBox(
                            height: 30,
                          ),
                          Text(
                            widget.note,
                            style: const TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: Color(0xFF151515)),
                          ),
                          const Spacer(),
                          const CircleAvatar(
                            radius: 8,
                            backgroundColor: Color(0xFF151515),
                          ),
                          const SizedBox(
                            height: 30,
                          ),
                        ],
                      ))),
      ),
    );
  }
}
