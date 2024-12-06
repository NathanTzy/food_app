part of 'widget.dart';

class Profile extends StatefulWidget {
  const Profile({super.key, this.user});
  final User? user;

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  int selectedPage = 0; // Variabel untuk menyimpan indeks tab

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            padding: EdgeInsets.only(top: 10),
            color: Colors.white,
            width: double.infinity,
            child: Column(
              children: [
                Container(
                  width: 100,
                  height: 100,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    image: DecorationImage(
                      image: NetworkImage(widget.user?.imgUser ??
                          "https://via.placeholder.com/150"),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                SizedBox(height: 16),
                Text(
                  widget.user?.name ?? 'No Name',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                Text(
                  widget.user?.email ?? 'No Email',
                  style: TextStyle(fontSize: 16, color: Colors.grey),
                ),
                SizedBox(height: 18),
              ],
            ),
          ),
          SizedBox(height: 20),
          Tablayout(
            selectedIndex: selectedPage,
            titles: ['Account', 'Food Market'],
            onTap: (index) {
              setState(() {
                selectedPage = index; // Update indeks tab yang dipilih
              });
            },
          ),
          Container(
            color: Colors.white,
            // Menghapus Expanded
            child: Expanded(
              child: selectedPage == 0
                  ? Padding(
                      padding: const EdgeInsets.all(20),
                      child: ListView(
                        shrinkWrap:
                            true, // Menambahkan shrinkWrap untuk membatasi tinggi
                        children: [
                          _buildOptionRow('Edit Profile'),
                          _buildOptionRow('Home Address'),
                          _buildOptionRow('Security'),
                          _buildOptionRow('Payments'),
                          _buildOptionRow('Sign Out'),
                        ],
                      ),
                    )
                  : Center(
                      child: Padding(
                      padding: const EdgeInsets.all(20),
                      child: ListView(
                        shrinkWrap: true, // Menambahkan shrinkWrap di sini juga
                        children: [
                          _buildOptionRow('Rate App'),
                          _buildOptionRow('Help Center'),
                          _buildOptionRow('Policy & privacy'),
                          _buildOptionRow('Terms & conditions'),
                        ],
                      ),
                    )),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildOptionRow(String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10), // Jarak antar baris
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(title),
          Icon(MdiIcons.menuRight),
        ],
      ),
    );
  }
}
