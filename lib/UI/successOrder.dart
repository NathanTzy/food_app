part of 'pages.dart';

class SuccessOrder extends StatelessWidget {
  const SuccessOrder({super.key, required this.transaksi});
  final Transaksi transaksi;
  @override
  Widget build(BuildContext context) {
    return IllustrationPage(
      title: 'Your order for ${transaksi.food!.name} is on the way',
      subtitle: 'Just stay at home while we are\n preparing your best foods',
      picturePath: 'asset/bike.png',
      buttonTitle1: 'Order Other Foods',
      buttonTap1: () {
        Get.offAll(MainPage());
      },
      buttonTitle2: 'View My Order',
      buttonTap2: () {
        Get.offAll(MainPage(
          initialPage: 1,
        ));
      },
    );
  }
}
