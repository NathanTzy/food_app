part of 'pages.dart';

class Paymentpage extends StatefulWidget {
  const Paymentpage({super.key, required this.transaksi, this.user});
  final Transaksi transaksi;
  final User? user;

  @override
  State<Paymentpage> createState() => _PaymentpageState();
}

class _PaymentpageState extends State<Paymentpage> {
  bool isLoading = false; // Moved to class level

  @override
  Widget build(BuildContext context) {
    // Perhitungan subtotal, pajak, dan ongkos kirim
    double subtotal =
        widget.transaksi.food!.price! * widget.transaksi.quantity!;
    double tax = subtotal * 0.1;
    double driverCost = 20000;
    double total = subtotal + tax + driverCost;

    return GeneralPages(
      title: 'Payment',
      subTitle: 'Taste The Original',
      onBackButtonPressed: () {
        Get.back();
      },
      child: Column(
        children: <Widget>[
          Container(
            margin: const EdgeInsets.symmetric(
                horizontal: defaultMargin, vertical: 15),
            color: Colors.white,
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                // Item Order Title
                Text(
                  'Item Order',
                  style: blackFontStyle,
                ),
                const SizedBox(height: 12),

                // Food Item Row
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    // Food Image
                    Container(
                      width: 60,
                      height: 50,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        image: DecorationImage(
                          image: NetworkImage(widget.transaksi.food!.img!),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    const SizedBox(width: 12),

                    // Food Name & Price
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            widget.transaksi.food!.name!,
                            style: blackFontStyle2,
                            overflow: TextOverflow.ellipsis,
                          ),
                          const SizedBox(height: 4),
                          Text(
                            NumberFormat.currency(
                              symbol: 'IDR ',
                              locale: 'id_ID',
                              decimalDigits: 0,
                            ).format(widget.transaksi.food!.price),
                            style: blackFontStyle3.copyWith(
                                color: Colors.grey, fontSize: 13),
                          ),
                        ],
                      ),
                    ),

                    // Quantity Info
                    Text(
                      '${widget.transaksi.quantity} Items',
                      style: blackFontStyle3,
                    ),
                  ],
                ),

                // Divider Line
                const SizedBox(height: 12),
                const Divider(thickness: 1),

                // Detail Transaction Title
                Text(
                  'Detail Transaction',
                  style: blackFontStyle2,
                ),
                const SizedBox(height: 12),

                // Transaction Details
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(widget.transaksi.food!.name!),
                    Text(
                      NumberFormat.currency(
                        symbol: 'IDR ',
                        locale: 'id_ID',
                        decimalDigits: 0,
                      ).format(widget.transaksi.food!.price),
                    ),
                  ],
                ),
                const SizedBox(height: 10),

                // Quantity
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text('Quantity'),
                    Text('${widget.transaksi.quantity} Items'),
                  ],
                ),

                // Tax
                const SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text('Tax'),
                    Text(
                      NumberFormat.currency(
                        symbol: 'IDR ',
                        locale: 'id_ID',
                        decimalDigits: 0,
                      ).format(tax),
                    ),
                  ],
                ),

                // Driver Cost
                const SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text('Driver'),
                    Text(
                      NumberFormat.currency(
                        symbol: 'IDR ',
                        locale: 'id_ID',
                        decimalDigits: 0,
                      ).format(driverCost),
                    ),
                  ],
                ),

                // SubTotal & Total
                const SizedBox(height: 12),
                const Divider(thickness: 1),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text('SubTotal'),
                    Text(
                      NumberFormat.currency(
                        symbol: 'IDR ',
                        locale: 'id_ID',
                        decimalDigits: 0,
                      ).format(subtotal),
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Total',
                      style: blackFontStyle2,
                    ),
                    Text(
                      NumberFormat.currency(
                        symbol: 'IDR ',
                        locale: 'id_ID',
                        decimalDigits: 0,
                      ).format(total),
                    ),
                  ],
                ),

                // Delivery Details
                const SizedBox(height: 20),
                const Divider(thickness: 1),
                Text(
                  'Delivered to',
                  style: blackFontStyle3,
                ),
                const SizedBox(height: 12),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text('Name'),
                    Text(widget.transaksi.user?.name ?? '-'),
                  ],
                ),
                const SizedBox(height: 12),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text('Address'),
                    Text(widget.transaksi.user?.address ?? '-'),
                  ],
                ),
                const SizedBox(height: 12),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text('Email'),
                    Text(widget.transaksi.user?.email ?? '-'),
                  ],
                ),
                const SizedBox(height: 12),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text('City'),
                    Text(widget.transaksi.user?.city ?? '-'),
                  ],
                ),

                // Purchase Button
                const SizedBox(height: 20),
                Container(
                  width: double.infinity,
                  margin: const EdgeInsets.only(top: 12),
                  height: 45,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.black, // Background hitam
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10), // Radius 10
                      ),
                    ),
                    onPressed: isLoading
                        ? null
                        : () async {
                            // Handle loading state
                            setState(() {
                              isLoading = true;
                            });
                            bool result = await context
                                .read<TransaksiCubit>()
                                .submitTransaction(
                                  widget.transaksi.copyWith(
                                    dateTime: DateTime.now(),
                                    total: (widget.transaksi.total! * 1.1)
                                            .toInt() +
                                        20000,
                                  ),
                                );

                            if (result) {
                              Get.to(SuccessOrder(
                                transaksi: widget.transaksi,
                              ));
                            } else {
                              Get.snackbar('', '',
                                  backgroundColor: 'D9435E'.toColor(),
                                  icon: Icon(MdiIcons.closeCircleOutline),
                                  titleText: Text(
                                    'SignIn Failed',
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontFamily:
                                            GoogleFonts.poppins().toString(),
                                        fontSize: 20),
                                  ),
                                  messageText: Text(
                                    'Please try again later...',
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontFamily:
                                            GoogleFonts.poppins().toString()),
                                  ));
                            }
                            setState(() {
                              isLoading = false; // Reset loading state
                            });
                          },
                    child: isLoading
                        ? CircularProgressIndicator(
                            color: Colors.white) // Show loader
                        : Text(
                            'Purchase',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
