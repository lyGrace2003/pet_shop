import 'dart:math';

import 'package:flutter/material.dart';

import '../model/cat_info_model.dart';

final List<Cat> initialData = [
  Cat(
    breed: "Persian", 
    location: "Canada", 
    color: "Light grey",
    price: 85, 
    weight: 2.4, 
    height: 22, 
    desc: "The Persian cat, with their luxurious long fur and distinctive appearance, is a breed known for elegance and a regal demeanor. Originating in Persia (modern-day Iran), these cats have a distinctive round face, flat nose, and large, expressive eyes.",
    image: "assets/persian.jpg"
    ),
  Cat(
    breed: "Sphynx", 
    location: "Canada", 
    color: "Dark pink", 
    price: 60, 
    weight: 3.5, 
    height: 22, 
    desc: "The Sphynx cat, hairless and charming, boasts a velvety skin in various colors and patterns. Playful and affectionate, they capture hearts with their unique appearance and lively personalities.",
    image: "assets/Sphynx.jpg"
    ),
    Cat(
    breed: "Bengal", 
    location: "Canada", 
    color: "Brown", 
    price: 90, 
    weight: 3.5, 
    height: 22, 
    desc: "The Bengal cat is a hybrid breed that was created by crossing a domestic cat with an Asian Leopard Cat. These cats are known for their wild appearance, with their spotted or marbled coats and their muscular bodies.",
    image: "assets/bengal.jpg"
    ),
    Cat(
    breed: "Abyssinian", 
    location: "Canada", 
    color: "Brown", 
    price: 75, 
    weight: 4.0, 
    height: 30, 
    desc: "The Abyssinian cat, also called the “Aby” by affectionate admirers, is a truly remarkable breed known for their striking appearance, lively personality, and fascinating history.",
    image: "assets/abyssinian.jpg"
    ),
    Cat(
    breed: "Burmese", 
    location: "Canada", 
    color: "Dark brown", 
    price: 75, 
    weight: 2.6, 
    height: 20, 
    desc: "The Burmese cat, often referred to as the “Burmese,” is a distinctive and popular breed known for its striking appearance, affectionate nature, and engaging personality.",
    image: "assets/burmese.jpg"
    ),
    Cat(
    breed: "Russian Blue", 
    location: "Canada", 
    color: "Grey", 
    price: 60, 
    weight: 3.4, 
    height: 22, 
    desc: "The Russian Blue's elegant yet muscular body led one cat judge to declare him the “Doberman Pinscher of cats.” With their striking appearance and enchanting personalities, these cats have captured the hearts of cat lovers worldwide.",
    image: "assets/russian_blue.jpg"
    ),
    Cat(
    breed: "American Wirehair", 
    location: "Canada", 
    color: "White and Orange", 
    price: 80, 
    weight: 3.0, 
    height: 23, 
    desc: "The American Wirehair cat, with its distinctive and charming appearance, is a unique and relatively rare breed that captures the hearts of cat enthusiasts worldwide.",
    image: "assets/american_wirehair.jpg"
    ),
    Cat(
    breed: "Tonkinese", 
    location: "Canada", 
    color: "Brown and Cream", 
    price: 95, 
    weight: 3.5, 
    height: 22, 
    desc: "Tonkinese cats are a charming breed known for their distinctive appearance and engaging personalities. Originating from the crossbreeding of Siamese and Burmese cats, they boast a unique coat that typically combines the sable's warmth with the Siamese's color points.",
    image: "assets/tonkinese.jpg"
    ),
    Cat(
    breed: "Desert Lynx", 
    location: "Canada", 
    color: "Light Grey", 
    price: 87, 
    weight: 3.4, 
    height: 22, 
    desc: "The Desert Lynx is a mixed breed cat, resulting from the combination of a number of other breeds including the American Lynx, Maine Coon, Pixie Bob, and possibly even the Bobcat. These felines are known for being outgoing, playful, and social.",
    image: "assets/desert_lynx.jpg"
    ),
    Cat(
    breed: "Norwegian Forest", 
    location: "Canada", 
    color: "Calico", 
    price: 78, 
    weight: 3.4, 
    height: 22, 
    desc: "The Norwegian Forest cat (also known as the Skogkatt or Wegie) is a large, long-haired cat breed that is native to Norway. They are known for their thick, double coat that helps them to withstand the cold winters in Norway.",
    image: "assets/norwegian_forest.jpg"
    ),
];

class CatProvider with ChangeNotifier {
  final List<Cat> _cat = initialData;
  List<Cat> get cat => _cat;
}