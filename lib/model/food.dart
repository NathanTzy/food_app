part of 'models.dart';

enum FoodType { new_food, popular, recommended }

class Food extends Equatable {
  final int? id;
  final String? name;
  final String? img;
  final String? desk;
  final double? price;
  final double? rate;
  final String? ing;
  final List<FoodType>? types;

  const Food({
    this.id,
    this.name,
    this.img,
    this.desk,
    this.price,
    this.rate,
    this.ing,
    this.types,
  });

  @override
  List<Object?> get props => [id, name, img, desk, price, rate, ing, types];
}

List<Food> mockFoods = [
  Food(
      types: [FoodType.new_food, FoodType.recommended],
      id: 1,
      img:
          'https://i.pinimg.com/236x/5b/f2/7e/5bf27e721ed7bc858e0a7f0d905632e8.jpg',
      name: 'Sate Sayur Sultan',
      desk:
          'Sate Sayur Sultan adalah menu sate vegan paling terkenal di Jakarta. Sate ini dibuat dari berbagai macam bahan berkualitas terbaik dan langsung dibuat oleh chef handal. Sate ini sangat sehat dan bergizi.',
      price: 15000, // Harga diubah
      rate: 4.2,
      ing:
          'Tahu, tempe, wortel, jamur, kecap manis, bumbu kacang, bawang putih, cabai, garam'),
  Food(
      types: [FoodType.popular],
      id: 2,
      img:
          'https://i.pinimg.com/236x/e4/c8/ac/e4c8ac48c71738d0493b6e824f0094ed.jpg',
      name: 'Nasi Goreng Kambing',
      desk:
          'Nasi Goreng Kambing spesial dengan bumbu rempah rahasia yang kaya akan cita rasa. Cocok untuk Anda yang menggemari makanan gurih dan pedas.',
      price: 20000, // Harga diubah
      rate: 4.5,
      ing:
          'Daging kambing, nasi putih, bawang merah, bawang putih, kecap manis, minyak samin, kunyit, cabai merah, garam'),
  Food(
      types: [FoodType.recommended],
      id: 3,
      img:
          'https://i.pinimg.com/236x/1a/b7/ee/1ab7ee51c29e366c9c47311773c09dde.jpg',
      name: 'Mie Ayam Jamur',
      desk:
          'Mie Ayam Jamur dengan topping ayam yang empuk dan jamur yang segar, disajikan dengan kuah kaldu yang lezat.',
      price: 18000, // Harga diubah
      rate: 4.7,
      ing:
          'Mie telur, daging ayam, jamur, kecap asin, kecap manis, kaldu ayam, bawang putih, bawang goreng, sawi hijau'),
  Food(
      types: [FoodType.popular],
      id: 4,
      img:
          'https://i.pinimg.com/236x/80/a9/1a/80a91a42cea42a2dcda727a48847642c.jpg',
      name: 'Bakso Beranak',
      desk:
          'Bakso Beranak dengan ukuran jumbo berisi bakso kecil di dalamnya. Sangat cocok untuk pecinta makanan berkuah.',
      price: 25000, // Harga diubah
      rate: 4.3,
      ing:
          'Daging sapi giling, tepung kanji, bawang putih, merica, garam, telur, air kaldu, bakso kecil'),
  Food(
      types: [FoodType.recommended],
      id: 5,
      img:
          'https://i.pinimg.com/236x/20/80/e0/2080e0aeb6d1d9c91b990892dcbbb455.jpg',
      name: 'Ayam Bakar Taliwang',
      desk:
          'Ayam Bakar khas Lombok dengan bumbu pedas dan gurih, disajikan dengan plecing kangkung dan sambal terasi.',
      price: 30000, // Harga diubah
      rate: 4.8,
      ing:
          'Ayam kampung, cabai merah, cabai rawit, bawang merah, bawang putih, terasi, jeruk limau, garam, kecap manis'),
  Food(
      types: [FoodType.new_food],
      id: 6,
      img:
          'https://i.pinimg.com/236x/6f/b7/f9/6fb7f9d36a80ee104e5a417ec2287b15.jpg',
      name: 'Gado-Gado Jakarta',
      desk:
          'Gado-Gado dengan sayuran segar, tahu, tempe, dan lontong, disiram saus kacang kental yang gurih.',
      price: 12000, // Harga diubah
      rate: 4.6,
      ing:
          'Tahu, tempe, lontong, kentang, tauge, bayam, kacang panjang, kacang tanah, cabai, gula merah, bawang putih'),
  Food(
      types: [FoodType.new_food],
      id: 7,
      img:
          'https://i.pinimg.com/236x/6e/35/3d/6e353dfdcef71ce2f3dfe363390cb6b4.jpg',
      name: 'Es Cendol Durian',
      desk:
          'Minuman es cendol dengan topping buah durian yang manis dan creamy, cocok untuk menghilangkan dahaga.',
      price: 22000, // Harga diubah
      rate: 4.4,
      ing:
          'Cendol, gula merah, santan, durian, es serut, air, daun pandan, tepung beras'),
];
