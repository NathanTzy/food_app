part of 'pages.dart';

class FoodPage extends StatefulWidget {
  const FoodPage({super.key});

  @override
  State<FoodPage> createState() => _FoodPageState();
}

class _FoodPageState extends State<FoodPage> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    double listItemWidth =
        MediaQuery.of(context).size.width - 2 * defaultMargin;
    return ListView(
      children: [
        //   Header
        Container(
          color: Colors.white,
          height: 100,
          width: double.infinity,
          padding: const EdgeInsets.symmetric(horizontal: defaultMargin),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Food Market",
                    style: blackFontStyle,
                  ),
                  Text(
                    "Let's get some food!",
                    style: blackFontStyle2,
                  )
                ],
              ),
              Container(
                  width: 50,
                  height: 50,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    image: DecorationImage(
                      image: NetworkImage(
                        (context.read<UserCubit>().state as UserLoaded)
                                .user
                                .imgUser ??
                            'https://ui-avatars.com/api/?name=Elon+Musk',
                      ),
                      fit: BoxFit.cover,
                    ),
                  ))
            ],
          ),
        ),
        //   card food
        Container(
          height: 220,
          width: double.infinity,
          margin: const EdgeInsets.symmetric(vertical: defaultMargin),
          child: BlocBuilder<FoodCubit, FoodState>(
            builder: (_, State) => (State is FoodLoaded)
                ? ListView(
                    scrollDirection: Axis.horizontal,
                    children: mockFoods
                        .map((food) => Padding(
                              padding: EdgeInsets.only(
                                  left: (food == mockFoods.first)
                                      ? defaultMargin
                                      : 0,
                                  right: defaultMargin),
                              child: GestureDetector(
                                onTap: () {
                                  Get.to(DetailPage(
                                    onBackButtonPressed: () {
                                      Get.back();
                                    },
                                    transaksi: Transaksi(
                                        food: food,
                                        user: (context.read<UserCubit>().state
                                                as UserLoaded)
                                            .user),
                                  ));
                                },
                                child: Foodcard(
                                  food: food,
                                ),
                              ),
                            ))
                        .toList(),
                  )
                : Center(),
          ),
        ),
        Container(
          color: Colors.white,
          width: double.infinity,
          child: Column(
            children: [
              Tablayout(
                selectedIndex: selectedIndex,
                titles: const ['New Taste', 'Popular', 'Recommended'],
                onTap: (index) {
                  setState(() {
                    selectedIndex = index;
                  });
                },
              ),
              const SizedBox(
                height: 20,
              ),
              BlocBuilder<FoodCubit, FoodState>(
                builder: (_, state) {
                  if (state is FoodLoaded) {
                    List<Food> foods = state.foods
                        .where((foodType) => foodType.types!.contains(
                              (selectedIndex == 0)
                                  ? FoodType.new_food
                                  : (selectedIndex == 1)
                                      ? FoodType.popular
                                      : FoodType.recommended,
                            ))
                        .toList();

                    return Column(
                      children: foods
                          .map(
                            (foodType) => Padding(
                              padding: const EdgeInsets.all(8),
                              child: GestureDetector(
                                onTap: () {
                                  Get.to(DetailPage(
                                    onBackButtonPressed: () {
                                      Get.back();
                                    },
                                    transaksi: Transaksi(
                                      food:
                                          foodType, 
                                      user: (context.read<UserCubit>().state
                                              as UserLoaded)
                                          .user,
                                    ),
                                  ));
                                },
                                child: Foodlist(
                                  food: foodType,
                                  itemWidth: listItemWidth,
                                ),
                              ),
                            ),
                          )
                          .toList(),
                    );
                  } else {
                    return Center(
                      child: loadingIndicator,
                    );
                  }
                },
              ),
              const SizedBox(
                height: 90,
              ),
            ],
          ),
        )
      ],
    );
  }
}
