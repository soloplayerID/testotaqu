// ignore_for_file: avoid_print

part of 'screen.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({super.key});

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {

  @override
  void initState() {
    
    super.initState();
  }

  _storeOnboardInfo() async {
    print("Shared pref called");

    Session.setOnboard('1');
    context.read<PageBloc>().add(GoToLoginFirst());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: Container(
          padding: const EdgeInsets.only(top: 70),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[

              Container(
                height: 150,
                decoration: const BoxDecoration(
                    image:
                        DecorationImage(image: AssetImage("assets/logo.png"))),
              ),Container(
                margin: const EdgeInsets.only(top: 100, bottom: 16),
                child: Text(
                  "Travel with easy",
                  style: GoogleFonts.nunito(
                    fontSize: 18,
                    
                    color: const Color(0xFF4c4c4c),
                  ),
                ),
              ),
              Text(
                "OTAQU is always there for you!",
                style: GoogleFonts.nunito(
                  fontSize: 18,
                  
                  color: const Color(0xFFA0A0A0),
                ),
                textAlign: TextAlign.center,
              ),
              Container(
                width: 250,
                height: 46,
                margin: const EdgeInsets.only(top: 70, bottom: 19),
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(backgroundColor: mainColor),
                    onPressed: () async {
                      await _storeOnboardInfo();
                    },
                    child: Text(
                      "Next",
                      style: GoogleFonts.nunito(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    )),
              ),
              
            ],
          ),
        ));
  }
}
