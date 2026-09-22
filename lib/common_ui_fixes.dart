import 'package:flutter/material.dart';

class CommonUiFixes extends StatefulWidget {
  const CommonUiFixes({super.key});

  @override
  State<CommonUiFixes> createState() =>
      _CommonUiFixesState();
}

class _CommonUiFixesState
    extends State<CommonUiFixes> {

  int counter = 0;

  // Danh sách movie
  final List<String> movies = [
    'Movie A',
    'Movie B',
    'Movie C',
    'Movie D',
  ];

  // ----------------------------------
  // SETSTATE FIX
  // ----------------------------------

  void increaseCounter() {
    setState(() {
      counter++;
    });
  }

  // ----------------------------------
  // DATE PICKER FIX
  // ----------------------------------

  Future<void> openDatePicker() async {

    final DateTime? date = await showDatePicker(
      context: context,

      initialDate: DateTime.now(),

      firstDate: DateTime(2020),

      lastDate: DateTime(2030),
    );

    if (date != null) {

      ScaffoldMessenger.of(context)
          .showSnackBar(
        SnackBar(
          content: Text(
            'Date: '
            '${date.day}/'
            '${date.month}/'
            '${date.year}',
          ),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(

      appBar: AppBar(
        title: const Text(
          'Exercise 5 – Common UI Fixes',
        ),
      ),

      // ----------------------------------
      // SINGLE CHILD SCROLL VIEW
      // ----------------------------------

      body: SingleChildScrollView(

        padding: const EdgeInsets.all(16),

        child: Column(
          crossAxisAlignment:
              CrossAxisAlignment.start,

          children: [

            const Text(
              'Correct ListView inside Column '
              'using Expanded',

              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 15),

            // ----------------------------------
            // LIST
            // ----------------------------------

            SizedBox(
              height: 220,

              child: ListView.builder(
                itemCount: movies.length,

                itemBuilder: (context, index) {

                  return ListTile(
                    leading: const Icon(
                      Icons.movie,
                    ),

                    title: Text(
                      movies[index],
                    ),
                  );
                },
              ),
            ),

            const Divider(),

            // ----------------------------------
            // SETSTATE
            // ----------------------------------

            const Text(
              'setState() example',

              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 8),

            Text(
              'Counter: $counter',
            ),

            ElevatedButton(
              onPressed: increaseCounter,

              child: const Text(
                'Increase',
              ),
            ),

            const Divider(),

            // ----------------------------------
            // DATE PICKER
            // ----------------------------------

            const Text(
              'DatePicker example',

              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 8),

            ElevatedButton(
              onPressed: openDatePicker,

              child: const Text(
                'Open DatePicker',
              ),
            ),
          ],
        ),
      ),
    );
  }
}