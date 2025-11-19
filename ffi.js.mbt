///|
pub extern "js" fn undefined() -> JsValue =
  #| () => undefined

///|
pub extern "js" fn null() -> JsValue =
  #| () => null

///|
pub extern "js" fn HTMLButtonElement::new(label : String) -> HTMLButtonElement =
  #| (label) => {
  #|   let button = document.createElement('button')
  #|   button.textContent = label
  #|   return button
  #| }

///|
pub extern "js" fn event_listener_options(
  capture? : Bool = false,
) -> EventListenerOptions =
  #| (capture) => ({ capture })

///|
pub extern "js" fn default_event_listener_options() -> EventListenerOptions =
  #| () => ({})

///|
extern "js" fn add_event_listener_options_ffi(
  capture : Bool,
  passive : Bool,
  once : Bool,
  signal : JsValue,
) -> AddEventListenerOptions = "(capture, passive, once, signal) => ({ capture, passive, once, signal })"

///|
pub fn add_event_listener_options(
  capture? : Bool = false,
  passive? : Bool = false,
  once? : Bool = false,
  signal? : AbortSignal,
) -> AddEventListenerOptions {
  let signal = if signal is Some(signal) { signal.to_js() } else { undefined() }
  add_event_listener_options_ffi(capture, passive, once, signal)
}

///|
pub extern "js" fn default_add_event_listener_options() -> AddEventListenerOptions =
  #| () => ({})

///|
pub extern "js" fn HTMLButtonElement::add_event_listener(
  self : HTMLButtonElement,
  type_ : String,
  listener : (Event) -> Unit,
  options? : AddEventListenerOptions = default_add_event_listener_options(),
) -> Unit = "(button, type, listener, options) => button.addEventListener(type, listener, options)"

///|
pub extern "js" fn HTMLButtonElement::remove_event_listener(
  self : HTMLButtonElement,
  type_ : String,
  listener : (Event) -> Unit,
  options? : EventListenerOptions = default_event_listener_options(),
) -> Unit = "(button, type, listener, options) => button.removeEventListener(type, listener, options)"

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
