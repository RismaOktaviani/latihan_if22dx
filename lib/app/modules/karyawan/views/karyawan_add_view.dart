import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:myapp/app/modules/karyawan/controllers/karyawan_controller.dart';

class KaryawanAddView extends GetView<KaryawanController> {
  const KaryawanAddView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Tambah karyawan'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8),
        child: Column(
          children: [
            TextField(
              controller: controller.cNama,
              autocorrect: false,
              textInputAction: TextInputAction.next,
              decoration: const InputDecoration(labelText: "Nama"),
            ),
            const SizedBox(
              height: 10,
            ),
            TextField(
              controller: controller.cJabatan,
              textInputAction: TextInputAction.done,
              decoration: const InputDecoration(labelText: "Jabatan"),
            ),
            const SizedBox(
              height: 30,
            ),
            ElevatedButton(
              onPressed: () => controller.add(
                controller.cNama.text,
                controller.cJabatan.text,
              ),
              child: const Text("Simpan"),
            )
          ],
        ),
      ),
    );
  }
}
