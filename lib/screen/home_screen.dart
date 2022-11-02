// ignore_for_file: avoid_print

part of 'screen.dart';
class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String username = "user";
  List<History>? history;
  bool isLoading = false;

  void _showModal(BuildContext context) {
    Navigator.of(context).push(FullScreenSearchModal());
  }

  @override
  void initState() {
    super.initState();
    print('test');

    refreshHistory();
  }

  Future refreshHistory() async {
    setState(() => isLoading = true);

    history = await HistoryDatabase.instance.readAllHistorys();

    setState(() => isLoading = false);
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffF2EBE9),
      body: SafeArea(
      child: isLoading
          ? const CircularProgressIndicator()
          : Column(
          children: [
            //app bar
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      //name
                      Text(
                        'hello, Otaqu',
                        style: GoogleFonts.nunito(
                          fontSize: 28,
                          fontWeight: FontWeight.bold,
                          color: const Color(0xFF4c4c4c),
                        ),
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      Text(
                        'Selamat Datang',
                        style: GoogleFonts.nunito(
                          fontSize: 20,
                          color: const Color(0xFF4c4c4c),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),

            const SizedBox(
              height: 25,
            ),
            Expanded(
              child: Container(
                width: MediaQuery.of(context).size.width,
                padding: const EdgeInsets.all(15),
                height: double.infinity,
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(
                      topRight: Radius.circular(25),
                      topLeft: Radius.circular(25)),
                  color: Color(0xffecedf2),
                ),
                child: SingleChildScrollView(
                  scrollDirection: Axis.vertical,
                  physics: const ClampingScrollPhysics(),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      //card -> hhow do you feel?
                      Container(
                        height: 199,
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: 3,
                          itemBuilder: (context, index) {
                          return Container(
                            margin: const EdgeInsets.only(right: 10),
                            height: 199,
                            width: 330,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(25),
                              color: Colors.blueAccent
                            ),
                            child: GestureDetector(
                              onTap: () {
                                
                              },
                              child: Container(
                                height: 140,
                                width: 210,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(15),
                                    image: const DecorationImage(
                                        image: AssetImage("assets/paket.png"),
                                        fit: BoxFit.cover)),
                                child: Container(
                                  height: 140,
                                  width: 210,
                                  padding: const EdgeInsets.all(16),
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(15),
                                      gradient: LinearGradient(
                                          begin: Alignment.bottomCenter,
                                          end: Alignment.topCenter,
                                          colors: [
                                            Colors.black.withOpacity(0.61),
                                            Colors.black.withOpacity(0)
                                          ])),
                                ),
                              ),
                            )
                          );
                        }),
                      ),
                      const SizedBox(
                        height: 25,
                      ),

                      // search bar
                     Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20.0),
                        child: Container(
                          padding: const EdgeInsets.all(20),
                          decoration: BoxDecoration(
                              color: const Color(0XFFF5F6F8),
                              borderRadius: BorderRadius.circular(12)),
                          child: Row(
                            children: [
                              //animation or p
                              // how do you feel + get started button
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                   Text(
                                      'Kamu lagi mau\nliburan kemana ?',
                                      style: GoogleFonts.nunito(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.black87,
                                      ),
                                    ),
                                    
                                    const SizedBox(
                                      height: 10,
                                    ),
                                     Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 20.0),
                                      child: Container(
                                        padding: const EdgeInsets.all(8),
                                        decoration: BoxDecoration(
                                          color: const Color(0xFFF5F6F8),
                                          borderRadius:
                                              BorderRadius.circular(12),
                                        ),
                                        child: InkWell(
                                          onTap: () {
                                            print('test');
                                            _showModal(context);
                                          },
                                          child: const IgnorePointer(
                                            child: TextField(
                                              decoration: InputDecoration(
                                                prefixIcon: Icon(Icons.search),
                                                border: InputBorder.none,
                                                hintText: '',
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    InkWell(
                                      onTap: () {
                                        
                                      },
                                      child: Container(
                                        padding: const EdgeInsets.all(8.0),
                                        decoration: BoxDecoration(
                                          color: const Color(0XFFFFC90E),
                                          borderRadius:
                                              BorderRadius.circular(12),
                                        ),
                                        child: Center(
                                            child: Text(
                                          'Cari',
                                          style: GoogleFonts.nunito(
                                            fontSize: 16,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.black,
                                          ),
                                        )),
                                      ),
                                    )
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 25,
                      ),

                      //doctor list
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                             Text(
                              'Pencarian terakhir',
                              style: GoogleFonts.nunito(
                                fontWeight: FontWeight.bold,
                                fontSize: 18,
                              ),
                            ),
                            // InkWell(
                            //   onTap: () {},
                            //   child: Text(
                            //     'Lihat semua',
                            //     style: GoogleFonts.nunito(
                            //       fontSize: 15,
                            //     ),
                            //   ),
                            // )
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 25,
                      ),
                      Container(
                        height: 80,
                        child: history!.isEmpty
                                  ? const Text(
                                      'No History',
                                      style: TextStyle(
                                          color: Colors.grey, fontSize: 24),
                                    )
                                  : ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: history!.length,
                            itemBuilder: (context, index) {
                              final histor = history![index];
                              return Container(
                                margin: const EdgeInsets.only(right: 10),
                        padding: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                            color: Colors.white, borderRadius: BorderRadius.circular(15)),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            SizedBox(
                                width: 40,
                                height: 40,
                                child: Image.asset(
                                  "assets/dummy.png",
                                  fit: BoxFit.cover,
                                ),
                              ),
                            const SizedBox(
                              width: 10,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                AutoSizeText(
                                  histor.name,
                                  style: GoogleFonts.poppins(
                                    textStyle:
                                        const TextStyle(fontSize: 14, color: Color(0xff1f1f1f)),
                                  ),
                                  maxLines: 2,
                                ),
                                const SizedBox(
                                  height: 4,
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Row(
                                            children: [
                                              const Icon(
                                                Ionicons.remove_circle,
                                                size: 14,
                                                color: Color(0xff303030),
                                              ),
                                              Text(
                                                histor.typeName,
                                                style: GoogleFonts.poppins(
                                                  textStyle: const TextStyle(
                                                      fontSize: 12,
                                                      color: Color(0xff2b2b2b)),
                                                ),
                                              )
                                            ],
                                          ),
                                  ],
                                )
                              ],
                            ),
                          ],
                        ),
                      );
                            }),
                      ),
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

// this class defines the full-screen search modal
// by extending the ModalRoute class
