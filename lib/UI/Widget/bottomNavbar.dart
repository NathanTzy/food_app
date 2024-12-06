part of "widget.dart";

class Bottomnavbar extends StatelessWidget {
  const Bottomnavbar({super.key, this.OnTap, required this.selectedIndex});

  final int selectedIndex;
  final Function(int index)? OnTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      width: double.infinity,
      decoration:
          BoxDecoration(color: const Color.fromARGB(255, 255, 255, 255), boxShadow: [
        BoxShadow(
            color: Colors.black.withOpacity(0.1),
            spreadRadius: 3,
            blurRadius: 7,
            offset: const Offset(2, -1))
      ]),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          GestureDetector(
            onTap: () {
              if (OnTap != null) {
                OnTap!(0);
              }
            },
            child: Container(
              height: 32,
              width: 32,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage('asset/ic_home${selectedIndex == 0 ? '.png' : '_normal.png'}'),
                      fit: BoxFit.contain)),
            ),
          ),
          GestureDetector(
            onTap: () {
              if (OnTap != null) {
                OnTap!(1);
              }
            },
            child: Container(
              height: 32,
              width: 32,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage('asset/ic_order${selectedIndex == 1 ? '.png' : '_normal.png'}'),
                      fit: BoxFit.contain)),
            ),
          ),
          GestureDetector(
            onTap: () {
              if (OnTap != null) {
                OnTap!(2);
              }
            },
            child: Container(
              height: 32,
              width: 32,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage('asset/ic_profile${selectedIndex == 2 ? '.png' : '_normal.png'}'),
                      fit: BoxFit.contain)),
            ),
          ),
        ],
      ),
    );
  }
}
