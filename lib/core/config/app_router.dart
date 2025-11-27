import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../presentation/pages/login_page.dart';
import '../../presentation/pages/roadmap_page.dart';
import '../../presentation/pages/feed_page.dart';
import '../../presentation/pages/my_page.dart';

/// 앱 라우터 설정
final appRouter = GoRouter(
  initialLocation: '/login',
  routes: [
    // 로그인 페이지
    GoRoute(
      path: '/login',
      builder: (context, state) => const LoginPage(),
    ),

    // 메인 탭 (Bottom Navigation Bar)
    StatefulShellRoute.indexedStack(
      builder: (context, state, navigationShell) {
        return ScaffoldWithNavBar(navigationShell: navigationShell);
      },
      branches: [
        // 로드맵 탭
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: '/roadmap',
              builder: (context, state) => const RoadmapPage(),
            ),
          ],
        ),
        // 자료 피드 탭
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: '/feed',
              builder: (context, state) => const FeedPage(),
            ),
          ],
        ),
        // 마이 페이지 탭
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: '/my',
              builder: (context, state) => const MyPage(),
            ),
          ],
        ),
      ],
    ),
  ],
);

/// Bottom Navigation Bar가 있는 Scaffold
class ScaffoldWithNavBar extends StatelessWidget {
  final StatefulNavigationShell navigationShell;

  const ScaffoldWithNavBar({
    super.key,
    required this.navigationShell,
  });

  void _onTap(int index) {
    navigationShell.goBranch(
      index,
      initialLocation: index == navigationShell.currentIndex,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: navigationShell,
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: navigationShell.currentIndex,
        onTap: _onTap,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.map),
            label: '로드맵',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.feed),
            label: '자료 피드',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: '마이 페이지',
          ),
        ],
      ),
    );
  }
}

