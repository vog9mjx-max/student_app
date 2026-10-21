import 'package:flutter/material.dart';

void main() {
  runApp(const StudentApp());
}

class StudentApp extends StatefulWidget {
  const StudentApp({super.key});

  @override
  State<StudentApp> createState() => _StudentAppState();
}

class _StudentAppState extends State<StudentApp> {
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
      title: 'Student App',
      theme: ThemeData(
        brightness: isDarkMode ? Brightness.dark : Brightness.light,
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFF4A90E2),
          primary: const Color(0xFF4A90E2),
          brightness: isDarkMode ? Brightness.dark : Brightness.light,
        ),
        scaffoldBackgroundColor: isDarkMode ? const Color(0xFF0F172A) : const Color(0xFFF7F9FC),
        fontFamily: 'Roboto',
        useMaterial3: true,
      ),
      home: MainContainer(onThemeToggle: toggleTheme, isDarkMode: isDarkMode),
    );
  }
}

class MainContainer extends StatefulWidget {
  final VoidCallback onThemeToggle;
  final bool isDarkMode;

  const MainContainer({super.key, required this.onThemeToggle, required this.isDarkMode});

  @override
  State<MainContainer> createState() => _MainContainerState();
}

class _MainContainerState extends State<MainContainer> {
  int _currentIndex = 0;

  late final List<Widget> _screens = [
    HomePage(onThemeToggle: widget.onThemeToggle, isDarkMode: widget.isDarkMode),
    const SmartAssistantPage(),
    const ArchivePage(),
    const ProfilePage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens[_currentIndex],
      bottomNavigationBar: Container(
        margin: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: widget.isDarkMode ? const Color(0xFF1E293B) : Colors.white,
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
            backgroundColor: widget.isDarkMode ? const Color(0xFF1E293B) : Colors.white,
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
                label: 'الأرشيف والبنك',
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

// 🏠 الصفحة الرئيسية المتكاملة
class HomePage extends StatelessWidget {
  final VoidCallback onThemeToggle;
  final bool isDarkMode;

  const HomePage({super.key, required this.onThemeToggle, required this.isDarkMode});

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
        actions: [
          IconButton(
            icon: Icon(isDarkMode ? Icons.light_mode_rounded : Icons.dark_mode_rounded),
            onPressed: onThemeToggle,
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 10),
            // أداة تحسين الصور المتقدمة HD
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
                            'مُحسّن دقة الصور والملفات HD 📸',
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 15,
                            ),
                          ),
                          SizedBox(height: 4),
                          Text(
                            'قراءة فائقة الدقة للرموز الهندسية والرياضية بدون تشويه',
                            style: TextStyle(color: Colors.white70, fontSize: 11),
                          ),
                        ],
                      ),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context) => const SmartAssistantPage()));
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFF38BDF8),
                        foregroundColor: Colors.black,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      child: const Text('فعلها', style: TextStyle(fontWeight: FontWeight.bold)),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 24),
            const Text(
              'اختر المجموعة الدراسية:',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
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

// 🏛️ شاشة الفروع
class DepartmentsPage extends StatelessWidget {
  final String categoryTitle;
  final List<String> departments;

  const DepartmentsPage({super.key, required this.categoryTitle, required this.departments});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(categoryTitle, style: const TextStyle(fontWeight: FontWeight.bold)), centerTitle: true),
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
                  Navigator.push(context, MaterialPageRoute(builder: (context) => StagesPage(departmentName: departments[index])));
                },
              ),
            );
          },
        ),
      ),
    );
  }
}

// 📚 شاشة المراحل
class StagesPage extends StatelessWidget {
  final String departmentName;

  const StagesPage({super.key, required this.departmentName});

  @override
  Widget build(BuildContext context) {
    final stages = ['المرحلة الأولى', 'المرحلة الثانية', 'المرحلة الثالثة', 'المرحلة الرابعة'];

    return Scaffold(
      appBar: AppBar(title: Text(departmentName, style: const TextStyle(fontWeight: FontWeight.bold)), centerTitle: true),
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
                  Navigator.push(context, MaterialPageRoute(builder: (context) => SubjectsPage(stageName: stages[index])));
                },
              ),
            );
          },
        ),
      ),
    );
  }
}

// 📖 شاشة المواد والمصادر
class SubjectsPage extends StatelessWidget {
  final String stageName;

