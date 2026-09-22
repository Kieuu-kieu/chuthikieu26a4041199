import 'package:flutter/material.dart';

void main() {
  runApp(const Lab4App());
}

// ============================================================
// MAIN APP
// ============================================================

class Lab4App extends StatefulWidget {
  const Lab4App({super.key});

  @override
  State<Lab4App> createState() => _Lab4AppState();
}

class _Lab4AppState extends State<Lab4App> {
  bool isDarkMode = false;

  void toggleTheme() {
    setState(() {
      isDarkMode = !isDarkMode;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Lab 4 - Flutter UI Fundamentals',

      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.deepPurple,
        ),
        useMaterial3: true,
      ),

      darkTheme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.deepPurple,
          brightness: Brightness.dark,
        ),
        useMaterial3: true,
      ),

      themeMode:
          isDarkMode ? ThemeMode.dark : ThemeMode.light,

      home: HomeScreen(
        isDarkMode: isDarkMode,
        onThemeChanged: toggleTheme,
      ),
    );
  }
}

// ============================================================
// HOME SCREEN
// ============================================================

class HomeScreen extends StatelessWidget {
  final bool isDarkMode;
  final VoidCallback onThemeChanged;

  const HomeScreen({
    super.key,
    required this.isDarkMode,
    required this.onThemeChanged,
  });

  void openPage(BuildContext context, Widget page) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => page,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Lab 4 - Flutter UI'),
        centerTitle: true,
        actions: [
          Switch(
            value: isDarkMode,
            onChanged: (_) {
              onThemeChanged();
            },
          ),
        ],
      ),

      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          const Text(
            'Flutter UI Fundamentals',
            style: TextStyle(
              fontSize: 26,
              fontWeight: FontWeight.bold,
            ),
          ),

          const SizedBox(height: 8),

          const Text(
            'Widgets, Input Controls, Layout and Theme',
            style: TextStyle(fontSize: 16),
          ),

          const SizedBox(height: 20),

          _buildExerciseCard(
            context,
            number: '1',
            title: 'Core Widgets',
            description:
                'Text, Image, Icon, Card and ListTile',
            icon: Icons.widgets,
            page: const CoreWidgetsDemo(),
          ),

          _buildExerciseCard(
            context,
            number: '2',
            title: 'Input Widgets',
            description:
                'Slider, Switch, RadioListTile and DatePicker',
            icon: Icons.input,
            page: const InputControlsDemo(),
          ),

          _buildExerciseCard(
            context,
            number: '3',
            title: 'Layout Composition',
            description:
                'Column, Row, Padding and ListView',
            icon: Icons.dashboard,
            page: const LayoutDemo(),
          ),

          _buildExerciseCard(
            context,
            number: '4',
            title: 'App Structure & Theme',
            description:
                'Scaffold, AppBar, FAB, ThemeData and Dark Mode',
            icon: Icons.palette,
            page: AppStructureDemo(
              isDarkMode: isDarkMode,
              onThemeChanged: onThemeChanged,
            ),
          ),

          _buildExerciseCard(
            context,
            number: '5',
            title: 'Debug & Common UI Fixes',
            description:
                'ListView, Overflow, setState and DatePicker',
            icon: Icons.bug_report,
            page: const CommonUiFixes(),
          ),
        ],
      ),
    );
  }

  Widget _buildExerciseCard(
    BuildContext context, {
    required String number,
    required String title,
    required String description,
    required IconData icon,
    required Widget page,
  }) {
    return Card(
      margin: const EdgeInsets.only(bottom: 16),
      elevation: 3,
      child: ListTile(
        contentPadding: const EdgeInsets.all(16),

        leading: CircleAvatar(
          radius: 25,
          child: Text(
            number,
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),

        title: Row(
          children: [
            Icon(icon),
            const SizedBox(width: 10),
            Expanded(
              child: Text(
                title,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
              ),
            ),
          ],
        ),

        subtitle: Padding(
          padding: const EdgeInsets.only(top: 8),
          child: Text(description),
        ),

        trailing: const Icon(Icons.arrow_forward_ios),

        onTap: () {
          openPage(context, page);
        },
      ),
    );
  }
}

