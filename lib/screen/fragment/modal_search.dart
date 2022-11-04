// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../helper/shared/shared_preferences_manager.dart';
import '../../src/bloc/page/page_bloc.dart';
import '../../src/resources/resources.dart';

class FullScreenSearchModal extends ModalRoute {
  @override
  Duration get transitionDuration => const Duration(milliseconds: 500);

  @override
  bool get opaque => false;

  @override
  bool get barrierDismissible => false;

  @override
  Color get barrierColor => Colors.black.withOpacity(0.6);

  @override
  String? get barrierLabel => null;

  @override
  bool get maintainState => true;

  @override
  Widget buildPage(
    BuildContext context,
    Animation<double> animation,
    Animation<double> secondaryAnimation,
  ) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // implement the search field
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: TypeAheadField(
                      hideSuggestionsOnKeyboardHide: false,
                      textFieldConfiguration: TextFieldConfiguration(
                        autofocus: true,
                        decoration: InputDecoration(
                          contentPadding: const EdgeInsets.symmetric(
                              vertical: 0, horizontal: 20),
                          filled: true,
                          fillColor: Colors.grey.shade300,
                          suffixIcon: const Icon(Icons.close),
                          hintText: 'Tulis Nama Tempat',
                          border: OutlineInputBorder(
                              borderSide: BorderSide.none,
                              borderRadius: BorderRadius.circular(30)),
                        ),
                      ),
                      suggestionsCallback: (pattern) async {
                        return await DestinationServices.getSuggestions(pattern);
                      },
                      itemBuilder: (context, Map<String, dynamic> suggestion) {
                        return ListTile(
                          leading: SizedBox(
                            width: 60,
                            height: 60,
                            child: Image.asset(
                              "assets/dummy.png",
                              fit: BoxFit.cover,
                            ),
                          ),
                          title: Text(suggestion['name']!),
                          subtitle: Text('${suggestion['typeName']}'),
                        );
                      },
                      noItemsFoundBuilder: (context) => const SizedBox(
                        height: 100,
                        child: Center(
                          child: Text(
                            'Not Found.',
                            style: TextStyle(fontSize: 24),
                          ),
                        ),
                      ),
                      onSuggestionSelected: (Map<String, dynamic> suggestion) {
                        // your implementation here
                        Session.getId().then((token) {
                          if (token != 'accessToken') {
                            // print('tokenya==$token');
                            Session.getExpired().then((expired) {
                              var today = DateTime.now();
                              if (today.hour < expired!) {
                                print('token belum expired');
                                Navigator.of(context).pop();
                                context
                                    .read<PageBloc>()
                                    .add(GoToSelectDestination(token: token, destinationId: suggestion['id'],name: suggestion['name'], typeName: suggestion['typeName']));
                              } else {
                                print('tokennya expired');
                                
                              }
                            });
                          } 
                        });
                      },
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  // This button is used to close the search modal
                  TextButton(
                      onPressed: () => Navigator.of(context).pop(),
                      child: const Text('Cancel'))
                ],
              ),

              // display other things like search history, suggestions, search results, etc.
              const SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 5),
                child: Text('Pencarian terakhir',
                    style: GoogleFonts.nunito(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // animations for the search modal
  @override
  Widget buildTransitions(BuildContext context, Animation<double> animation,
      Animation<double> secondaryAnimation, Widget child) {
    // add fade animation
    return FadeTransition(
      opacity: animation,
      // add slide animation
      child: SlideTransition(
        position: Tween<Offset>(
          begin: const Offset(0, -1),
          end: Offset.zero,
        ).animate(animation),
        child: child,
      ),
    );
  }
}
