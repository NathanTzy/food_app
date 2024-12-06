part of 'widget.dart';

class OrderListItem extends StatelessWidget {
  const OrderListItem({
    super.key,
    required this.transaction,
    required this.itemWidth,
  });

  final Transaksi transaction;
  final double itemWidth;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        //gambar
        Container(
          height: 80,
          width: 80,
          margin: EdgeInsets.only(right: 5),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            image: DecorationImage(
              image: NetworkImage(transaction.food?.img ??
                  'https://ui-avatars.com/api/?name=${transaction.food?.name}'),
              fit: BoxFit.cover,
            ),
          ),
        ),
        //quantity dan harga total
        SizedBox(
          width: itemWidth! - 182, //(80 + 12 + 90)
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                transaction.food?.name ?? 'No Name',
                style: blackFontStyle2,
                overflow: TextOverflow.ellipsis,
                maxLines: 1,
              ),
              Row(
                children: [
                  Text(transaction.quantity.toString() + ' item(s) ~ '),
                  Text(
                    NumberFormat.currency(
                      symbol: 'IDR',
                      decimalDigits: 0,
                      locale: 'id-ID',
                    ).format(transaction.total),
                  ),
                ],
              ),
            ],
          ),
        ),
        //waktu dan status pengiriman
        Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Text(
              convertDateDisplay(transaction.dateTime!),
              style: greyFontStyle,
            ),
            (transaction.status == TransactionStatus.delivered)
                ? Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.green),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: [
                          Text(
                            'Delivered',
                            style: blackFontStyle3.copyWith(
                              color: Colors.white,
                              fontSize: 12,
                              letterSpacing: 1.5,
                            ),
                          ),
                          Container(
                            child: Icon(
                              MdiIcons.checkCircle,
                              color: Colors.white,
                              size: 12,
                            ),
                          )
                        ],
                      ),
                    ),
                  )
                : (transaction.status == TransactionStatus.canceled)
                    ? Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.red),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            children: [
                              Text(
                                'Canceled',
                                style: blackFontStyle3.copyWith(
                                  color: Colors.white,
                                  fontSize: 12,
                                  letterSpacing: 1.5,
                                ),
                              ),
                              Container(
                                child: Icon(
                                  MdiIcons.checkCircle,
                                  color: Colors.white,
                                  size: 12,
                                ),
                              )
                            ],
                          ),
                        ),
                      )
                    : (transaction.status == TransactionStatus.pending)
                        ? Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: Colors.amber[800]),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Row(
                                children: [
                                  Text(
                                    'Pending',
                                    style: blackFontStyle3.copyWith(
                                      color: const Color.fromARGB(
                                          255, 255, 255, 255),
                                      fontSize: 12,
                                      letterSpacing: 1.5,
                                    ),
                                  ),
                                  Container(
                                    child: Icon(
                                      MdiIcons.checkCircle,
                                      color: Colors.white,
                                      size: 12,
                                    ),
                                  )
                                ],
                              ),
                            ),
                          )
                        : Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: Colors.blue),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Row(
                                children: [
                                  Text(
                                    'On Delivery',
                                    style: blackFontStyle3.copyWith(
                                      color: Colors.white,
                                      fontSize: 12,
                                      letterSpacing: 1.5,
                                    ),
                                  ),
                                  Container(
                                    child: Icon(
                                      MdiIcons.checkCircle,
                                      color: Colors.white,
                                      size: 12,
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
          ],
        ),
      ],
    );
  }
}
