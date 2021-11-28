import 'dart:convert';

import 'package:flutter/material.dart';

ModelProduk modelProdukFromJson(String str) =>
    ModelProduk.fromJson(json.decode(str));

String modelProdukToJson(ModelProduk data) => json.encode(data.toJson());

class ModelProduk {
  ModelProduk({
    required this.nama,
    required this.warna,
    required this.harga,
    required this.image,
  });

  String nama;
  Color warna;
  String harga;
  String image;

  factory ModelProduk.fromJson(Map<String, dynamic> json) => ModelProduk(
        nama: json["nama"],
        warna: json["warna"],
        harga: json["harga"],
        image: json["image"],
      );

  Map<String, dynamic> toJson() => {
        "nama": nama,
        "warna": warna,
        "harga": harga,
        "image": image,
      };
}
