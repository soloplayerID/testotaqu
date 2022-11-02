

import 'package:auto_size_text/auto_size_text.dart';
import 'package:belajar_bloc_lagi/src/bloc/page/page_bloc.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ionicons/ionicons.dart';
import 'package:line_icons/line_icons.dart';

import '../helper/shared/shared.dart';
import '../helper/shared/shared_preferences_manager.dart';
import 'package:intl/intl.dart';

import '../src/models/history_db.dart';
import '../src/models/models.dart';
import '../src/resources/resources.dart';
import 'fragment/modal_search.dart';

part 'wrapper.dart';
part 'splash_screen.dart';
part 'onboarding_screen.dart';
part 'home_screen.dart';
part 'destination_screen.dart';