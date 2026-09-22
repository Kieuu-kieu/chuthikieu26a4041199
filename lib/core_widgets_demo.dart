import 'package:flutter/material.dart';

class CoreWidgetsDemo extends StatelessWidget {
  const CoreWidgetsDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Exercise 1 – Core Widgets'),
      ),

      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),

        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            // 1. Text widget
            const Text(
              'Welcome to Flutter UI',
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 20),

            // 2. Icon widget
            const Center(
              child: Icon(
                Icons.movie,
                size: 60,
                color: Colors.blue,
              ),
            ),

            const SizedBox(height: 20),

            // 3. Image.network
            ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: Image.network(
                'https://picsum.photos/500/250',
                width: double.infinity,
                height: 180,
                fit: BoxFit.cover,

                // Hiển thị khi ảnh đang tải
                loadingBuilder: (context, child, loadingProgress) {
                  if (loadingProgress == null) {
                    return child;
                  }

                  return const SizedBox(
                    height: 180,
                    child: Center(
                      child: CircularProgressIndicator(),
                    ),
                  );
                },

                // Hiển thị nếu ảnh lỗi
                errorBuilder: (context, error, stackTrace) {
                  return Container(
                    height: 180,
                    color: Colors.grey.shade300,
                    child: const Center(
                      child: Icon(
                        Icons.broken_image,
                        size: 50,
                      ),
                    ),
                  );
                },
              ),
            ),

            const SizedBox(height: 20),

            // 4. Card + ListTile
            Card(
              elevation: 2,
              child: ListTile(
                leading: const Icon(Icons.star),

                title: const Text(
                  'Movie Item',
                ),

                subtitle: const Text(
                  'This is a sample ListTile inside a Card.',
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}