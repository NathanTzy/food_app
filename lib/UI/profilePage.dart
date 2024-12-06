part of 'pages.dart';

class Profilepage extends StatelessWidget {
  const Profilepage({super.key});

  @override
  Widget build(BuildContext context) {
    return Profile(
      user: mockUser,
    );
  }
}