// ============================================================
// EXERCISE 1 - CORE WIDGETS
// ============================================================

class CoreWidgetsDemo extends StatelessWidget {
  const CoreWidgetsDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('1. Core Widgets'),
      ),

      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          const Text(
            'Hello Flutter!',
            style: TextStyle(
              fontSize: 28,
              fontWeight: FontWeight.bold,
            ),
          ),

          const SizedBox(height: 10),

          const Text(
            'This is an example of the Text widget.',
            style: TextStyle(fontSize: 16),
          ),

          const SizedBox(height: 20),

          // IMAGE
          Card(
            clipBehavior: Clip.antiAlias,
            child: Image.network(
              'https://picsum.photos/500/250',
              height: 220,
              width: double.infinity,
              fit: BoxFit.cover,
              loadingBuilder: (
                context,
                child,
                loadingProgress,
              ) {
                if (loadingProgress == null) {
                  return child;
                }

                return const SizedBox(
                  height: 220,
                  child: Center(
                    child: CircularProgressIndicator(),
                  ),
                );
              },
              errorBuilder: (
                context,
                error,
                stackTrace,
              ) {
                return const SizedBox(
                  height: 220,
                  child: Center(
                    child: Icon(
                      Icons.broken_image,
                      size: 60,
                    ),
                  ),
                );
              },
            ),
          ),

          const SizedBox(height: 20),

          const Text(
            'Icon Widget',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),

          const SizedBox(height: 10),

          const Row(
            mainAxisAlignment:
                MainAxisAlignment.spaceEvenly,
            children: [
              Icon(Icons.favorite, size: 40),
              Icon(Icons.star, size: 40),
              Icon(Icons.home, size: 40),
              Icon(Icons.person, size: 40),
            ],
          ),

          const SizedBox(height: 20),

          // CARD
          Card(
            elevation: 4,
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment:
                    CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Card Widget',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 8),
                  const Text(
                    'The Card widget creates an elevated '
                    'content container.',
                  ),
                ],
              ),
            ),
          ),

          const SizedBox(height: 20),

          // LIST TILE
          Card(
            child: ListTile(
              leading: const Icon(Icons.person),
              title: const Text('John Doe'),
              subtitle: const Text('Flutter Developer'),
              trailing: const Icon(
                Icons.arrow_forward_ios,
              ),
              onTap: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text(
                      'You tapped the ListTile',
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

// ============================================================
// EXERCISE 2 - INPUT WIDGETS
// ============================================================

class InputControlsDemo extends StatefulWidget {
  const InputControlsDemo({super.key});

  @override
  State<InputControlsDemo> createState() =>
      _InputControlsDemoState();
}

class _InputControlsDemoState
    extends State<InputControlsDemo> {
  double rating = 5;
  bool isActive = true;
  String selectedGenre = 'Action';
  DateTime? selectedDate;

  Future<void> chooseDate() async {
    final DateTime? pickedDate =
        await showDatePicker(
      context: context,
      initialDate:
          selectedDate ?? DateTime.now(),
      firstDate: DateTime(2020),
      lastDate: DateTime(2035),
    );

    if (pickedDate != null) {
      setState(() {
        selectedDate = pickedDate;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('2. Input Widgets'),
      ),

      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          const Text(
            'Slider',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),

          const SizedBox(height: 10),

          Slider(
            value: rating,
            min: 0,
            max: 10,
            divisions: 10,
            label: rating.toStringAsFixed(0),
            onChanged: (value) {
              setState(() {
                rating = value;
              });
            },
          ),

          Center(
            child: Text(
              'Value: ${rating.toStringAsFixed(0)}',
              style: const TextStyle(fontSize: 18),
            ),
          ),

          const Divider(height: 35),

          const Text(
            'Switch',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),

          SwitchListTile(
            title: const Text('Active Status'),
            subtitle: Text(
              isActive ? 'Enabled' : 'Disabled',
            ),
            value: isActive,
            onChanged: (value) {
              setState(() {
                isActive = value;
              });
            },
          ),

          const Divider(height: 35),

          const Text(
            'RadioListTile',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),

          const SizedBox(height: 10),

          RadioGroup<String>(
            groupValue: selectedGenre,
            onChanged: (value) {
              setState(() {
                selectedGenre = value!;
              });
            },
            child: const Column(
              children: [
                RadioListTile<String>(
                  title: Text('Action'),
                  subtitle: Text('Action movies'),
                  value: 'Action',
                ),
                RadioListTile<String>(
                  title: Text('Comedy'),
                  subtitle: Text('Comedy movies'),
                  value: 'Comedy',
                ),
                RadioListTile<String>(
                  title: Text('Horror'),
                  subtitle: Text('Horror movies'),
                  value: 'Horror',
                ),
              ],
            ),
          ),

          const SizedBox(height: 10),

          Text(
            'Selected genre: $selectedGenre',
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),

          const Divider(height: 35),

          const Text(
            'DatePicker',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),

          const SizedBox(height: 10),

          ElevatedButton.icon(
            onPressed: chooseDate,
            icon: const Icon(Icons.calendar_month),
            label: const Text('Select Date'),
          ),

          const SizedBox(height: 10),

          if (selectedDate != null)
            Center(
              child: Text(
                'Selected date: '
                '${selectedDate!.day}/'
                '${selectedDate!.month}/'
                '${selectedDate!.year}',
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
        ],
      ),
    );
  }
}

// ============================================================
// EXERCISE 3 - LAYOUT COMPOSITION
// ============================================================

class LayoutDemo extends StatelessWidget {
  const LayoutDemo({super.key});

  @override
  Widget build(BuildContext context) {
    final List<String> products = [
      'Laptop',
      'Smartphone',
      'Headphones',
      'Keyboard',
      'Mouse',
      'Monitor',
      'USB Drive',
      'Power Bank',
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('3. Layout Composition'),
      ),

      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment:
              CrossAxisAlignment.start,
          children: [
            const Text(
              'Product List',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 10),

            Row(
              children: [
                const Icon(Icons.shopping_cart),
                const SizedBox(width: 8),
                Text(
                  '${products.length} products',
                  style: const TextStyle(
                    fontSize: 16,
                  ),
                ),
              ],
            ),

            const SizedBox(height: 15),

            Expanded(
              child: ListView.builder(
                itemCount: products.length,
                itemBuilder: (context, index) {
                  return Card(
                    margin: const EdgeInsets.only(
                      bottom: 10,
                    ),
                    child: ListTile(
                      leading: CircleAvatar(
                        child: Text(
                          '${index + 1}',
                        ),
                      ),
                      title: Text(products[index]),
                      trailing: const Icon(
                        Icons.arrow_forward_ios,
                        size: 18,
                      ),
                    ),
                  );
                },
              ),
            ),

            const SizedBox(height: 10),

            Row(
              children: [
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {
                      ScaffoldMessenger.of(context)
                          .showSnackBar(
                        const SnackBar(
                          content: Text(
                            'You tapped Add',
                          ),
                        ),
                      );
                    },
                    child: const Text('Add'),
                  ),
                ),

                const SizedBox(width: 10),

                Expanded(
                  child: OutlinedButton(
                    onPressed: () {
                      ScaffoldMessenger.of(context)
                          .showSnackBar(
                        const SnackBar(
                          content: Text(
                            'You tapped Delete',
                          ),
                        ),
                      );
                    },
                    child: const Text('Delete'),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

// ============================================================
// EXERCISE 4 - APP STRUCTURE & THEME
// ============================================================

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
      appBar: AppBar(
        title: const Text(
          '4. App Structure & Theme',
        ),
        actions: [
          Switch(
            value: isDarkMode,
            onChanged: (_) {
              onThemeChanged();
            },
          ),
        ],
      ),

      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            mainAxisAlignment:
                MainAxisAlignment.center,
            children: [
              Icon(
                isDarkMode
                    ? Icons.dark_mode
                    : Icons.light_mode,
                size: 80,
              ),

              const SizedBox(height: 20),

              Text(
                isDarkMode
                    ? 'Dark Mode is ON'
                    : 'Light Mode is ON',
                style: const TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),

              const SizedBox(height: 10),

              const Text(
                'ThemeData and themeMode are used '
                'to switch between light and dark themes.',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 16),
              ),
            ],
          ),
        ),
      ),

      floatingActionButton: FloatingActionButton(
        onPressed: () {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text(
                'You tapped the FloatingActionButton',
              ),
            ),
          );
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}

// ============================================================
// EXERCISE 5 - DEBUG & COMMON UI FIXES
// ============================================================

class CommonUiFixes extends StatefulWidget {
  const CommonUiFixes({super.key});

  @override
  State<CommonUiFixes> createState() =>
      _CommonUiFixesState();
}

class _CommonUiFixesState
    extends State<CommonUiFixes> {
  int counter = 0;
  DateTime? selectedDate;

  Future<void> chooseDate() async {
    final DateTime? picked =
        await showDatePicker(
      context: context,
      initialDate:
          selectedDate ?? DateTime.now(),
      firstDate: DateTime(2020),
      lastDate: DateTime(2035),
    );

    if (picked != null) {
      setState(() {
        selectedDate = picked;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          '5. Debug & UI Fixes',
        ),
      ),

      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment:
              CrossAxisAlignment.start,
          children: [
            // ------------------------------------------------
            // LISTVIEW IN COLUMN
            // ------------------------------------------------

            const Text(
              '1. ListView inside Column',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 10),

            const Text(
              'A ListView inside a Column needs a '
              'limited height. SizedBox is used here '
              'to prevent an unbounded height error.',
            ),

            const SizedBox(height: 10),

            SizedBox(
              height: 220,
              child: ListView.builder(
                itemCount: 8,
                itemBuilder: (context, index) {
                  return Card(
                    child: ListTile(
                      leading: const Icon(
                        Icons.check_circle,
                      ),
                      title: Text(
                        'Item ${index + 1}',
                      ),
                    ),
                  );
                },
              ),
            ),

            const SizedBox(height: 25),

            // ------------------------------------------------
            // OVERFLOW
            // ------------------------------------------------

            const Text(
              '2. Handling Overflow',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 10),

            const Text(
              'SingleChildScrollView allows the user '
              'to scroll when the content is larger '
              'than the screen.',
            ),

            const SizedBox(height: 25),

            // ------------------------------------------------
            // SETSTATE
            // ------------------------------------------------

            const Text(
              '3. setState()',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 10),

            Center(
              child: Text(
                'Counter: $counter',
                style: const TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),

            const SizedBox(height: 10),

            Row(
              mainAxisAlignment:
                  MainAxisAlignment.center,
              children: [
                IconButton(
                  onPressed: () {
                    setState(() {
                      if (counter > 0) {
                        counter--;
                      }
                    });
                  },
                  icon: const Icon(
                    Icons.remove_circle,
                  ),
                  iconSize: 40,
                ),

                const SizedBox(width: 20),

                IconButton(
                  onPressed: () {
                    setState(() {
                      counter++;
                    });
                  },
                  icon: const Icon(
                    Icons.add_circle,
                  ),
                  iconSize: 40,
                ),
              ],
            ),

            const SizedBox(height: 25),

            // ------------------------------------------------
            // DATE PICKER
            // ------------------------------------------------

            const Text(
              '4. DatePicker',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 10),

            ElevatedButton.icon(
              onPressed: chooseDate,
              icon: const Icon(
                Icons.calendar_today,
              ),
              label: const Text(
                'Select Date',
              ),
            ),

            const SizedBox(height: 10),

            if (selectedDate != null)
              Text(
                'Selected date: '
                '${selectedDate!.day}/'
                '${selectedDate!.month}/'
                '${selectedDate!.year}',
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),

            const SizedBox(height: 30),

            // ------------------------------------------------
            // SUMMARY
            // ------------------------------------------------

            Card(
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment:
                      CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Common Errors and Solutions',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),

                    const SizedBox(height: 12),

                    const Text(
                      '• ListView inside Column → '
                      'use Expanded or SizedBox.\n\n'
                      '• Content is too long → '
                      'use SingleChildScrollView.\n\n'
                      '• UI does not update → '
                      'use setState().\n\n'
                      '• DatePicker → '
                      'use a valid BuildContext.',
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),

      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            counter++;
          });
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}