part of 'widget.dart';

class Foodcard extends StatelessWidget {
  const Foodcard({super.key, this.food});
  final Food? food;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        height: 220,
        width: 200,
        decoration: BoxDecoration(
            color: Colors.white, borderRadius: BorderRadius.circular(10)),
        child: Column(
          children: [
            Container(
              height: 140,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: NetworkImage(food?.img ?? ''), fit: BoxFit.cover),
                  borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(10),
                      topRight: Radius.circular(10))),
            ),
            Container(
              margin: const EdgeInsets.fromLTRB(12, 12, 12, 6),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    food?.name ?? 'empty',
                    style: const TextStyle(fontSize: 20),
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                  ),
                  Ratingstar(
                    rate: food?.rate,
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
