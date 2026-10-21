import 'package:flutter/material.dart';

void main() {
  runApp(const StudentApp());
}

class StudentApp extends StatelessWidget {
  const StudentApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Student App',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFF4A90E2),
          primary: const Color(0xFF4A90E2),
          surface: const Color(0xFFF7F9FC),
        ),
        scaffoldBackgroundColor: const Color(0xFFF7F9FC),
        fontFamily: 'Roboto',
        useMaterial3: true,
      ),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> categories = [
      {
        'title': 'المجموعة الهندسية',
        'subtitle': 'مدني، معماري، كهرباء، حاسبات...',
        'icon': Icons.engineering_rounded,
        'color': const Color(0xFF4A90E2),
      },
      {
        'title': 'المجموعة الطبية',
        'subtitle': 'طب عام، طب أسنان، صيدلة، تمريض...',
        'icon': Icons.medical_services_rounded,
        'color': const Color(0xFF50E3C2),
      },
      {
        'title': 'المجموعة التربوية والإنسانية',
        'subtitle': 'تربية، لغات، قانون، آداب...',
        'icon': Icons.menu_book_rounded,
        'color': const Color(0xFFF5A623),
      },
      {
        'title': 'المجموعات العلمية والإدارة',
        'subtitle': 'علوم، إدارة واقتصاد، تقنيات...',
        'icon': Icons.science_rounded,
        'color': const Color(0xFF9013FE),
      },
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Student App 🎓',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
        ),
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.transparent,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 10),
            Card(
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
              elevation: 2,
              color: const Color(0xFF1E293B),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Row(
                  children: [
                    const CircleAvatar(
                      backgroundColor: Color(0xFF38BDF8),
                      child: Icon(Icons.auto_fix_high_rounded, color: Colors.white),
                    ),
                    const SizedBox(width: 14),
                    const Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'مُحسّن دقة الصور HD 📸',
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                            ),
                          ),
                          SizedBox(height: 4),
                          Text(
                            'ارفع أي صورة غير واضحة وسيقوم النظام بتوضيحها فوراً',
                            style: TextStyle(color: Colors.white70, fontSize: 12),
                          ),
                        ],
                      ),
                    ),
                    ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFF38BDF8),
                        foregroundColor: Colors.black,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      child: const Text('رفع', style: TextStyle(fontWeight: FontWeight.bold)),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 24),
            const Text(
              'اختر المجموعة الدراسية:',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Color(0xFF1E293B)),
            ),
            const SizedBox(height: 12),
            Expanded(
              child: ListView.builder(
                itemCount: categories.length,
                itemBuilder: (context, index) {
                  final item = categories[index];
                  return Card(
                    margin: const EdgeInsets.only(bottom: 14),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                    elevation: 1,
                    child: ListTile(
                      contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                      leading: CircleAvatar(
                        radius: 26,
                        backgroundColor: (item['color'] as Color).withOpacity(0.15),
                        child: Icon(item['icon'] as IconData, color: item['color'] as Color, size: 28),
                      ),
                      title: Text(
                        item['title'],
                        style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                      ),
                      subtitle: Text(
                        item['subtitle'],
                        style: const TextStyle(fontSize: 13, color: Colors.grey),
                      ),
                      trailing: const Icon(Icons.arrow_forward_ios_rounded, size: 18, color: Colors.grey),
                      onTap: () {},
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
