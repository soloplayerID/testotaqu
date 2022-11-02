// ignore_for_file: avoid_print

import 'package:belajar_bloc_lagi/src/models/destination_db.dart';
import 'package:belajar_bloc_lagi/src/models/history_db.dart';
import 'package:belajar_bloc_lagi/src/models/models.dart';
import 'package:belajar_bloc_lagi/src/resources/resources.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../helper/shared/shared_preferences_manager.dart';

part 'page_event.dart';
part 'page_state.dart';

class PageBloc extends Bloc<PageEvent, PageState> {
  final AuthServices _authServices = AuthServices();
  final DestinationServices _destinationServices = DestinationServices();
  final AvailModel _availModel = AvailModel();

  PageBloc() : super(OnInitialPage()){
    on<PageEvent>((event, emit) async {
      if(event is GoToSplashPage) {
      emit( OnSplashPage());
    } else if (event is GoToLogin) {
      
      print('onlogin');
      await _authServices.login('otaqu', 'qwerty').then((value) async {
      print('tokennya adalah==== ${value.data!.accessToken}');
      var today = DateTime.now();
      var expiredFromNow = today.add(const Duration(hours: 1));
      print(expiredFromNow.hour);
      Session.setId(value.data!.accessToken.toString());
      Session.setExpired(expiredFromNow.hour.toString());


          var check = await DestinationDatabase.instance.tableIsEmpty();
          if(check! == 0){
          print('token adalah ${value.data!.accessToken.toString()}');
          print(check);
            await _destinationServices.getDestination(value.data!.accessToken.toString()).then((value) async {
              for (var element in value.data!) { 
                final destination = Destination(
                  id: element.destinationId,
                  typeSource: element.typeSource.toString(),
                  typeName: element.typeName.toString(),
                  name: element.name.toString(),
                  packetTypeId: element.packageTypeId!,
                );
                await DestinationDatabase.instance.create(destination);
              }
            });
            emit(OnMainPage());
          }else{
            print('data destination sudah ada');
            emit(OnMainPage());
          }
        }).catchError((err) {
          emit(OnLoginError(err.toString()));
        });

    } else if (event is GoToLoginFirst) {
        print('onlogin');
        await _authServices.login('otaqu', 'qwerty').then((value) async {
          print('tokennya adalah==== ${value.data!.accessToken}');
          var today = DateTime.now();
          var expiredFromNow = today.add(const Duration(hours: 1));
          print(expiredFromNow.hour);
          Session.setId(value.data!.accessToken.toString());
          Session.setExpired(expiredFromNow.hour.toString());
          var check = await DestinationDatabase.instance.tableIsEmpty();
          if(check! == 0){
          print('token adalah ${value.data!.accessToken.toString()}');
          print(check);
            await _destinationServices.getDestination(value.data!.accessToken.toString()).then((value) async {
              for (var element in value.data!) { 
                final destination = Destination(
                  id: element.destinationId,
                  typeSource: element.typeSource.toString(),
                  typeName: element.typeName.toString(),
                  name: element.name.toString(),
                  packetTypeId: element.packageTypeId!,
                );
                await DestinationDatabase.instance.create(destination);
              }
            });
            emit(OnMainPage());
          }else{
            print('data destination sudah ada');
            emit(OnMainPage());
          }
          
        }).catchError((err) {
          emit(OnLoginError(err.toString()));
        });
      } else if (event is GoToGetDestinationData) {
      var check = await DestinationDatabase.instance.tableIsEmpty();
      if(check! == 0){
      print('token adalah ${event.token}');
      print(check);
        await _destinationServices.getDestination(event.token!).then((value) async {
          for (var element in value.data!) { 
            final destination = Destination(
              id: element.destinationId,
              typeSource: element.typeSource.toString(),
              typeName: element.typeName.toString(),
              name: element.name.toString(),
              packetTypeId: element.packageTypeId!,
            );
            await DestinationDatabase.instance.create(destination);
          }
        });
        emit(OnMainPage());
      }else{
        print('data destination sudah ada');
        emit(OnMainPage());
      }

    } else if(event is GoToOnboardingPage) {
      emit(OnBoardingPage());
    } else if (event is GoToMainPage) {
      emit(OnMainPage());
    } else if (event is GoToSearchDestination) {
      emit(OnSearchhDestinationPage());
    } else if (event is GoToSelectDestination) {
      final history = History(
        id: event.destinationId,
        typeName: event.typeName.toString(),
        name: event.name.toString(),
      );
      await HistoryDatabase.instance.create(history);
        print('save history');
      await _destinationServices.getAvail(event.token!).then((value) async {
        for (var element in value.data!.packages!) {
          _availModel.avails.add(Avail(
            name: element.name!, 
            price: element.price.toString(), 
            images: element.images![0],
            type: element.packageTypeName!
          ));
        }});
      emit(OnSelectDestinationPage(_availModel));
    }
    });
  }

  // Stream<PageState> mapEventToState(
  //   PageEvent event,
  // ) async* {
  //   if(event is GoToSplashPage) {
  //     yield OnSplashPage();
  //   } else if(event is GoToOnboardingPage) {
  //     yield OnBoardingPage();
  //   } else if (event is GoToMainPage) {
  //     yield OnMainPage();
  //   } else if (event is GoToSearchDestination) {
  //     yield OnSearchhDestinationPage();
  //   } else if (event is GoToSelectDestination) {
  //     yield OnSelectDestinationPage();
  //   }
  // }
}
