part of 'pages.dart';

class Orderhistory extends StatefulWidget {
  const Orderhistory({super.key});

  @override
  State<Orderhistory> createState() => _OrderhistoryState();
}

class _OrderhistoryState extends State<Orderhistory> {
  int selectedPage = 0;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TransaksiCubit, TransaksiState>(builder: (_, state) {
      if (state is TransaksiLoaded) {
        if (state.transaksi.isEmpty) {
          return IllustrationPage(
            title: 'Ouch! Hungry',
            subtitle: 'Seems like you have not\nordered any food yet',
            picturePath: 'assets/food_wishes.png',
            buttonTitle1: 'Find Foods',
            buttonTap1: () {},
          );
        } else {
          double listItemWidth =
              MediaQuery.of(context).size.width - 2 * defaultMargin;

          return ListView(
            children: [
              Container(
                width: double.infinity,
                margin: EdgeInsets.only(bottom: defaultMargin),
                padding: EdgeInsets.symmetric(
                  horizontal: defaultMargin,
                  vertical: 15,
                ),
                color: Colors.white,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Your Orders',
                      style: blackFontStyle2,
                    ),
                    Text(
                      'Wait for the best meal',
                      style: blackFontStyle3.copyWith(color: greyColor),
                    ),
                  ],
                ),
              ),
              Container(
                width: double.infinity,
                color: Colors.white,
                child: Column(
                  children: [
                    Tablayout(
                      selectedIndex: selectedPage,
                      titles: ['In Progress', 'Past Orders'],
                      onTap: (index) {
                        setState(() {
                          selectedPage = index;
                        });
                      },
                    ),
                    SizedBox(
                      height: 16,
                    ),
                    Builder(
                      builder: (_) {
                        List<Transaksi> transaksi = (selectedPage == 0
                            ? state.transaksi
                                .where((e) =>
                                    e.status == TransactionStatus.on_delivery ||
                                    e.status == TransactionStatus.delivered ||
                                    e.status == TransactionStatus.pending)
                                .toList()
                            : state.transaksi
                                .where((e) =>
                                    e.status == TransactionStatus.canceled ||
                                    e.status == TransactionStatus.delivered)
                                .toList());
                        return Column(
                          children: transaksi
                              .map((e) => Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: OrderListItem(
                                        transaction: e,
                                        itemWidth: listItemWidth),
                                  ))
                              .toList(),
                        );
                      },
                    )
                  ],
                ),
              ),
            ],
          );
        }
      } else {
        return Center(
          child: loadingIndicator,
        );
      }
    });
  }
}
