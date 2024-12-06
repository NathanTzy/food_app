part of 'widget.dart';

class Tablayout extends StatelessWidget {
  const Tablayout({
    super.key,
    required this.selectedIndex,
    required this.titles,
    this.onTap,
  });

  final int selectedIndex;
  final List<String> titles;
  final Function(int index)? onTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 16), // Adjust height as needed
      color: Colors.white,
      child: Column(
        children: [
          Row(
            mainAxisAlignment:
                MainAxisAlignment.spaceEvenly, // Distribute evenly
            children: titles.map((e) {
              final index = titles.indexOf(e);
              return Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  GestureDetector(
                    onTap: () {
                      if (onTap != null) {
                        onTap!(index);
                      }
                    },
                    child: Column(
                      children: [
                        Text(
                          e,
                          style: (index == selectedIndex)
                              ? blackFontStyle2
                              : greyFontStyle,
                        ),
                        const SizedBox(height: 4),
                        Container(
                          width: 40,
                          height: 3,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: (index == selectedIndex)
                                ? Colors.black
                                : Colors.transparent,
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              );
            }).toList(),
          ),
        ],
      ),
    );
  }
}
