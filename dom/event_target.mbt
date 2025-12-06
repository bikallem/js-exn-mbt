///|
pub trait TEventTarget: TJsValue {
  add_event_listener(
    self : Self,
    type_ : String,
    callback : EventListener,
    options? : &TAddEventListenerOptionsArg,
  ) -> Unit = _
  remove_event_listener(
    self : Self,
    type_ : String,
    callback : EventListener,
    options? : &TRemoveEventListenerOptionsArg,
  ) -> Unit = _
}

///|
#external
pub type EventTarget

///|
pub impl TJsValue for EventTarget with to_js(self : EventTarget) -> JsValue = "%identity"

///|
pub impl TEventTarget for EventTarget

//---------------------------------------------------------------------------------------------------------------------------------
// undefined addEventListener(DOMString type, EventListener? callback, optional (AddEventListenerOptions or boolean) options = {});
//---------------------------------------------------------------------------------------------------------------------------------

///|
/// Arg : options
pub(open) trait TAddEventListenerOptionsArg {
  to_js(self : Self) -> JsValue
}

///|
pub impl TAddEventListenerOptionsArg for Bool with to_js(self : Bool) -> JsValue = "%identity"

///|
#external
type AddEventListenerOptions

///|
pub impl TAddEventListenerOptionsArg for AddEventListenerOptions with to_js(
  self : AddEventListenerOptions,
) -> JsValue = "%identity"

///|
pub fn add_event_listener_options(
  capture? : Bool = false,
  passive? : Bool = false,
  once? : Bool = false,
  signal? : AbortSignal,
) -> AddEventListenerOptions {
  let signal = match signal {
    Some(signal) => signal.to_js()
    None => JsValue::undefined()
  }
  AddEventListenerOptions::new_ffi(capture, passive, once, signal)
}

///|
#cfg(target="wasm-gc")
fn AddEventListenerOptions::new_ffi(
  capture : Bool,
  passive : Bool,
  once : Bool,
  signal : JsValue,
) -> AddEventListenerOptions = "webapi_AddEventListenerOptions" "new"

///|
#cfg(target="js")
extern "js" fn AddEventListenerOptions::new_ffi(
  capture : Bool,
  passive : Bool,
  once : Bool,
  signal : JsValue,
) -> AddEventListenerOptions =
  #| (capture, passive, once, signal) => ({ capture, passive, once, signal })

///|
#cfg(target="wasm-gc")
fn AddEventListenerOptions::default_ffi() -> AddEventListenerOptions = "webapi_Dictionary" "empty"

///|
#cfg(target="js")
extern "js" fn AddEventListenerOptions::default_ffi() -> AddEventListenerOptions =
  #| () => ({})

///|
pub fn default_add_event_listener_options() -> AddEventListenerOptions {
  AddEventListenerOptions::default_ffi()
}

///|

///|
#cfg(target="wasm-gc")
fn JsValue::add_event_listener_ffi(
  self : JsValue,
  type_ : String,
  listener : EventListener,
  options : JsValue,
) -> Unit = "webapi_EventTarget" "addEventListener"

///|
#cfg(target="js")
extern "js" fn JsValue::add_event_listener_ffi(
  self : JsValue,
  type_ : String,
  listener : EventListener,
  options : JsValue,
) -> Unit =
  #| (self, type_, listener, options) => self.addEventListener(type_, listener, options)

///|
impl TEventTarget with add_event_listener(
  self : Self,
  type_ : String,
  callback : EventListener,
  options? : &TAddEventListenerOptionsArg,
) -> Unit {
  let options = match options {
    Some(options) => options.to_js()
    None => default_add_event_listener_options().to_js()
  }
  self.to_js().add_event_listener_ffi(type_, callback, options)
}

//---------------------------------------------------------------------------------------------------------------------------------
// undefined removeEventListener(DOMString type, EventListener? listener, optional (EventListenerOptions or boolean) options = {});
//---------------------------------------------------------------------------------------------------------------------------------

///|
/// Arg : options
pub(open) trait TRemoveEventListenerOptionsArg {
  to_js(self : Self) -> JsValue
}

///|
pub impl TRemoveEventListenerOptionsArg for Bool with to_js(self : Bool) -> JsValue = "%identity"

///|
#external
type EventListenerOptions

///|
pub impl TRemoveEventListenerOptionsArg for EventListenerOptions with to_js(
  self : EventListenerOptions,
) -> JsValue = "%identity"

///|

///|
#cfg(target="wasm-gc")
fn EventListenerOptions::new_ffi(
  capture? : Bool = false,
) -> EventListenerOptions = "webapi_EventListenerOptions" "new"

///|
#cfg(target="js")
extern "js" fn EventListenerOptions::new_ffi(
  capture? : Bool = false,
) -> EventListenerOptions =
  #| (capture) => ({ capture })

///|
pub fn event_listener_options(capture? : Bool = false) -> EventListenerOptions {
  EventListenerOptions::new_ffi(capture~)
}

///|

///|
#cfg(target="wasm-gc")
fn EventListenerOptions::default_ffi() -> EventListenerOptions = "webapi_Dictionary" "empty"

///|
#cfg(target="js")
extern "js" fn EventListenerOptions::default_ffi() -> EventListenerOptions =
  #| () => ({})

///|
pub fn default_event_listener_options() -> EventListenerOptions {
  EventListenerOptions::default_ffi()
}

///|

///|
#cfg(target="wasm-gc")
fn JsValue::remove_event_listener_ffi(
  self : JsValue,
  type_ : String,
  callback : EventListener,
  options : JsValue,
) -> Unit = "webapi_EventTarget" "removeEventListener"

///|
#cfg(target="js")
extern "js" fn JsValue::remove_event_listener_ffi(
  self : JsValue,
  type_ : String,
  callback : EventListener,
  options : JsValue,
) -> Unit =
  #| (self, type_, listener, options) => self.removeEventListener(type_, listener, options)

///|
pub fn remove_event_listener_ffi(
  obj : JsValue,
  type_ : String,
  callback : EventListener,
  options : JsValue,
) -> Unit {
  obj.remove_event_listener_ffi(type_, callback, options)
}

///|
impl TEventTarget with remove_event_listener(
  self : Self,
  type_ : String,
  callback : EventListener,
  options? : &TRemoveEventListenerOptionsArg,
) -> Unit {
  let options = match options {
    Some(options) => options.to_js()
    None => default_event_listener_options().to_js()
  }
  self.to_js().remove_event_listener_ffi(type_, callback, options)
}
