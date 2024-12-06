part of 'pages.dart';

class IllustrationPage extends StatelessWidget {
  const IllustrationPage({
    super.key,
    required this.title,
    required this.subtitle,
    required this.picturePath,
    required this.buttonTitle1,
    this.buttonTitle2,
    required this.buttonTap1,
    this.buttonTap2,
  });

  final String title;
  final String subtitle;
  final String picturePath;

  final String buttonTitle1;
  final String? buttonTitle2;

  final Function buttonTap1;
  final Function? buttonTap2;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              picturePath,
              width: 240,
            ),
            SizedBox(
              height: 15,
            ),
            Padding(
              padding: EdgeInsets.all(8),
              child: Text(
                title,
                style: blackFontStyle.copyWith(
                  fontSize: 20,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 8),
              child: Text(
                subtitle,
                style: greyFontStyle.copyWith(
                  fontSize: 15,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            SizedBox(
              height: 30,
            ),
            ElevatedButton(
              onPressed: () {
                buttonTap1;
              },
              style: ElevatedButton.styleFrom(
                  backgroundColor: defaultColor,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10))),
              child: Text(
                buttonTitle1,
                style: blackFontStyle2.copyWith(
                  color: Colors.white,
                ),
              ),
            ),
            (buttonTap2 == null)
                ? SizedBox()
                : ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10))),
                    onPressed: () {
                      buttonTap2!();
                    },
                    child: Text(buttonTitle2!,
                        style: blackFontStyle2.copyWith(
                            color: const Color.fromARGB(255, 0, 0, 0))),
                  ),
          ],
        ),
      ),
    );
  }
}