  const SubjectsPage({super.key, required this.stageName});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, String>> subjects = [
      {'name': 'ميكانيك التربة (Soil Mechanics)', 'source': 'المصدر المعتمد: Das / Bowles'},
      {'name': 'مقاومة المواد (Strength of Materials)', 'source': 'المصدر المعتمد: Hibbeler'},
      {'name': 'التحليل الإنشائي (Structural Analysis)', 'source': 'المصدر المعتمد: Kassimali'},
      {'name': 'الخرسانة المسلحة (Reinforced Concrete)', 'source': 'المصدر المعتمد: Nilson / ACI Code'},
    ];

    return Scaffold(
      appBar: AppBar(title: Text('المواد - $stageName', style: const TextStyle(fontWeight: FontWeight.bold)), centerTitle: true),
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
                  Navigator.push(context, MaterialPageRoute(builder: (context) => SubjectActionPage(subjectName: sub['name']!, sourceName: sub['source']!)));
                },
              ),
            );
          },
        ),
      ),
    );
  }
}

// 🤖 شاشة المساعد الذكي وحل المسائل خطوة بخطوة
class SubjectActionPage extends StatelessWidget {
  final String subjectName;
  final String sourceName;

  const SubjectActionPage({super.key, required this.subjectName, required this.sourceName});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(subjectName, style: const TextStyle(fontSize: 15, fontWeight: FontWeight.bold)), centerTitle: true),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(color: const Color(0xFF4A90E2).withOpacity(0.1), borderRadius: BorderRadius.circular(12)),
              child: Text(sourceName, style: const TextStyle(color: Color(0xFF4A90E2), fontWeight: FontWeight.bold, fontSize: 12), textAlign: TextAlign.center),
            ),
            const SizedBox(height: 24),
            ElevatedButton.icon(
              onPressed: () {},
              icon: const Icon(Icons.camera_alt_rounded),
              label: const Text('رفع وتصفيح صور الأسئلة (HD Engine)', style: TextStyle(fontSize: 15)),
              style: ElevatedButton.styleFrom(padding: const EdgeInsets.symmetric(vertical: 16), backgroundColor: const Color(0xFF4A90E2), foregroundColor: Colors.white, shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14))),
            ),
            const SizedBox(height: 12),
            OutlinedButton.icon(
              onPressed: () {},
              icon: const Icon(Icons.quiz_rounded),
              label: const Text('توليد اختبارات Quiz ذكية للمحاضرة', style: TextStyle(fontSize: 15)),
              style: OutlinedButton.styleFrom(padding: const EdgeInsets.symmetric(vertical: 16), side: const BorderSide(color: Color(0xFF4A90E2), width: 2), shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14))),
            ),
            const SizedBox(height: 12),
            OutlinedButton.icon(
              onPressed: () {},
              icon: const Icon(Icons.translate_rounded),
              label: const Text('الترجمة الأكاديمية الفورية للمصطلحات', style: TextStyle(fontSize: 15)),
              style: OutlinedButton.styleFrom(padding: const EdgeInsets.symmetric(vertical: 16), side: const BorderSide(color: Colors.grey, width: 1.5), shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14))),
            ),
          ],
        ),
      ),
    );
  }
}

class SmartAssistantPage extends StatelessWidget {
  const SmartAssistantPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('المساعد الذكي المركزي', style: TextStyle(fontWeight: FontWeight.bold)), centerTitle: true),
      body: const Center(child: Text('اختر مادتك وابدأ برفع الأسئلة والملفات لتحليلها فوريًا', style: TextStyle(fontSize: 15, color: Colors.grey))),
    );
  }
}

class ArchivePage extends StatelessWidget {
  const ArchivePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('بنك الأسئلة والأرشيف العراقي', style: TextStyle(fontWeight: FontWeight.bold)), centerTitle: true),
      body: const Center(child: Text('أرشيف الأسئلة الوزارية والجامعية حسب المحافظات', style: TextStyle(fontSize: 15, color: Colors.grey))),
    );
  }
}

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('الملف الشخصي', style: TextStyle(fontWeight: FontWeight.bold)), centerTitle: true),
      body: const Center(child: Text('إعدادات الحساب والمحفوظات الدراسية', style: TextStyle(fontSize: 15, color: Colors.grey))),
    );
  }
}
