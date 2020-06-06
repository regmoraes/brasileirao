import 'package:brasileirao/repository/firebase_realtimedb.dart';
import 'package:brasileirao/repository/match_repository.dart';
import 'package:brasileirao/widgets/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'blocs/match_bloc.dart';
import 'pages/matches_page.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final firebaseRealTimeDb = await FirebaseRealtimeDb.instance();

  runApp(MyApp(firebaseRealTimeDb));
}

class MyApp extends StatelessWidget {
  final MatchRepository roundRepository;

  const MyApp(this.roundRepository);

  @override
  Widget build(BuildContext context) {
    return Provider(
      create: (_) => MatchBloc(roundRepository),
      child: MaterialApp(
        title: 'Brasileirão',
        theme: appTheme,
        home: MatchesPage(),
      ),
    );
  }
}
