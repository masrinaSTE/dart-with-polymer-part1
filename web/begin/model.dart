library polymer_and_dart.web.models;

import 'package:polymer/polymer.dart';

class Codelab extends Observable {
  static const List<String> LEVELS = const ['easy', 'intermediate', 'advanced'];
  static const MIN_TITLE_LENGTH = 10;
  static const MAX_TITLE_LENGTH = 30;
  static const MAX_DESCRIPTION_LENGTH = 140;
  
  /**
   * Define three fields: title, description and level. And restrict each code lab to one of three preset levels.
   * @observable annotation tells Polymer that you want to trigger two-way data binding between these fields and the UI. This provides the following functionality:
   *  - When an @observable field's value changes, the UI for that field updates automatically.
   *  - When a UI element (such as <form> element) is bound to an @observable field, it can modify its value.
   */
  @observable String title;
  @observable String description;
  @observable String level;
  
  // Constructor
  Codelab([this.title = "", this.description = ""]);
}
