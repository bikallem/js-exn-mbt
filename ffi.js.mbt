///|
extern "js" fn create_button(label : String) -> HTMLButtonElement =
  #| (label) => {
  #|   let button = document.createElement('button')
  #|   button.textContent = label
  #|   return button
  #| }

///|
extern "js" fn HTMLButtonElement::add_event_listener(
  self : HTMLButtonElement,
  type_ : String,
  listener : (Event) -> Unit,
) -> Unit = "(button, type, listener) => button.addEventListener(type, listener)"

///|
extern "js" fn HTMLButtonElement::remove_event_listener(
  self : HTMLButtonElement,
  type_ : String,
  listener : (Event) -> Unit,
) -> Unit = "(button, type, listener) => button.removeEventListener(type, listener)"

///|
pub extern "js" fn Document::document() -> Document = "() => document"

///|
pub extern "js" fn Document::body(self : Document) -> HTMLBodyElement = "(document) => document.body"

///|
pub extern "js" fn Document::query_selector(
  self : Document,
  selector : String,
) -> HTMLButtonElement = "(document, selector) => document.querySelector(selector)"

///|
pub extern "js" fn HTMLBodyElement::append_child(
  self : HTMLBodyElement,
  child : HTMLButtonElement,
) -> Unit = "(body, child) => body.appendChild(child)"
