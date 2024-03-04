import 'dart:ffi';

import 'package:flame/components.dart' hide Timer;
import 'package:flame/game.dart';
import 'package:flame/input.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:flutter/material.dart' show Colors;
import 'package:tetrisstudy/main.dart';

class MainGame extends FlameGame with HasKeyboardHandlerComponents,HasGameRef{
  TetrisApp _tetris = TetrisApp();
}