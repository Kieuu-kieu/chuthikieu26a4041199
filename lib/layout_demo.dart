import 'package:flutter/material.dart';

class LayoutDemo extends StatelessWidget {
  const LayoutDemo({super.key});

  final List<Map<String, String>> movies = const [
    {
      'title': 'Avatar',
      'description': 'Sample description',
      'letter': 'A',
    },
    {
      'title': 'Inception',
      'description': 'Sample description',
      'letter': 'I',
    },
    {
      'title': 'Interstellar',
      'description': 'Sample description',
      'letter': 'I',
    },
    {
      'title': 'Joker',
      'description': 'Sample description',
      'letter': 'J',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Exercise 3 – Layout Demo'),
      ),

      body: Padding(
        padding: const EdgeInsets.all(16),

        child: Column(
          children: [

            // Tiêu đề
            const Text(
              'Now Playing',

              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 12),

            // ListView được đặt trong Expanded
            Expanded(
              child: ListView.builder(
                itemCount: movies.length,

                itemBuilder: (context, index) {

                  final movie = movies[index];

                  return Card(
                    margin: const EdgeInsets.only(
                      bottom: 8,
                    ),

                    child: Padding(
                      padding: const EdgeInsets.all(12),

                      child: Row(
                        children: [

                          // Avatar
                          CircleAvatar(
                            child: Text(
                              movie['letter']!,
                            ),
                          ),

                          const SizedBox(width: 12),

                          // Nội dung
                          Expanded(
                            child: Column(
                              crossAxisAlignment:
                                  CrossAxisAlignment.start,

                              children: [
                                Text(
                                  movie['title']!,

                                  style: const TextStyle(
                                    fontWeight:
                                        FontWeight.w500,
                                  ),
                                ),

                                const SizedBox(height: 4),

                                Text(
                                  movie['description']!,
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}