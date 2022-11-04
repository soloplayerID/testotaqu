// ignore_for_file: avoid_print

part of 'screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  int splashtime =3;

  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(seconds: splashtime), () {
      print('== go boardingggg ==');
      Session.checkOnboard().then((values) {
        if(values) {
          Session.getId().then((token) {
            if (token!='accessToken') {
              // print('tokenya==$token');
              Session.getExpired().then((expired) {
                var today = DateTime.now();
                if(today.hour < int.parse(expired!.toString())){
                  print('token belum expired');
                  context.read<PageBloc>().add(GoToGetDestinationData(token: token));
                  // var check = await NotesDatabase.instance.tableIsEmpty();
                  // print(check);
                }else{
                  print('tokennya expired');
                  context.read<PageBloc>().add(GoToLogin());
                }
              });
            } else {
              context.read<PageBloc>().add(GoToLoginFirst());
            }
          });

        }else{
          context.read<PageBloc>().add(GoToOnboardingPage());

        }
      });
    });
  }


  @override
  Widget build(BuildContext context) {
    

    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            const SizedBox(
              height: 10,
            ),
            Container(
              height: 150,
              decoration: const BoxDecoration(
                  image: DecorationImage(image: AssetImage("assets/logo.png"))),
            ),
            Text(
              'Powered by : Otaqu.id',
              style: GoogleFonts.nunito(
                fontSize: 14,
                fontWeight: FontWeight.bold,
                color: Colors.grey,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
