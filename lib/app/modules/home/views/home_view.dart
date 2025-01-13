import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:myapp/app/controllers/auth_controller.dart';
import 'package:myapp/app/modules/matakuliah/views/matakuliah_add_view.dart';
import 'package:myapp/app/modules/matakuliah/views/matakuliah_view.dart';
import 'package:myapp/app/modules/mahasiswa/views/mahasiswa_add_view.dart';

import '../../mahasiswa/views/mahasiswa_view.dart';
import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  final cAuth = Get.lazyPut(() => AuthController());

  HomeView({super.key});
  @override
  Widget build(BuildContext context) {
    return const DashboardAdmin();
  }
}

class DashboardAdmin extends StatefulWidget {
  const DashboardAdmin({super.key});

  @override
  State<DashboardAdmin> createState() => _DashboardAdminState();
}

class _DashboardAdminState extends State<DashboardAdmin> {
  final cAuth = Get.find<AuthController>();
  int _index = 0;
  final List<Map> _fragment = [
    {
      'title': 'Dashboard',
      'view': const MahasiswaView(),
      'add': () => const MahasiswaAddView(),
    },
    {
      'title': 'Data Mahasiswa',
      'view': const MahasiswaView(),
      'add': () => const MahasiswaAddView(),
    },
    {
      'title': 'Data Dosen',
      'view': const MahasiswaView(),
      'add': () => const MahasiswaAddView(),
    },
    {
      'title': 'Data Matakuliah',
      'view': const MatakuliahView(),
      'add': () => const MatakuliahAddView(),
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: drawer(),
      appBar: AppBar(
        backgroundColor: Colors.red,
        titleSpacing: 0,
        title: Text(
          _fragment[_index]['title'],
          style: const TextStyle(
            color: Colors.white,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () => Get.to(_fragment[_index]['add']),
            icon: const Icon(Icons.add_circle_outline),
          )
        ],
        iconTheme: const IconThemeData(
          color: Colors.white,
        ),
      ),
      body: _fragment[_index]['view'],
    );
  }

  Widget drawer() {
    return Drawer(
      child: ListView(
        children: [
          const DrawerHeader(
            decoration: BoxDecoration(
              color: Colors.red,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Icon(
                  Icons.account_circle,
                  size: 80,
                  color: Colors.white,
                ),
                Text(
                  "Risma Oktaviani",
                  style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                ),
                SizedBox(
                  height: 2,
                ),
                Text(
                  'Admin',
                  style: TextStyle(
                    fontSize: 12,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
          ListTile(
            onTap: () {
              setState(() => _index = 0);
              Get.back();
            },
            leading: const Icon(Icons.dashboard),
            title: const Text('Dashboard'),
            trailing: const Icon(Icons.navigate_next),
            iconColor: Colors.red,
            textColor: Colors.red,
          ),
          ListTile(
            onTap: () {
              setState(() => _index = 1);
              Get.back();
            },
            leading: const Icon(Icons.people),
            title: const Text('Data Mahasiswa'),
            trailing: const Icon(Icons.navigate_next),
            iconColor: Colors.red,
            textColor: Colors.red,
          ),
          ListTile(
            onTap: () {
              setState(() => _index = 2);
              Get.back();
            },
            leading: const Icon(Icons.people),
            title: const Text('Data Dosen'),
            trailing: const Icon(Icons.navigate_next),
            iconColor: Colors.red,
            textColor: Colors.red,
          ),
          ListTile(
            onTap: () {
              setState(() => _index = 3);
              Get.back();
            },
            leading: const Icon(Icons.people),
            title: const Text('Pemrograman Mobile_22312071'),
            trailing: const Icon(Icons.navigate_next),
            iconColor: Colors.red,
            textColor: Colors.red,
          ),
          ListTile(
            onTap: () {
              Get.back();
              cAuth.logout();
            },
            leading: const Icon(Icons.logout),
            title: const Text('Logout'),
            trailing: const Icon(Icons.navigate_next),
            iconColor: Colors.red,
            textColor: Colors.red,
          ),
        ],
      ),
    );
  }
}
