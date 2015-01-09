import 'package:polymer/polymer.dart';
import 'model.dart' show Codelab;
import 'dart:html' show CustomEvent, Event, Node;

@CustomTag('codelab-form')
class CodelabFormElement extends PolymerElement {
  /**
   * Declare a Codelab object as CodelabFormElement field.
   * The @published annotation lets you pass the codelab object as an attribut to <codelab-form>
   */
  @published Codelab codelab;
  
  /**
   * Defining these getters lets you use Codelab model's static variables inside Polymer templates
   */
  List<String> get allLevels => Codelab.LEVELS;
  int get minTitleLength => Codelab.MIN_TITLE_LENGTH;
  int get maxTitleLength => Codelab.MAX_TITLE_LENGTH;
  int get maxDescriptionLength => Codelab.MAX_DESCRIPTION_LENGTH;
  
  CodelabFormElement.created() : super.created() {}
}
