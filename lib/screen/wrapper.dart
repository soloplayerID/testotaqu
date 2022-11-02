

// ignore_for_file: avoid_print

part of 'screen.dart';

class Wrapper extends StatelessWidget {
  const Wrapper({super.key});

  @override
  Widget build(BuildContext context) {

    if (prevPageEvent is! GoToSplashPage) {
      prevPageEvent = GoToSplashPage();
      context.read<PageBloc>().add(prevPageEvent!);
    }

    // Session.getId().then((token) {
    //   if (token != 'accessToken') {
    //     // print('tokenya==$token');
    //     Session.getExpired().then((expired) {
    //       var today = DateTime.now();
    //       if (today.hour < expired!) {
    //         print('token belum expired');
    //       } else {
    //         print('tokennya expired');
    //       }
    //     });
    //   }
    // });

    print('rebuild');
    return BlocBuilder<PageBloc, PageState>(
      builder: (context, pageState) => (pageState is OnSplashPage)
      ? const SplashScreen()
      : (pageState is OnBoardingPage)
      ? const OnBoardingScreen()
      : (pageState is OnMainPage)
      ? const HomeScreen()
      : (pageState is OnSelectDestinationPage)
      ? DestinationScreen(availModel: pageState.availModel,)
      : const Text('test',style: TextStyle(color: Colors.red),)
    );
  }
}