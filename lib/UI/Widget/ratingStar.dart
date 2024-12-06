part of 'widget.dart';

class Ratingstar extends StatelessWidget {
  const Ratingstar({super.key, this.rate});

  final double? rate;

  @override
  Widget build(BuildContext context) {
    int numOfStar = rate!.round(); // Handle null rate safely

    return Row(
        children: List<Widget>.generate(
              5,
              (index) => Icon(
                (index < numOfStar) ? MdiIcons.star : MdiIcons.starOutline,
                size: 14,
                color: Colors.amber,
              ),
            ) +
            [
              const SizedBox(
                width: 4,
              ),
              Text(
                rate.toString(),
                style: greyFontStyle,
              )
            ]);
  }
}
