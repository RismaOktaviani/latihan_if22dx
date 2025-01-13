import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MatakuliahController extends GetxController {
  //TODO: Implement MatakuliahController
  late TextEditingController kode_matakuliah;
  late TextEditingController nama_matakuliah;
  late TextEditingController sks_matakuliah;

  FirebaseFirestore firestore = FirebaseFirestore.instance;

  Future<QuerySnapshot<Object?>> GetData() async {
    CollectionReference matakuliah =
        firestore.collection('matakuliah_22312071');

    return matakuliah.get();
  }

  Stream<QuerySnapshot<Object?>> streamData() {
    CollectionReference matakuliah =
        firestore.collection('matakuliah_22312071');
    return matakuliah.snapshots();
  }

  void add(String kodeMatakuliah, String namaMatakuliah,
      String sksMatakuliah) async {
    CollectionReference matakuliah =
        firestore.collection("matakuliah_22312071");

    try {
      await matakuliah.add({
        "kode_matakuliah": kodeMatakuliah,
        "nama_matakuliah": namaMatakuliah,
        "sks_matakuliah": sksMatakuliah,
      });
      Get.defaultDialog(
          title: "Berhasil",
          middleText: "Berhasil menyimpan data matakuliah",
          onConfirm: () {
            kodeMatakuliah.clear();
            namaMatakuliah.clear();
            sksMatakuliah.clear();
            Get.back();
            Get.back();
            // ignore: unused_label
            textConfirm:
            "OK";
          });
    } catch (e) {
      print(e);
      Get.defaultDialog(
        title: "Terjadi Kesalahan",
        middleText: "Gagal Menambahkan matakuliah.",
      );
    }
  }

  Future<DocumentSnapshot<Object?>> GetDataById(String id) async {
    DocumentReference docRef =
        firestore.collection("matakuliah_22312071").doc(id);

    return docRef.get();
  }

  void Update(String kodeMatakuliah, String namaMatakuliah,
      String sksMatakuliah, String id) async {
    DocumentReference matakuliahById =
        firestore.collection("matakuliah_22312071").doc(id);

    try {
      await matakuliahById.update({
        "kode_matakuliah": kodeMatakuliah,
        "nama_matakuliah": namaMatakuliah,
        "sks_matakuliah": sksMatakuliah,
      });

      Get.defaultDialog(
        title: "Berhasil",
        middleText: "Berhasil mengubah data matakuliah.",
        onConfirm: () {
          kodeMatakuliah.clear();
          namaMatakuliah.clear();
          sksMatakuliah.clear();
          Get.back();
          Get.back();
        },
        textConfirm: "OK",
      );
    } catch (e) {
      print(e);
      Get.defaultDialog(
        title: "Terjadi Kesalahan",
        middleText: "Gagal Menambahkan matakuliah.",
      );
    }
  }

  void delete(String id) {
    DocumentReference docRef =
        firestore.collection("matakuliah_22312071").doc(id);

    try {
      Get.defaultDialog(
        title: "Info",
        middleText: "Apakah anda yakin menghapus data ini ?",
        onConfirm: () {
          docRef.delete();
          Get.back();
          Get.defaultDialog(
            title: "Sukses",
            middleText: "Berhasil menghapus data",
          );
        },
        textConfirm: "Ya",
        textCancel: "Batal",
      );
    } catch (e) {
      print(e);
      Get.defaultDialog(
        title: "Terjadi kesalahan",
        middleText: "Tidak berhasil menghapus data",
      );
    }
  }

  @override
  void onInit() {
    // TODO: implement onInit
    kode_matakuliah = TextEditingController();
    nama_matakuliah = TextEditingController();
    sks_matakuliah = TextEditingController();
    super.onInit();
  }

  @override
  void onClose() {
    // TODO: implement onClose
    kode_matakuliah.dispose();
    nama_matakuliah.dispose();
    sks_matakuliah.dispose();
    super.onClose();
  }
}

extension on String {
  void clear() {}
}
