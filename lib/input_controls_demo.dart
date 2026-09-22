import 'package:flutter/material.dart';

class InputControlsDemo extends StatefulWidget {
  const InputControlsDemo({super.key});

  @override
  State<InputControlsDemo> createState() =>
      _InputControlsDemoState();
}

class _InputControlsDemoState
    extends State<InputControlsDemo> {

  // Giá trị Slider
  double rating = 50;

  // Trạng thái Switch
  bool isActive = false;

  // Radio được chọn
  String? selectedGenre;

  // Hiển thị DatePicker
  Future<void> selectDate() async {

    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2020),
      lastDate: DateTime(2030),
    );

    if (pickedDate != null) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            'Selected: '
            '${pickedDate.day}/'
            '${pickedDate.month}/'
            '${pickedDate.year}',
          ),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Exercise 2 – Input Controls'),
      ),

      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),

        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            // -----------------------------
            // SLIDER
            // -----------------------------

            const Text(
              'Rating (Slider)',
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),

            Slider(
              value: rating,

              min: 0,
              max: 100,

              divisions: 100,

              label: rating.round().toString(),

              onChanged: (value) {
                setState(() {
                  rating = value;
                });
              },
            ),

            Text(
              'Current value: ${rating.round()}',
            ),

            const SizedBox(height: 15),

            // -----------------------------
            // SWITCH
            // -----------------------------

            const Text(
              'Active (Switch)',
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),

            Row(
              mainAxisAlignment:
                  MainAxisAlignment.spaceBetween,

              children: [
                const Text('Is movie active?'),

                Switch(
                  value: isActive,

                  onChanged: (value) {
                    setState(() {
                      isActive = value;
                    });
                  },
                ),
              ],
            ),

            const SizedBox(height: 15),

            // -----------------------------
            // RADIO
            // -----------------------------

            const Text(
              'Genre (RadioListTile)',
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),

            RadioListTile<String>(
              title: const Text('Action'),

              value: 'Action',

              groupValue: selectedGenre,

              onChanged: (value) {
                setState(() {
                  selectedGenre = value;
                });
              },
            ),

            RadioListTile<String>(
              title: const Text('Comedy'),

              value: 'Comedy',

              groupValue: selectedGenre,

              onChanged: (value) {
                setState(() {
                  selectedGenre = value;
                });
              },
            ),

            Text(
              'Selected genre: '
              '${selectedGenre ?? 'None'}',
            ),

            const SizedBox(height: 20),

            // -----------------------------
            // DATE PICKER
            // -----------------------------

            SizedBox(
              width: double.infinity,

              child: ElevatedButton(
                onPressed: selectDate,

                child: const Text(
                  'Open Date Picker',
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}