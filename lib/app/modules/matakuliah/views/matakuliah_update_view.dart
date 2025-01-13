import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/matakuliah_controller.dart';

class MatakuliahUpdateView extends GetView<MatakuliahController> {
  const MatakuliahUpdateView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Ubah Matakuliah'),
        centerTitle: true,
      ),
      body: FutureBuilder<DocumentSnapshot<Object?>>(
        future: controller.GetDataById(Get.arguments),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            var data = snapshot.data!.data() as Map<String, dynamic>;
            controller.kode_matakuliah.text = data['kode_matakuliah'];
            controller.nama_matakuliah.text = data['nama_matakuliah'];
            controller.sks_matakuliah.text = data['sks_matakuliah'];
            return Padding(
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
                    onPressed: () => controller.Update(
                      controller.kode_matakuliah.text,
                      controller.nama_matakuliah.text,
                      controller.sks_matakuliah.text,
                      Get.arguments,
                    ),
                    child: const Text("Ubah"),
                  )
                ],
              ),
            );
          }

          return const Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }
}
