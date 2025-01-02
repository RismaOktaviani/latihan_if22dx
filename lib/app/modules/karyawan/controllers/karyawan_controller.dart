import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class KaryawanController extends GetxController {
  //TODO: Implement karyawanController
  late TextEditingController cNama;
  late TextEditingController cJabatan;

  FirebaseFirestore firestore = FirebaseFirestore.instance;

  Future<QuerySnapshot<Object?>> GetData() async {
    CollectionReference karyawan = firestore.collection('karyawan');

    return karyawan.get();
  }

  Stream<QuerySnapshot<Object?>> streamData() {
    CollectionReference karyawan = firestore.collection('karyawan');
    return karyawan.snapshots();
  }

  void add(String nama, String jabatan) async {
    CollectionReference karyawan = firestore.collection("karyawan");

    try {
      await karyawan.add({
        "nama": nama,
        "jabatan": jabatan,
      });
      Get.defaultDialog(
          title: "Berhasil",
          middleText: "Berhasil menyimpan data karyawan",
          onConfirm: () {
            cNama.clear();
            cJabatan.clear();
            Get.back();
            Get.back();
            textConfirm:
            "OK";
          });
    } catch (e) {
      print(e);
      Get.defaultDialog(
        title: "Terjadi Kesalahan",
        middleText: "Gagal Menambahkan karyawan.",
      );
    }
  }

  Future<DocumentSnapshot<Object?>> GetDataById(String id) async {
    DocumentReference docRef = firestore.collection("karyawan").doc(id);

    return docRef.get();
  }

  void Update(String nama, String jabatan, String id) async {
    DocumentReference karyawanById = firestore.collection("karyawan").doc(id);

    try {
      await karyawanById.update({
        "nama": nama,
        "jabatan": jabatan,
      });

      Get.defaultDialog(
        title: "Berhasil",
        middleText: "Berhasil mengubah data karyawan.",
        onConfirm: () {
          cNama.clear();
          cJabatan.clear();
          Get.back();
          Get.back();
        },
        textConfirm: "OK",
      );
    } catch (e) {
      print(e);
      Get.defaultDialog(
        title: "Terjadi Kesalahan",
        middleText: "Gagal Menambahkan karyawan.",
      );
    }
  }

  void delete(String id) {
    DocumentReference docRef = firestore.collection("karyawan").doc(id);

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
    cNama = TextEditingController();
    cJabatan = TextEditingController();
    super.onInit();
  }

  @override
  void onClose() {
    // TODO: implement onClose
    cNama.dispose();
    cJabatan.dispose();
    super.onClose();
  }
}
