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
  
  @observable String titleErrorMessage = '';
  @observable String descriptionErrorMessage = '';
  
  CodelabFormElement.created() : super.created() {}
  
  /**
   * Each method checks a code lab field against the validation rules defined in the model.
   * If validation fails, the validator sets an error message and return false.
   * Otherwise it removes the error message and returns true.
   */
  bool validateTitle(){
    if(codelab.title.length < minTitleLength || codelab.title.length > maxTitleLength){
      titleErrorMessage = "Title must be between $minTitleLength and "
          "$maxTitleLength characters.";
      return false;
    }
    titleErrorMessage = '';
    return true;
  }
  
  bool validateDescription(){
    if(codelab.description.length > maxDescriptionLength){
      descriptionErrorMessage = "Description cannot be more than "
          "$maxDescriptionLength characters.";
      return false;
    }
    descriptionErrorMessage = '';
    return true;
  }
  
  /**
   * Call the codelab validators. If the code lab object validates, validateCodelab() fires a custom event, passing the validated code lab objects as data
   * It is the reponsibility of <codelab-form>'s parent element to register a listener that adds the new code lab to <codelab-list>.
   */
  validateCodelab(Event event, Object detail, Node sender) {
    event.preventDefault();
    if(validateTitle() && validateDescription()) {
      dispatchEvent(new CustomEvent('codelabvalidated', detail: {'codelab': codelab}));
    }
  }
}
