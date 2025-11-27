import 'package:flutter/material.dart';

/// 로드맵 페이지
class RoadmapPage extends StatelessWidget {
  const RoadmapPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('로드맵'),
      ),
      body: const Center(
        child: Text(
          '로드맵 화면\n(구현 예정)',
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 18),
        ),
      ),
    );
  }
}

