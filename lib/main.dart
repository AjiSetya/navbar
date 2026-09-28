import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:mysample/pages/kalkulator_screen.dart';
import 'package:mysample/widgets/product_grid.dart';

import 'pages/feeds_sreen.dart';
import 'pages/home_screen.dart';
import 'pages/login_screen.dart';
import 'pages/mall_sreen.dart';
import 'pages/profile_screen.dart';
import 'pages/register_screen.dart';
import 'pages/transactions_screen.dart';

/// Flutter code sample for [NavigationBar].

void main() => runApp(const NavigationBarApp());

class NavigationBarApp extends StatelessWidget {
  const NavigationBarApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        // Explicitly enable Material 3 (Optional for modern Flutter versions)
        useMaterial3: true,
        // Generate a full M3 ColorScheme from a single seed color
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.deepPurple,
          brightness: Brightness.light,
        ),
      ),
      darkTheme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.deepPurple,
          brightness: Brightness.dark,
        ),
      ),
      // Halaman pertama yang dibuka
      // home: NavigationExample(),
      // route awal
      initialRoute: '/login',

      // Daftar route
      routes: {
        '/login': (context) => const LoginPage(),
        '/register': (context) => const RegisterPage(),
        '/home': (context) => const NavigationExample(),
      },
    );
  }
}

class NavigationExample extends StatefulWidget {
  const NavigationExample({super.key});

  @override
  State<NavigationExample> createState() => _NavigationExampleState();
}

class _NavigationExampleState extends State<NavigationExample> {
  int currentPageIndex = 0;

  List<Widget> pages = [
    HomeScreen(),
    FeedsScreen(),
    MallScreen(),
    TransactionsScreen(),
    // ProductGrid(),
    // KalkulatorScreen(),
    ProfileScreen(),
  ];

  // kondisi navbar muncul atau tidak
  bool _showNavigationBar = true;

  // penentu kemunculan navbar
  void _handleScroll(ScrollNotification notification) {
    if (notification is UserScrollNotification) {
      // jika scroll kebawah (layar ke atas)
      if (notification.direction == ScrollDirection.reverse) {
        // sembunyikan navbar
        setState(() {
          _showNavigationBar = false;
        });
      } else if (notification.direction == ScrollDirection.forward) {
        // jika scroll keatas (layar ke bawah)
        // tampilkan navbar
        setState(() {
          _showNavigationBar = true;
        });
      }
    }
  }

  // penentu apakah dialog sudah muncul
  bool dialogSudahMuncul = false;

  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
    // jika dialog sudah muncul, tidak perlu menampilkan lagi
    if (dialogSudahMuncul) return;

    // ubah setatus dialog sudah muncul
    dialogSudahMuncul = true;

    // menbuat variabel arguments dari route
    // arguments mengambil data dari halaman sebelumnya sebagai tipe data Map
    final arguments =
        ModalRoute.of(context)?.settings.arguments as Map<String, dynamic>?;
    // memasukkan data ke variabel seusai key
    final dataDiri = arguments?['data'];
    final sesi = arguments?['sesi'];
    final tanggal = arguments?['tanggal'];

    WidgetsBinding.instance.addPostFrameCallback((_) {
      // jika data diri ada
      if (dataDiri != null) {
        // tampilkan dialog
        showDialog(
          context: context,
          builder: (context) => AlertDialog(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
            title: Column(
              children: [
                Icon(Icons.waving_hand, size: 50, color: Colors.deepPurple),
                const SizedBox(height: 10),
                const Text('Selamat Datang!', textAlign: TextAlign.center),
              ],
            ),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  '${dataDiri['name']}',
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                const SizedBox(height: 5),

                const Text(
                  'Senang melihat kamu kembali.',
                  textAlign: TextAlign.center,
                ),

                const SizedBox(height: 20),

                Container(
                  padding: const EdgeInsets.all(15),
                  decoration: BoxDecoration(
                    color: Colors.deepPurple.withValues(alpha: 0.1),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          const Icon(Icons.calendar_today),
                          const SizedBox(width: 10),
                          Text('Tanggal: $tanggal'),
                        ],
                      ),

                      const SizedBox(height: 10),

                      Row(
                        children: [
                          const Icon(Icons.access_time),
                          const SizedBox(width: 10),
                          Text('Sesi: $sesi'),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
            actions: [
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: const Text('Mulai'),
                ),
              ),
            ],
          ),
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: NotificationListener<ScrollNotification>(
        onNotification: (notification) {
          _handleScroll(notification);
          return false;
        },
        child: Stack(
          children: [
            pages[currentPageIndex],
            Positioned(
              left: 16,
              right: 16,
              bottom: 12,
              child: AnimatedSlide(
                duration: const Duration(milliseconds: 300),
                curve: Curves.easeOutCubic,
                // Muncul: Offset(0, 0)
                // Hilang: geser ke bawah
                offset: _showNavigationBar ? Offset.zero : const Offset(0, 1.5),

                child: AnimatedOpacity(
                  duration: const Duration(milliseconds: 250),
                  curve: Curves.easeInOut,
                  opacity: _showNavigationBar ? 1.0 : 0.0,

                  child: _navBar(),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _navBar() {
    return Material(
      elevation: 10,
      borderRadius: BorderRadius.circular(25),
      clipBehavior: Clip.antiAlias,
      child: NavigationBar(
        // ketika menu diklik
        onDestinationSelected: (int selectedMenu) {
          setState(() {
            // ubah urutan menu dan halaman
            currentPageIndex = selectedMenu;
          });
        },
        indicatorColor: Theme.of(context).colorScheme.primary,
        // menunjukkan menu mana yang aktif
        selectedIndex: currentPageIndex,
        // kumpulan menu
        destinations: const <Widget>[
          // menu-menu di bawah
          NavigationDestination(
            selectedIcon: Icon(Icons.home, color: Colors.white),
            icon: Icon(Icons.home_outlined),
            label: 'Home',
          ),
          NavigationDestination(
            selectedIcon: Icon(Icons.video_collection, color: Colors.white),
            icon: Icon(Icons.video_collection_outlined),
            label: 'Feeds',
          ),
          NavigationDestination(
            selectedIcon: Icon(Icons.store, color: Colors.white),
            icon: Icon(Icons.store_outlined),
            label: 'Mall',
          ),
          NavigationDestination(
            selectedIcon: Icon(Icons.list_alt, color: Colors.white),
            icon: Badge(label: Text('2'), child: Icon(Icons.list_alt_outlined)),
            label: 'Transactions',
          ),
          NavigationDestination(
            selectedIcon: Icon(Icons.person, color: Colors.white),
            icon: Icon(Icons.person_outlined),
            label: 'Profile',
          ),
        ],
      ),
    );
  }
}
