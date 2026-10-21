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
      home: const MainContainer(),
    );
  }
}

class MainContainer extends StatefulWidget {
  const MainContainer({super.key});

  @override
  State<MainContainer> createState() => _MainContainerState();
}

class _MainContainerState extends State<MainContainer> {
  int _currentIndex = 0;

  final List<Widget> _screens = [
    const HomePage(),
    const Center(child: Text('المساعد الذكي وحل المسائل', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold))),
    const Center(child: Text('الملفات والمحفوظات', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold))),
    const Center(child: Text('الملف الشخصي', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold))),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens[_currentIndex],
      bottomNavigationBar: Container(
        margin: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(24),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.08),
              blurRadius: 20,
              offset: const Offset(0, 5),
            ),
          ],
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(24),
          child: BottomNavigationBar(
            currentIndex: _currentIndex,
            onTap: (index) {
              setState(() {
                _currentIndex = index;
              });
            },
            type: BottomNavigationBarType.fixed,
            backgroundColor: Colors.white,
            selectedItemColor: const Color(0xFF4A90E2),
            unselectedItemColor: Colors.grey,
            selectedFontSize: 12,
            unselectedFontSize: 12,
            items: const [
              BottomNavigationBarItem(
                icon: Icon(Icons.home_rounded),
                label: 'الرئيسية',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.auto_awesome_rounded),
                label: 'المساعد الذكي',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.folder_rounded),
                label: 'ملفاتي',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.person_rounded),
                label: 'حسابي',
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// 🏠 الصفحة الرئيسية (الأقسام الكبرى)
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
        'departments': ['هندسة المدني', 'هندسة العمارة', 'هندسة الحاسبات والاتصالات'],
      },
      {
        'title': 'المجموعة الطبية',
        'subtitle': 'طب عام، طب أسنان، صيدلة، تمريض...',
        'icon': Icons.medical_services_rounded,
        'color': const Color(0xFF50E3C2),
        'departments': ['طب الأسنان', 'الصيدلة', 'التمريض'],
      },
      {
        'title': 'المجموعة التربوية والإنسانية',
        'subtitle': 'تربية، لغات، قانون، آداب...',
        'icon': Icons.menu_book_rounded,
        'color': const Color(0xFFF5A623),
        'departments': ['كلية التربية', 'كلية القانون'],
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
            // أداة تحسين الصور
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
                            'يقرا كلشي بدقة فائقة وبدون تغيير للتفاصيل',
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
                      onTap: () {
                        // الانتقال لصفحة الفروع التخصصية
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => DepartmentsPage(
                              categoryTitle: item['title'],
                              departments: item['departments'],
                            ),
                          ),
                        );
                      },
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

// 🏛️ شاشة الفروع التخصصية (مثلاً فروع الهندسة)
class DepartmentsPage extends StatelessWidget {
  final String categoryTitle;
  final List<String> departments;

  const DepartmentsPage({super.key, required this.categoryTitle, required this.departments});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(categoryTitle, style: const TextStyle(fontWeight: FontWeight.bold)),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView.builder(
          itemCount: departments.length,
          itemBuilder: (context, index) {
            return Card(
              margin: const EdgeInsets.only(bottom: 14),
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
              child: ListTile(
                contentPadding: const EdgeInsets.all(16),
                title: Text(departments[index], style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                subtitle: const Text('اختر لعرض المراحل الدراسية', style: TextStyle(color: Colors.grey)),
                trailing: const Icon(Icons.arrow_forward_ios_rounded, size: 18),
                onTap: () {
                  // الانتقال للمراحل الدراسية
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => StagesPage(departmentName: departments[index]),
                    ),
                  );
                },
              ),
            );
          },
        ),
      ),
    );
  }
}

// 📚 شاشة المراحل الدراسية (أولى، ثانية، ثالثة، رابعة)
class StagesPage extends StatelessWidget {
  final String departmentName;

  const StagesPage({super.key, required this.departmentName});

