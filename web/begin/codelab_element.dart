import 'package:polymer/polymer.dart';
import 'model.dart' show Codelab;
import 'dart:html' show Event, Node, CustomEvent;

@CustomTag('codelab-element')
class CodelabElement extends PolymerElement {
  /**
   * Adding the @published annotation to pass a code lab as an attribute to <codelab-element>
   */
  @published Codelab codelab;
  
  /* To keep track of editing status of a CodelabElement object */
  @observable bool editing = false;
  
  /**
   * _cachedCodelab field to store the edited code lab's contens.
   * If you cancel editing, you restore the original code lab values from _cachedCodelab.
   */
  Codelab _cachedCodelab;
  
  CodelabElement.created() : super.created() {}
  
  updateCodelab(Event e, var detail, Node sender) {
    e.preventDefault();
    if(_cachedCodelab.level != codelab.level){
      dispatchEvent(new CustomEvent('levelchanged'));
    }
    editing = false;
  }
  
  startEditing(Event e, var detail, Node sender) {
    e.preventDefault();
    _cachedCodelab = new Codelab();
    copyCodelab(codelab, _cachedCodelab);
    editing = true;
  }
  
  cancelEditing(Event e, var detail, Node sender) {
    e.preventDefault();
    copyCodelab(_cachedCodelab, codelab);
    editing = false;
  }
  
  copyCodelab(source, destination){
    source.title = destination.title;
    source.description = destination.description;
    source.level = destination.level;
  }
  
  /**
   * deleteCodelab method will dispatches a deleteCodelab custom event, and forwards the code lab to be deleted with that event.
   */
  deleteCodelab(Event e, var detail, Node sender) {
    e.preventDefault();
    dispatchEvent(new CustomEvent('deletecodelab', detail: {'codelab': codelab}));
  }
}
