import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/matakuliah_controller.dart';
import 'matakuliah_update_view.dart';

class MatakuliahView extends GetView<MatakuliahController> {
  const MatakuliahView({super.key});

  void showOption(id) async {
    // ignore: unused_local_variable
    var result = await Get.dialog(
      SimpleDialog(
        children: [
          ListTile(
            onTap: () {
              Get.back();
              Get.to(
                const MatakuliahUpdateView(),
                arguments: id,
              );
            },
            title: const Text('Update'),
          ),
          ListTile(
            onTap: () {
              Get.back();
              controller.delete(id);
            },
            title: const Text('Delete'),
          ),
          ListTile(
            onTap: () => Get.back(),
            title: const Text('Close'),
          ),
        ],
      ),
      barrierDismissible: false,
    );
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot<Object?>>(
      stream: Get.put(MatakuliahController()).streamData(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.active) {
          // mengambil data
          var listAllDocs = snapshot.data?.docs ?? [];
          return listAllDocs.isNotEmpty
              ? ListView.builder(
                  itemCount: listAllDocs.length,
                  itemBuilder: (context, index) => ListTile(
                    leading: CircleAvatar(
                      backgroundColor: const Color.fromARGB(255, 248, 248, 248),
                      child: Text('${index + 1}'),
                    ),
                     title: Text(
                        "${(listAllDocs[index].data() as Map<String, dynamic>)["kode_matakuliah"]}"),
                    subtitle: Text(
                        "${(listAllDocs[index].data() as Map<String, dynamic>)["nama_matakuliah"]}"),
                    trailing: IconButton(
                        onPressed: () => showOption(listAllDocs[index].id),
                        icon: const Icon(Icons.more_vert)),
                  ),
                )
              : const Center(
                  child: Text("Data Kosong"),
                );
        }
        return const Center(
          child: CircularProgressIndicator(),
        );
      },
    );
  }
}
