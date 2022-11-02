part of 'screen.dart';

class DestinationScreen extends StatefulWidget {
  final AvailModel availModel;

  const DestinationScreen(
      {Key? key, required this.availModel})
      : super(key: key);
  @override
  State<DestinationScreen> createState() => _DestinationScreenState();
}

class _DestinationScreenState extends State<DestinationScreen> {


  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        BlocProvider.of<PageBloc>(context).add(GoToMainPage());
        return false;
      },
      child: Scaffold(
        body: SafeArea(
          child: Column(
            children: [
              //app bar
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Row(
                          children: [
                            Column(
                              children: [
                                Text(
                                  'Menampilkan hasil pencarian',
                                  style: GoogleFonts.nunito(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                    color: const Color(0xFF4c4c4c),
                                  ),
                                ),
                                Text(
                                  '...',
                                  style: GoogleFonts.nunito(
                                    fontSize: 14,
                                    color: const Color(0xFF4c4c4c),
                                  ),
                                ),
                              ],
                            )
                          ],
                        ),
                        
                      ],
                    ),
                    InkWell(
                      onTap: (){},
                      child: Container(
                        width: 50,
                        height: 50,
                        decoration: BoxDecoration(
                          color: const Color(0XFFFFC90E),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Center(
                            child: Text(
                          'Ubah',
                          style: GoogleFonts.nunito(
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                        )),
                      ),
                    ),
                  ],
                ),
              ),
        
              const SizedBox(
                height: 25,
              ),
              Expanded(
                  child: Container(
                padding: const EdgeInsets.all(20),
                width: MediaQuery.of(context).size.width,
                 height: double.infinity,
                color: const Color(0xffecedf2),
                child: SingleChildScrollView(
                  scrollDirection: Axis.vertical,
                  child: Column(
                    children: [
                      Container(
                          width: MediaQuery.of(context).size.width,
                          child: widget.availModel.avails.isEmpty
                          ? Container()
                          : ListView.builder(
                            itemCount: widget.availModel.avails.length,
                            primary: false,
                            shrinkWrap: true,
                            itemBuilder: (BuildContext context, int itemIndex) => 
                            Container(
                              height: 120,
                                    margin:
                                        const EdgeInsets.symmetric(vertical: 5.0),
                        padding: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                            color: const Color(0XFFf5f6f8),
                            borderRadius: BorderRadius.circular(12)),
                        child: Row(
                          children: [
                            //animation or picture
                            Container(
                              height: 100,
                              width: 100,
                              child: CachedNetworkImage(
                                imageUrl: widget
                                                .availModel.avails[itemIndex].images,
                                placeholder: (context, url) => const CircularProgressIndicator(),
                                errorWidget: (context, url, error) =>  const Icon(Icons.error),
                              ),
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            // how do you feel + get started button
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                     widget.availModel.avails[itemIndex].name,
                                    style: GoogleFonts.nunito(
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.bold,
                                                  color: const Color(0xFF4c4c4c),
                                                ),
                                  ),
                                  const SizedBox(
                                    height: 8,
                                  ),
                                   Text('${widget.availModel.avails[itemIndex].type}',
                                    style: GoogleFonts.nunito(
                                                  fontSize: 12,
                                                  
                                                  color: const Color(0xFF4c4c4c),
                                                ),
                                  ),
                                  const SizedBox(
                                    height: 12,
                                  ),
                                   Text(
                                    'Rp. ${widget
                                                .availModel.avails[itemIndex].price}',
                                    style: GoogleFonts.nunito(
                                                  fontSize: 14,
                                                  fontWeight: FontWeight.bold,
                                                  color: const Color(0xFFE91E5A),
                                                ),
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                          )
                      )
                    ],
                  ),
                ),
              )),
            ],
          ),
        ),
      ),
    );
  }
}
