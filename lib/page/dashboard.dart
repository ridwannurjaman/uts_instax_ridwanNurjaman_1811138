part of 'pages.dart';

class Dashboard extends StatefulWidget {
  Dashboard({Key? key}) : super(key: key);

  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  List<ModelProduk> data = [];
  List<ModelProduk> dataSearch = [];

  @override
  void initState() {
    data = [
      ModelProduk(
          nama: "Mint",
          warna: Color(0xff70b1a1),
          harga: "50.00",
          image: 'assets/InstaxMini7plus_Mint_R.png'),
      ModelProduk(
          nama: "Blue",
          warna: Color(0xff77a0c6),
          harga: "53.00",
          image: 'assets/InstaxMini7plus_Blue_R.png'),
      ModelProduk(
          nama: "Choral",
          warna: Color(0xffb0463c),
          harga: "49.00",
          image: 'assets/InstaxMini7plus_Choral_R.png'),
      ModelProduk(
          nama: "Lavender",
          warna: Color(0xff855f8c),
          harga: "55.00",
          image: 'assets/InstaxMini7plus_Lavender_R.png'),
      ModelProduk(
          nama: "Pink",
          warna: Color(0xffcf9496),
          harga: "50.00",
          image: 'assets/InstaxMini7plus_Pink_R.png'),
    ];

    dataSearch = data;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(color: Colors.black),
        title: Image.asset('assets/fujifilm-banner.png', height: 20),
        leading: IconButton(
          onPressed: () {},
          icon: Icon(Icons.menu),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.shopping_bag),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.all(10),
          child: Column(
            children: [
              TextField(
                style: TextStyle(color: Colors.white),
                onChanged: (text) {
                  text = text.toLowerCase();
                  setState(() {
                    data = dataSearch.where((val) {
                      var cariNama = val.nama.toLowerCase();
                      return cariNama.contains(text);
                    }).toList();
                  });
                },
                decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                    filled: true,
                    hintStyle: TextStyle(color: Colors.white),
                    hintText: "Search",
                    fillColor: Colors.black),
              ),
              ListView.builder(
                physics: const NeverScrollableScrollPhysics(),
                scrollDirection: Axis.vertical,
                shrinkWrap: true,
                itemCount: data.length,
                itemBuilder: (BuildContext context, int index) {
                  return CardProduk(
                    data[index],
                  );
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
