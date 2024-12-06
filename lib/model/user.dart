part of 'models.dart';

class User extends Equatable {
  final int? id;
  final String? name;
  final String? email;
  final String? address;
  final String? city;
  final String? imgUser;

  const User({
    this.id,
    this.name,
    this.email,
    this.address,
    this.city,
    this.imgUser,
  });

  @override
  List<Object?> get props => [id, name, email, address, city, imgUser];
}

// Mock user data
User mockUser = User(
  id: 1,
  name: "Natzi Ganteng",
  email: "Natz@jimel.com",
  address: "123 Main St",
  city: "New York",
  imgUser:
      "https://i.pinimg.com/736x/7d/a7/c5/7da7c50476489b4663b8040b6943baca.jpg",
);
