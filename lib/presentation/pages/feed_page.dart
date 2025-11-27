import 'package:flutter/material.dart';

/// 자료 피드 페이지
class FeedPage extends StatelessWidget {
  const FeedPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('자료 피드'),
      ),
      body: const Center(
        child: Text(
          '자료 피드 화면\n(구현 예정)',
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 18),
        ),
      ),
    );
  }
}

