import 'package:flutter/material.dart';

import 'core_widgets_demo.dart';
import 'input_controls_demo.dart';
import 'layout_demo.dart';
import 'app_structure_demo.dart';
import 'common_ui_fixes.dart';

void main() {
  runApp(const Lab4App());
}

class Lab4App extends StatefulWidget {
  const Lab4App({super.key});

  @override
  State<Lab4App> createState() => _Lab4AppState();
}

class _Lab4AppState extends State<Lab4App> {

  // Trạng thái Dark Mode
  ThemeMode themeMode = ThemeMode.light;

  // Chuyển Light/Dark
  void toggleTheme() {
    setState(() {
      themeMode =
          themeMode == ThemeMode.light
              ? ThemeMode.dark
              : ThemeMode.light;
    });
  }

  @override
  Widget build(BuildContext context) {

    return MaterialApp(

      debugShowCheckedModeBanner: false,

      title: 'Lab 4 Flutter UI',

      // Theme sáng
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.deepPurple,
        ),

        useMaterial3: true,
      ),

      // Theme tối
      darkTheme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.deepPurple,

          brightness: Brightness.dark,
        ),

        useMaterial3: true,
      ),

      // Chọn theme
      themeMode: themeMode,

      // Màn hình chính
      home: HomeScreen(
        isDarkMode:
            themeMode == ThemeMode.dark,

        onThemeChanged: toggleTheme,
      ),
    );
  }
}

// =====================================================
// HOME SCREEN
// =====================================================

class HomeScreen extends StatelessWidget {

  final bool isDarkMode;
  final VoidCallback onThemeChanged;

  const HomeScreen({
    super.key,
    required this.isDarkMode,
    required this.onThemeChanged,
  });

  // Hàm mở màn hình
  void openScreen(
    BuildContext context,
    Widget screen,
  ) {

    Navigator.push(
      context,

      MaterialPageRoute(
        builder: (context) => screen,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(

      appBar: AppBar(
        title: const Text(
          'Lab 4 – Flutter UI Fundamentals',
        ),
      ),

      body: ListView(
        padding: const EdgeInsets.all(16),

        children: [

          // Exercise 1
          _exerciseCard(
            context,

            title: 'Exercise 1 – Core Widgets',

            subtitle: 'Demo',

            icon: Icons.widgets,

            onTap: () {
              openScreen(
                context,
                const CoreWidgetsDemo(),
              );
            },
          ),

          // Exercise 2
          _exerciseCard(
            context,

            title: 'Exercise 2 – Input Controls',

            subtitle: 'Demo',

            icon: Icons.touch_app,

            onTap: () {
              openScreen(
                context,
                const InputControlsDemo(),
              );
            },
          ),

          // Exercise 3
          _exerciseCard(
            context,

            title: 'Exercise 3 – Layout Demo',

            subtitle: 'Demo',

            icon: Icons.view_agenda,

            onTap: () {
              openScreen(
                context,
                const LayoutDemo(),
              );
            },
          ),

          // Exercise 4
          _exerciseCard(
            context,

            title: 'Exercise 4 – App Structure & Theme',

            subtitle: isDarkMode
                ? 'Dark Mode'
                : 'Light Mode',

            icon: Icons.dark_mode,

            onTap: () {
              openScreen(
                context,

                AppStructureDemo(
                  isDarkMode: isDarkMode,

                  onThemeChanged:
                      onThemeChanged,
                ),
              );
            },
          ),

          // Exercise 5
          _exerciseCard(
            context,

            title: 'Exercise 5 – Common UI Fixes',

            subtitle: 'Demo',

            icon: Icons.build,

            onTap: () {
              openScreen(
                context,
                const CommonUiFixes(),
              );
            },
          ),
        ],
      ),
    );
  }

  // ===================================================
  // CARD EXERCISE
  // ===================================================

  Widget _exerciseCard(
    BuildContext context, {

    required String title,

    required String subtitle,

    required IconData icon,

    required VoidCallback onTap,
  }) {

    return Card(

      margin: const EdgeInsets.only(
        bottom: 12,
      ),

      child: ListTile(

        leading: Icon(icon),

        title: Text(
          title,

          style: const TextStyle(
            fontWeight: FontWeight.w500,
          ),
        ),

        subtitle: Text(
          subtitle,
        ),

        trailing: const Icon(
          Icons.chevron_right,
        ),

        onTap: onTap,
      ),
    );
  }
}