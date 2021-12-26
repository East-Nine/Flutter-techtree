import 'package:camera/camera.dart';

List<int> charToMorseTimeList(String c) {
  List<int> list;
  var char = c.toLowerCase();

  switch (char) {
    case 'a':
      list = <int>[300, 600];
      break;
    case 'b':
      list = <int>[600, 300, 300, 300];
      break;
    case 'c':
      list = <int>[600, 300, 600, 300];
      break;
    case 'd':
      list = <int>[600, 300, 300];
      break;
    case 'e':
      list = <int>[300];
      break;
    case 'f':
      list = <int>[300, 300, 600, 300];
      break;
    case 'g':
      list = <int>[600, 600, 300];
      break;
    case 'h':
      list = <int>[300, 300, 300, 300];
      break;
    case 'i':
      list = <int>[300, 300];
      break;
    case 'j':
      list = <int>[300, 600, 600, 600];
      break;
    case 'k':
      list = <int>[600, 300, 600];
      break;
    case 'l':
      list = <int>[300, 600, 300, 300];
      break;
    case 'm':
      list = <int>[600, 600];
      break;
    case 'n':
      list = <int>[600, 300];
      break;
    case 'o':
      list = <int>[600, 600, 600];
      break;
    case 'p':
      list = <int>[300, 600, 600, 300];
      break;
    case 'q':
      list = <int>[600, 600, 300, 600];
      break;
    case 'r':
      list = <int>[300, 600, 300];
      break;
    case 's':
      list = <int>[300, 300, 300];
      break;
    case 't':
      list = <int>[600];
      break;
    case 'u':
      list = <int>[300, 300, 600];
      break;
    case 'v':
      list = <int>[300, 300, 300, 600];
      break;
    case 'w':
      list = <int>[300, 600, 600];
      break;
    case 'x':
      list = <int>[600, 300, 300, 600];
      break;
    case 'y':
      list = <int>[600, 300, 600, 600];
      break;
    case 'z':
      list = <int>[600, 600, 300, 300];
      break;
    default:
      list = <int>[];
  }

  return list;
}

Future<void> listToFlashMorse(CameraController controller, List<int> morseList) async {
  await Future.forEach<int>(morseList, (element) async {
      print(element);
      await runFlash(controller, element);
  });
}

Future<void> runFlash(CameraController controller, int duration) async {
  await Future.sync(() => controller.setFlashMode(FlashMode.torch));
  await Future.delayed(Duration(milliseconds: duration));
  await Future.sync(() => controller.setFlashMode(FlashMode.off));

  await Future.delayed(const Duration(milliseconds: 500));
}