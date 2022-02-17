import 'package:flutter/material.dart';

class Product {
  final String image, title, description;
  final int price, size, id;
  final Color color;
  Product({
    this.id,
    this.image,
    this.title,
    this.price,
    this.description,
    this.size,
    this.color,
  });
}

List<Product> products = [
  Product(
      id: 1,
      title: "ATK",
      price: 75,
      size: 12,
      description: dummyText1,
      image: "assets/images/bag_1.png",
      color: Color(0xFF3D82AE)),
  Product(
      id: 2,
      title: "Face mask",
      price: 25,
      size: 8,
      description: dummyText2,
      image: "assets/images/bag_2.png",
      color: Color(0xFF80D8FF)),
  Product(
      id: 3,
      title: "Vitamin",
      price: 150,
      size: 15,
      description: dummyText3,
      image: "assets/images/bag_3.png",
      color: Color(0xFFFF9800)),
  Product(
      id: 4,
      title: "Collagen",
      price: 199,
      size: 11,
      description: dummyText4,
      image: "assets/images/bag_4.png",
      color: Color(0xFFFBC02D)),
  Product(
      id: 5,
      title: "Haemovit",
      price: 120,
      size: 12,
      description: dummyText5,
      image: "assets/images/bag_5.png",
      color: Color(0xFFE57373)),
  Product(
    id: 6,
    title: "Crutches",
    price: 499,
    size: 12,
    description: dummyText6,
    image: "assets/images/bag_6.png",
    color: Color(0xFFBCAAA4),
  ),
];

String dummyText1 =
    "There are two types of covid-19 detectors, which are home use that can be checked by yourself and professional use that requires a nasal swab to be examined by medical personnel. There are two types of ATK test results: positive (infected) and negative (non-infectious).";
String dummyText2 =
    "The role of the mask is to protect the wearer from exposure to the droplets of mucus which may be infected and to prevent the wearing of the patient from spreading the infection.";
String dummyText3 =
    "It is vitamin C obtained from natural sources. Mix rosehip and acerola. Suitable for people who lack vitamin C.";
String dummyText4 =
    "Collagen nourishes and restores knee joints, skin, nails, and hair";
String dummyText5 =
    "Iron tonic, vitamins B1, B6 and B12., which have an effect in the treatment of anemia. Due to lack of iron, it is used to nourish the body.";
String dummyText6 =
    "It is a walking aid that shifts the weight from the legs to the upper body. It is an essential equipment for those who are unable to walk with full weight. or unable to walk with weight may be used for a short period of time during injuries such as broken leg bones, sprained ankles";

