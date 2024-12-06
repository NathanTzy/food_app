part of 'pages.dart';

class DetailPage extends StatefulWidget {
  const DetailPage({
    super.key,
    required this.onBackButtonPressed,
    this.transaksi,
  });

  final Function onBackButtonPressed;
  final Transaksi? transaksi;

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  int quantity = 1;
  late double price;

  @override
  void initState() {
    super.initState();
    price = widget.transaksi?.food?.price ?? 0;
  }

  @override
  Widget build(BuildContext context) {
    final totalPrice = price * quantity;
    final priceFormat = NumberFormat.currency(locale: 'id_ID', symbol: 'Rp ');

    return Scaffold(
      body: Stack(
        children: [
          Container(
            color: Colors.amber,
            height: 200,
          ),
          SafeArea(
            child: Container(
              color: Colors.white,
            ),
          ),
          SafeArea(
            child: Container(
              width: double.infinity,
              height: 250,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: NetworkImage(widget.transaksi?.food?.img ??
                          'https://ui-avatars.com/api/?name=${widget.transaksi?.food?.name}'),
                      fit: BoxFit.cover)),
            ),
          ),
          SafeArea(
            child: ListView(
              children: [
                Container(
                  height: 100,
                  padding:
                      const EdgeInsets.symmetric(horizontal: defaultMargin),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: GestureDetector(
                      onTap: () {
                        widget.onBackButtonPressed();
                      },
                      child: Container(
                        width: 30,
                        height: 30,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Image.asset('asset/back_arrow_white.png'),
                      ),
                    ),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(top: 110),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 26),
                  decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(40),
                          topRight: Radius.circular(40))),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Column(
                            children: [
                              Text(
                                widget.transaksi?.food?.name ?? '',
                                style: blackFontStyle.copyWith(
                                    fontWeight: FontWeight.w600),
                              ),
                              Ratingstar(
                                rate: widget.transaksi?.food?.rate,
                              ),
                              // Menampilkan badges FoodType
                              const SizedBox(height: 5),
                              Row(
                                children: widget.transaksi?.food?.types != null
                                    ? widget.transaksi!.food!.types!
                                        .map((type) {
                                        return Container(
                                          margin:
                                              const EdgeInsets.only(right: 5),
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 6, vertical: 2),
                                          decoration: BoxDecoration(
                                            color: Colors.orange[400],
                                            borderRadius:
                                                BorderRadius.circular(12),
                                          ),
                                          child: Text(
                                            type
                                                .toString()
                                                .split('.')
                                                .last
                                                .replaceAll('_', ' '),
                                            style: blackFontStyle2.copyWith(
                                              fontSize: 13,
                                              color: Colors.white,
                                            ),
                                          ),
                                        );
                                      }).toList()
                                    : [],
                              ),
                            ],
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      Column(
                        children: [
                          Text(
                            widget.transaksi?.food?.desk ?? '',
                            textAlign: TextAlign.center,
                            style: blackFontStyle3.copyWith(fontSize: 13),
                          ),
                          const SizedBox(
                            height: 30,
                          ),
                          Text(
                            'Ingredients',
                            style: blackFontStyle2.copyWith(
                                fontStyle: FontStyle.italic),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Text(
                            widget.transaksi?.food?.ing ?? '',
                            textAlign: TextAlign.center,
                            style: blackFontStyle3.copyWith(fontSize: 13),
                          ),
                          const SizedBox(
                            height: 30,
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 25,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              GestureDetector(
                                onTap: () {
                                  setState(() {
                                    quantity = max(1, quantity - 1);
                                  });
                                },
                                child: Container(
                                  width: 35,
                                  height: 35,
                                  decoration: const BoxDecoration(
                                      image: DecorationImage(
                                          image:
                                              AssetImage('asset/btn_min.png'))),
                                ),
                              ),
                              SizedBox(
                                width: 45,
                                child: Text(
                                  quantity.toString(),
                                  textAlign: TextAlign.center,
                                  style: blackFontStyle2,
                                ),
                              ),
                              GestureDetector(
                                onTap: () {
                                  setState(() {
                                    quantity = min(999, quantity + 1);
                                  });
                                },
                                child: Container(
                                  width: 35,
                                  height: 35,
                                  decoration: const BoxDecoration(
                                      image: DecorationImage(
                                          image:
                                              AssetImage('asset/btn_add.png'))),
                                ),
                              ),
                            ],
                          ),
                          Container(
                            decoration: BoxDecoration(color: Colors.grey[200]),
                            padding: const EdgeInsets.symmetric(
                                horizontal: 10, vertical: 5),
                            child: Text(priceFormat.format(totalPrice),
                                style: blackFontStyle.copyWith(fontSize: 17)),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.amber,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10))),
                          onPressed: () {
                            Get.to(Paymentpage(
                                transaksi: widget.transaksi!.copyWith(
                                    quantity: quantity,
                                    total: quantity *
                                        (widget.transaksi?.food?.price
                                                ?.toInt() ??
                                            0))));
                          },
                          child: Text(
                            'Order Now',
                            style:
                                blackFontStyle2.copyWith(color: Colors.white),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
