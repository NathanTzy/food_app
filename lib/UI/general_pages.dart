part of 'pages.dart';

class GeneralPages extends StatelessWidget {
  const GeneralPages(
      {super.key,
      this.title = 'Title',
      this.subTitle = 'subtitle',
      this.bgColor,
      this.onBackButtonPressed,
      required this.child});

  final String title;
  final String subTitle;
  final Color? bgColor;
  final Function? onBackButtonPressed;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Container(
            color: Colors.white,
          ),
          SafeArea(
            child: Container(
              color: bgColor ?? Colors.white,
            ),
          ),
          SafeArea(
            child: ListView(
              children: <Widget>[
                Column(
                  children: [
                    Container(
                      width: double.infinity,
                      height: 10,
                      color: const Color.fromARGB(255, 255, 255, 255),
                    ),
                    Row(
                      children: [
                        onBackButtonPressed != null
                            ? GestureDetector(
                                onTap: () {
                                  if (onBackButtonPressed != null) {
                                    onBackButtonPressed!();
                                  }
                                },
                                child: Container(
                                  width: defaultMargin,
                                  height: defaultMargin,
                                  margin: const EdgeInsets.only(
                                      right: 15, left: 10),
                                  decoration: const BoxDecoration(
                                      image: DecorationImage(
                                          image: AssetImage(
                                              'asset/back_arrow.png'))),
                                ),
                              )
                            : const SizedBox(),
                        Padding(
                          padding: const EdgeInsets.only(left: 15),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                title,
                                style: blackFontStyle,
                              ),
                              Text(
                                subTitle,
                                style: greyFontStyle,
                              )
                            ],
                          ),
                        ),
                      ],
                    )
                  ],
                ),
                Container(
                  height: defaultMargin,
                  width: defaultMargin,
                  color: 'FAFAFC'.toColor(),
                ),
                child ?? const SizedBox(),
              ],
            ),
          )
        ],
      ),
    );
  }
}
