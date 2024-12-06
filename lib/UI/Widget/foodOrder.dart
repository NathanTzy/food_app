part of 'widget.dart';

class Foodorder extends StatelessWidget {
  const Foodorder({super.key, this.food, required this.itemWidth});
  final Food? food;
  final double itemWidth;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          height: 80,
          width: 80,
          margin: const EdgeInsets.only(right: 13),
          decoration: BoxDecoration(
            borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(10), bottomLeft: Radius.circular(10)),
            image: DecorationImage(
              image: NetworkImage(food?.img ??
                  'https://ui-avatars.com/api/?name=${food?.name}'),
              fit: BoxFit.cover,
            ),
          ),
        ),
        SizedBox(
          width: itemWidth! - 182,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start, // Added for alignment
            children: [
              Text(
                food?.name ?? 'no name',
                style: blackFontStyle2,
                overflow: TextOverflow.ellipsis,
                maxLines: 1,
              ),
              Text(
                NumberFormat.currency(
                        symbol: 'IDR ', decimalDigits: 0, locale: 'id-ID')
                    .format(food?.price ?? 0),
                style: greyFontStyle,
              ),
            ],
          ),
        ),
        Ratingstar(
          rate: food!.rate,
        )
      ],
    );
  }
}
