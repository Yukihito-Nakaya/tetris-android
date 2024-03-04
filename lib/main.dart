import 'package:flutter/material.dart';
import 'main_game_page.dart';

void main(){
  WidgetsFlutterBinding.ensureInitialized();
  return runApp(TetrisApp());
}

class TetrisApp extends StatelessWidget {
  const TetrisApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context){
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'TetrisStudy',
      home: MainGamePage(),
    );
  }
}
