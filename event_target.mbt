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
trait TAddEventListenerOptionsArg {
  to_js(self : Self) -> JsValue
}

///|
pub impl TAddEventListenerOptionsArg for Bool with to_js(self : Bool) -> JsValue = "%identity"

///|
#external
type AddEventListenerOptions

///|
impl TAddEventListenerOptionsArg for AddEventListenerOptions with to_js(
  self : AddEventListenerOptions,
) -> JsValue = "%identity"

///|
#cfg(target="js")
extern "js" fn add_event_listener_options_ffi(
  capture : Bool,
  passive : Bool,
  once : Bool,
  signal : JsValue,
) -> AddEventListenerOptions =
  #| (capture, passive, once, signal) => ({ capture, passive, once, signal })

///|
#cfg(target="wasm-gc")
fn add_event_listener_options_ffi(
  capture : Bool,
  passive : Bool,
  once : Bool,
  signal : JsValue,
) -> AddEventListenerOptions = "webapi_AddEventListenerOptions" "new"

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
  add_event_listener_options_ffi(capture, passive, once, signal)
}

///|
pub fn default_add_event_listener_options() -> AddEventListenerOptions = "webapi_Dictionary" "empty"

///|
fn add_event_listener_ffi(
  obj : JsValue,
  type_ : String,
  listener : EventListener,
  options : JsValue,
) -> Unit = "webapi_EventTarget" "addEventListener"

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
  add_event_listener_ffi(self.to_js(), type_, callback, options)
}

//---------------------------------------------------------------------------------------------------------------------------------
// undefined removeEventListener(DOMString type, EventListener? listener, optional (EventListenerOptions or boolean) options = {});
//---------------------------------------------------------------------------------------------------------------------------------

///|
/// Arg : options
trait TRemoveEventListenerOptionsArg {
  to_js(self : Self) -> JsValue
}

///|
pub impl TRemoveEventListenerOptionsArg for Bool with to_js(self : Bool) -> JsValue = "%identity"

///|
#external
type EventListenerOptions

///|
impl TRemoveEventListenerOptionsArg for EventListenerOptions with to_js(
  self : EventListenerOptions,
) -> JsValue = "%identity"

///|
pub fn event_listener_options(capture? : Bool = false) -> EventListenerOptions = "webapi_EventListenerOptions" "new"

///|
pub fn default_event_listener_options() -> EventListenerOptions = "webapi_Dictionary" "empty"

///|
pub fn remove_event_listener_ffi(
  obj : JsValue,
  type_ : String,
  callback : EventListener,
  options : JsValue,
) -> Unit = "webapi_EventTarget" "removeEventListener"

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
  remove_event_listener_ffi(self.to_js(), type_, callback, options)
}
