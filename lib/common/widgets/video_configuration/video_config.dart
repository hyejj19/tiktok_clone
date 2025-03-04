import 'package:flutter/cupertino.dart';

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

class VideoConfig extends StatefulWidget {
  final Widget child;

  const VideoConfig({
    super.key,
    required this.child,
  });

  @override
  State<VideoConfig> createState() => _VideoConfigState();
}

class _VideoConfigState extends State<VideoConfig> {
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
