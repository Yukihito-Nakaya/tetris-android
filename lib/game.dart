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

  final List<RectangleComponent> _wallComponents = [];
  final List<RectangleComponent> _rectComponentList = [];
  final List<RectangleComponent> _nextMinoComponentList = [];

  @override
  Future<void> onLoad() async{
    super.onLoad();
    await draw();

    _tetris.setRenderCallback(renderCallback);
    _tetris.setChangeMinoCallback(minoBottomHitCallback);
  }

  Future<void> draw() async{
    for(int y = 0; y< _tetris.displayBuffer.length ;y++){
      final row = _tetris.displayBuffer[y];
      for(int x = 0; x< row.length;x++){
        if(row[x] == 1) {
          _wallComponents.add(createBlock(x + 1, y + 1, getBlockPaint(row[x])));
        }else if(row[x] > 1){
          _rectComponentList.add(createBlock(x + 1, y + 1, getBlockPaint(row[x])));
        }
      }
    }
    for(var wall in _wallComponents){
      add(wall);
    }
    for(var rect in _rectComponentList){
      add(rect);
    }
    createNextMino();
    for (var nextMino in _nextMinoComponentList){
      add(nextMino);
    }
    add(getRenderText('NEXT', 360.0, 30.0));
    add(getRenderText('LEVEL', 360.0, 180.0));
    add(getRenderText('1', 360.0, 220.0));
    add(getRenderText('SCORE', 360.0, 280.0));
    add(getRenderText('0', 360.0, 320.0));
    //ここに矢印ボタン　右と左を追加
  }
  renderCallback(){
    resetRenderMino();
    renderMino();
  }

  minoBottomHitCallback(){
    resetRenderMino();
    renderMino();

    createNextMino();
    for(var nextMino in _nextMinoComponentList){
      add(nextMino);
    }
  }

  createNextMino(){
    for(var nextMino in _nextMinoComponentList){
      remove(nextMino);
    }
    _nextMinoComponentList.clear();
    for(int y = 0; y< _tetris.nextMinoShapeArray.length ;y++){
      final row = _tetris.nextMinoShapeArray[y];
      for(int x = 0; x< row.length;x++){
        if(row[x] == 1) {
          _nextMinoComponentList.add(createBlock(x + 1, y + 1, getBlockPaint(row[x])));
        }
      }
    }

    for(int nextMino in _nextMinoComponentList){
      nextMinos.position.x = nextMino.position.x + 340;
      nextMinos.position.y = nextMino.position.y + 40;
    }
  }

  createBlock(int x, int y, Paint paint){
    return RectangleComponent(
      position: Vector2(oneBlockSize * x, oneBlockSize * y),
      size: Vector2.all(oneBlockSize),
      paint: paint,
    );
  }

  


}