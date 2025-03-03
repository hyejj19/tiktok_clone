import 'dart:io';

import 'package:camera/camera.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:tiktok_code_challenge01/constants/gaps.dart';
import 'package:tiktok_code_challenge01/constants/sizes.dart';
import 'package:tiktok_code_challenge01/features/videos/video_preview_screen.dart';

class VideoRecordingScreen extends StatefulWidget {
  const VideoRecordingScreen({super.key});

  @override
  State<VideoRecordingScreen> createState() => _VideoRecordingScreenState();
}

class _VideoRecordingScreenState extends State<VideoRecordingScreen>
    with TickerProviderStateMixin, WidgetsBindingObserver {
  bool _hasPermission = false;
  bool _isSelfieMode = false;

  late final bool _noCamera = kDebugMode && Platform.isIOS;

  late FlashMode _flashMode;

  late CameraController _cameraController;
  late final AnimationController _buttonAnimationController =
      AnimationController(vsync: this, duration: Duration(milliseconds: 100));
  late final AnimationController _progressAnimationController =
      AnimationController(
          vsync: this,
          duration: Duration(seconds: 10),
          lowerBound: 0.0,
          upperBound: 1.0);

  late final Animation<double> _buttonAnimation =
      Tween(begin: 1.0, end: 1.2).animate(_buttonAnimationController);

  Future<void> initCamera() async {
    final cameras = await availableCameras();

    if (cameras.isEmpty) {
      return;
    }

    _cameraController = CameraController(
        cameras[_isSelfieMode ? 1 : 0], ResolutionPreset.ultraHigh);

    await _cameraController.initialize();
    await _cameraController.prepareForVideoRecording(); // for ios

    _flashMode = _cameraController.value.flashMode;
  }

  Future<void> initPermissions() async {
    final cameraPermission = await Permission.camera.request();
    final micPermission = await Permission.microphone.request();

    final cameraDenied =
        cameraPermission.isDenied || cameraPermission.isPermanentlyDenied;
    final micDenied =
        micPermission.isDenied || micPermission.isPermanentlyDenied;

    if (!cameraDenied & !micDenied) {
      await initCamera();
      _hasPermission = true;
      setState(() {});
    }
  }

  Future<void> _toggleSelfieMode() async {
    _isSelfieMode = !_isSelfieMode;
    await initCamera();
    setState(() {});
  }

  Future<void> _setFlashMode(FlashMode newFlashMode) async {
    await _cameraController.setFlashMode(newFlashMode);
    _flashMode = newFlashMode;
    setState(() {});
  }

  Future<void> _startRecording() async {
    if (_cameraController.value.isRecordingVideo) return;

    await _cameraController.startVideoRecording();

    _buttonAnimationController.forward();
    _progressAnimationController.forward();
  }

  Future<void> _stopRecording() async {
    if (!_cameraController.value.isRecordingVideo) return;

    _buttonAnimationController.reverse();
    _progressAnimationController.reset();

    final file = await _cameraController.stopVideoRecording();
    Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => VideoPreviewScreen(video: file),
        ));
  }

  @override
  void initState() {
    super.initState();

    if (!_noCamera) {
      initPermissions();
    } else {
      _hasPermission = true;
    }

    WidgetsBinding.instance.addObserver(this);

    _progressAnimationController.addListener(() {
      setState(() {});
    });
    _progressAnimationController.addStatusListener(
      (status) {
        if (status == AnimationStatus.completed) {
          _stopRecording();
        }
      },
    );
  }

  @override
  void dispose() {
    _buttonAnimationController.dispose();
    _progressAnimationController.dispose();
    if (!_noCamera) {
      _cameraController.dispose();
    }

    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) async {
    if (_noCamera) return;
    if (!_hasPermission) return;
    if (!_cameraController.value.isInitialized) return;

    if (state == AppLifecycleState.inactive) {
      await _cameraController.dispose();
    } else if (state == AppLifecycleState.resumed) {
      await _cameraController.initialize();
    }

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: SizedBox(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: !_hasPermission
              ? Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "초기화중...",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: Sizes.size14,
                      ),
                    ),
                    Gaps.v20,
                    CircularProgressIndicator.adaptive(
                      backgroundColor: Colors.white,
                    ),
                  ],
                )
              : Stack(
                  alignment: Alignment.center,
                  children: [
                    if (!_noCamera && _cameraController.value.isInitialized)
                      CameraPreview(_cameraController),
                    if (!_noCamera)
                      Positioned(
                        top: Sizes.size32,
                        right: Sizes.size10,
                        child: Column(
                          children: [
                            IconButton(
                              onPressed: _toggleSelfieMode,
                              icon: Icon(Icons.cameraswitch),
                              color: Colors.white,
                            ),
                            IconButton(
                              onPressed: () => _setFlashMode(FlashMode.off),
                              icon: Icon(Icons.flash_off_rounded),
                              color: _flashMode == FlashMode.off
                                  ? Colors.yellow
                                  : Colors.white,
                            ),
                            IconButton(
                              onPressed: () => _setFlashMode(FlashMode.always),
                              icon: Icon(Icons.flash_on_rounded),
                              color: _flashMode == FlashMode.always
                                  ? Colors.yellow
                                  : Colors.white,
                            ),
                            IconButton(
                              onPressed: () => _setFlashMode(FlashMode.auto),
                              icon: Icon(Icons.flash_auto_rounded),
                              color: _flashMode == FlashMode.auto
                                  ? Colors.yellow
                                  : Colors.white,
                            ),
                            IconButton(
                              onPressed: () => _setFlashMode(FlashMode.torch),
                              icon: Icon(Icons.flashlight_on_rounded),
                              color: _flashMode == FlashMode.torch
                                  ? Colors.yellow
                                  : Colors.white,
                            ),
                          ],
                        ),
                      ),
                    Positioned(
                      bottom: Sizes.size40,
                      child: GestureDetector(
                        onTapDown: (details) => _startRecording(),
                        onTapUp: (details) => _stopRecording(),
                        child: ScaleTransition(
                          scale: _buttonAnimation,
                          child: Stack(
                            alignment: Alignment.center,
                            children: [
                              SizedBox(
                                width: Sizes.size80 + Sizes.size20,
                                height: Sizes.size80 + Sizes.size20,
                                child: CircularProgressIndicator(
                                  color: Colors.red.shade400,
                                  strokeWidth: 6,
                                  value: _progressAnimationController.value,
                                ),
                              ),
                              Container(
                                width: Sizes.size80,
                                height: Sizes.size80,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: Colors.red.shade400,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    )
                  ],
                ),
        ),
      ),
    );
  }
}
