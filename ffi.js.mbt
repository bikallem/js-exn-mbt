///|
pub extern "js" fn HTMLButtonElement::new(label : String) -> HTMLButtonElement =
  #| (label) => WebAPI_HTMLButtonElement.new(label)

///|
pub extern "js" fn Document::document() -> Document =
  #| () => document

///|
pub extern "js" fn Document::body(self : Document) -> HTMLBodyElement =
  #| (document) => document.body

///|
pub extern "js" fn Document::query_selector(
  self : Document,
  selector : String,
) -> HTMLButtonElement =
  #| (document, selector) => document.querySelector(selector)

///|
pub extern "js" fn HTMLBodyElement::append_child(
  self : HTMLBodyElement,
  child : HTMLButtonElement,
) -> Unit =
  #| (body, child) => body.appendChild(child)