  @override
  Widget build(BuildContext context) {
    final stages = ['المرحلة الأولى', 'المرحلة الثانية', 'المرحلة الثالثة', 'المرحلة الرابعة'];

    return Scaffold(
      appBar: AppBar(
        title: Text(departmentName, style: const TextStyle(fontWeight: FontWeight.bold)),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView.builder(
          itemCount: stages.length,
          itemBuilder: (context, index) {
            return Card(
              margin: const EdgeInsets.only(bottom: 14),
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
              child: ListTile(
                contentPadding: const EdgeInsets.all(16),
                leading: CircleAvatar(
                  backgroundColor: const Color(0xFF4A90E2).withOpacity(0.15),
                  child: Text('${index + 1}', style: const TextStyle(color: Color(0xFF4A90E2), fontWeight: FontWeight.bold)),
                ),
                title: Text(stages[index], style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                trailing: const Icon(Icons.arrow_forward_ios_rounded, size: 18),
                onTap: () {
                  // الانتقال للمواد الدراسية مع المصادر
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => SubjectsPage(stageName: stages[index]),
                    ),
                  );
                },
              ),
            );
          },
        ),
      ),
    );
  }
}

// 📖 شاشة المواد الدراسية مع مصادرها المعتمدة
class SubjectsPage extends StatelessWidget {
  final String stageName;

  const SubjectsPage({super.key, required this.stageName});

  @override
  Widget build(BuildContext context) {
    // قائمة المواد مع مصادرها الأكاديمية والشائعة في الجامعات العراقية
    final List<Map<String, String>> subjects = [
      {'name': 'ميكانيك التربة (Soil Mechanics)', 'source': 'المصدر المعتمد: Das / Bowles'},
      {'name': 'مقاومة المواد (Strength of Materials)', 'source': 'المصدر المعتمد: Hibbeler'},
      {'name': 'التحليل الإنشائي (Structural Analysis)', 'source': 'المصدر المعتمد: Kassimali'},
      {'name': 'الخرسانة المسلحة (Reinforced Concrete)', 'source': 'المصدر المعتمد: Nilson / ACI Code'},
    ];

    return Scaffold(
      appBar: AppBar(
        title: Text('المواد الدراسية - $stageName', style: const TextStyle(fontWeight: FontWeight.bold)),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView.builder(
          itemCount: subjects.length,
          itemBuilder: (context, index) {
            final sub = subjects[index];
            return Card(
              margin: const EdgeInsets.only(bottom: 14),
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
              child: ListTile(
                contentPadding: const EdgeInsets.all(16),
                title: Text(sub['name']!, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 15)),
                subtitle: Text(sub['source']!, style: const TextStyle(color: Color(0xFF4A90E2), fontSize: 12, fontWeight: FontWeight.w600)),
                trailing: const Icon(Icons.arrow_forward_ios_rounded, size: 18),
                onTap: () {
                  // الانتقال لصفحة رفع الملفات أو الصور وحل المسائل بناءً على المصدر
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => SubjectActionPage(subjectName: sub['name']!, sourceName: sub['source']!),
                    ),
                  );
                },
              ),
            );
          },
        ),
      ),
    );
  }
}

// ⚙️ شاشة رفع الصور والملفات PDF وتوليد الحلول الذكية حسب المصدر
class SubjectActionPage extends StatelessWidget {
  final String subjectName;
  final String sourceName;

  const SubjectActionPage({super.key, required this.subjectName, required this.sourceName});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(subjectName, style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: const Color(0xFF4A90E2).withOpacity(0.1),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Text(
                sourceName,
                style: const TextStyle(color: Color(0xFF4A90E2), fontWeight: FontWeight.bold, fontSize: 13),
                textAlign: TextAlign.center,
              ),
            ),
            const SizedBox(height: 30),
            ElevatedButton.icon(
              onPressed: () {},
              icon: const Icon(Icons.camera_alt_rounded),
              label: const Text('رفع صور الأسئلة (سؤال أو أكثر)', style: TextStyle(fontSize: 16)),
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(vertical: 16),
                backgroundColor: const Color(0xFF4A90E2),
                foregroundColor: Colors.white,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
              ),
            ),
            const SizedBox(height: 16),
            OutlinedButton.icon(
              onPressed: () {},
              icon: const Icon(Icons.picture_as_pdf_rounded),
              label: const Text('رفع ملف PDF للمادة', style: TextStyle(fontSize: 16)),
              style: OutlinedButton.styleFrom(
                padding: const EdgeInsets.symmetric(vertical: 16),
                side: const BorderSide(color: Color(0xFF4A90E2), width: 2),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
