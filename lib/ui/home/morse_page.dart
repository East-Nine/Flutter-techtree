

import 'package:camera/camera.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:techtree/main.dart';
import 'package:techtree/util/morse_change.dart';

class MorsePage extends StatefulWidget {

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<MorsePage> {
  late final CameraController _cameraController;
  final _editingController = TextEditingController();

  @override
  void initState() {
    super.initState();

    _initCamera();
  }

  @override
  void dispose() {
    _cameraController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) =>
      Scaffold(
          body: Column(
            children: [
              Expanded(
                  child: Container(
                    padding: const EdgeInsets.fromLTRB(8.0, 12.0, 8.0, 12.0),
                    child: TextField(
                      controller: _editingController,
                      inputFormatters: [
                        FilteringTextInputFormatter.allow(RegExp('[a-z A-Z]')),
                      ],
                      decoration: const InputDecoration(
                          border: InputBorder.none, hintText: 'input text', hintStyle: TextStyle(color: Colors.grey)),
                        style: const TextStyle(color: Colors.white),
                      maxLines: null,
                    ),
                  )
              ),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    var charList = _editingController.text.split('');
                    var morseTimeList = <int>[];

                    for (var i = 0; i < charList.length; i++) {
                      morseTimeList.addAll(charToMorseTimeList(charList[i]));
                    }

                    listToFlashMorse(_cameraController, morseTimeList);
                  },
                  child: const Text('Run'),
                ),
              ),
            ],
          ));

  void _initCamera() async {
    var camera = cameras.first;

    _cameraController = CameraController(camera, ResolutionPreset.medium);
    await _cameraController.initialize();
  }
}