import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:myapp/app/modules/matakuliah/controllers/matakuliah_controller.dart';

class MatakuliahAddView extends GetView<MatakuliahController> {
  const MatakuliahAddView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Tambah Matakuliah'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8),
        child: Column(
          children: [
            TextField(
              controller: controller.kode_matakuliah,
              autocorrect: false,
              textInputAction: TextInputAction.next,
              decoration: const InputDecoration(labelText: "Kode Matakuliah"),
            ),
            const SizedBox(
              height: 10,
            ),
            TextField(
              controller: controller.nama_matakuliah,
              textInputAction: TextInputAction.done,
              decoration: const InputDecoration(labelText: "Nama Matakuliah"),
            ),
            const SizedBox(
              height: 10,
            ),
            TextField(
              controller: controller.sks_matakuliah,
              textInputAction: TextInputAction.done,
              decoration: const InputDecoration(labelText: "Sks Matakuliah"),
            ),
            const SizedBox(
              height: 30,
            ),
            ElevatedButton(
              onPressed: () => controller.add(
                controller.kode_matakuliah.text,
                controller.nama_matakuliah.text,
                controller.sks_matakuliah.text,
              ),
              child: const Text("Simpan"),
            )
          ],
        ),
      ),
    );
  }
}
