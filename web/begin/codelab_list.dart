import 'package:polymer/polymer.dart';
import 'model.dart' show Codelab;
import 'dart:html' show Event, Node;

@CustomTag('codelab-list')
class CodelabList extends PolymerElement {
  /**
   * Add newCodelab field that binds to the template
   * Assigned a default value to newCodelab's level.
   * When the <form> loads, the default level is automatically selected.
   */
  @observable Codelab newCodelab = new Codelab();
  String get defaultLevel => Codelab.LEVELS[1];
  
  CodelabList.created() : super.created() {
    newCodelab.level = defaultLevel;
  }
}
