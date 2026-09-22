import 'package:flutter/material.dart';

class AppStructureDemo extends StatelessWidget {
  final bool isDarkMode;
  final VoidCallback onThemeChanged;

  const AppStructureDemo({
    super.key,
    required this.isDarkMode,
    required this.onThemeChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      // -------------------------
      // APP BAR
      // -------------------------

      appBar: AppBar(
        title: const Text(
          'Exercise 4 – App Structure',
        ),

        actions: [
          Row(
            children: [

              const Text('Dark'),

              Switch(
                value: isDarkMode,
                onChanged: (_) {
                  onThemeChanged();
                },
              ),

              const SizedBox(width: 8),
            ],
          ),
        ],
      ),

      // -------------------------
      // BODY
      // -------------------------

      body: Center(
        child: Text(
          'This is a simple screen '
          'with theme toggle.',

          style: Theme.of(context)
              .textTheme
              .bodyLarge,
        ),
      ),

      // -------------------------
      // FLOATING ACTION BUTTON
      // -------------------------

      floatingActionButton: FloatingActionButton(
        onPressed: () {

          ScaffoldMessenger.of(context)
              .showSnackBar(
            const SnackBar(
              content: Text(
                'FAB clicked!',
              ),
            ),
          );
        },

        child: const Icon(
          Icons.add,
        ),
      ),
    );
  }
}