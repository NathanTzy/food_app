part of 'widget.dart';

class Foodlist extends StatelessWidget {
  const Foodlist({
    super.key,
    required this.food,
    required this.itemWidth,
  });

  final Food food;
  final double itemWidth;

  @override
  Widget build(BuildContext context) {
    return Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
      //gambar
      Container(
        height: 80,
        width: 80,
        margin: EdgeInsets.only(right: 5),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          image: DecorationImage(
            image: NetworkImage(
                food?.img ?? 'https://ui-avatars.com/api/?name=${food?.name}'),
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
              food?.name ?? 'No Name',
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
            // Display FoodType
            SizedBox(
              height: 5,
            ),
            Row(
              children: food.types!.map((type) {
                return Container(
                  margin: EdgeInsets.only(right: 5),
                  padding: EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                  decoration: BoxDecoration(
                    color: Colors.orange[400],
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Text(
                    type.toString().split('.').last.replaceAll('_', ' '),
                    style: blackFontStyle2.copyWith(
                      fontSize: 10,
                      color: const Color.fromARGB(255, 255, 255, 255),
                    ),
                  ),
                );
              }).toList(),
            )
          ],
        ),
      ),

      SizedBox(
        width: 110,
        child: Row(
          children: [
            Ratingstar(
              rate: food?.rate,
            )
          ],
        ),
      )
      //waktu dan status pengiriman
    ]);
  }
}
