import 'package:flutter/cupertino.dart';

// deprecated
class VideoConfigData extends InheritedWidget {
  final bool autoMute;
  final void Function() toggleAutoMute; // 매개변수가 없고 반환값도 없는 타입

  const VideoConfigData({
    super.key,
    required super.child,
    required this.autoMute,
    required this.toggleAutoMute,
  });

  static VideoConfigData of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<VideoConfigData>()!;
  }

  @override
  bool updateShouldNotify(covariant InheritedWidget oldWidget) {
    return true;
  }
}

class VideoConfigInheritedWidget extends StatefulWidget {
  final Widget child;

  const VideoConfigInheritedWidget({
    super.key,
    required this.child,
  });

  @override
  State<VideoConfigInheritedWidget> createState() => _VideoConfigState();
}

class _VideoConfigState extends State<VideoConfigInheritedWidget> {
  bool autoMute = false;

  void _toggelAutoMute() {
    setState(() {
      autoMute = !autoMute;
    });
  }

  @override
  Widget build(BuildContext context) {
    return VideoConfigData(
      child: widget.child,
      autoMute: autoMute,
      toggleAutoMute: _toggelAutoMute,
    );
  }
}
