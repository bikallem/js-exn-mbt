///|
pub trait TEventTarget: TJsValue {
  add_event_listener(
    self : Self,
    type_ : String,
    listener : &AddEventListenerListenerArg,
    options? : &AddEventListenerOptionsArg,
  ) -> Unit = _
  remove_event_listener(
    self : Self,
    type_ : String,
    listener : &RemoveEventListenerListenerArg,
    options? : &RemoveEventListenerOptionsArg,
  ) -> Unit = _
}

///|
#external
pub type EventTarget

///|
pub impl TJsValue for EventTarget

///|
pub impl TEventTarget for EventTarget

//---------------------------------------------------------------------------------------------------------------------------------
// undefined addEventListener(DOMString type, EventListener? callback, optional (AddEventListenerOptions or boolean) options = {});
//---------------------------------------------------------------------------------------------------------------------------------

///|
/// Arg: listener
pub trait AddEventListenerListenerArg {
  to_js(self : Self) -> JsValue = _
}

///|
impl AddEventListenerListenerArg with to_js(_ : Self) -> JsValue = "%identity"

///|
pub(all) struct EventListener((Event) -> Unit)

///|
pub fn cb(callback : (Event) -> Unit) -> EventListener {
  EventListener(callback)
}

///|
pub impl AddEventListenerListenerArg for EventListener

///|
pub impl AddEventListenerListenerArg for JsNull

///|
/// Arg : options
pub trait AddEventListenerOptionsArg {
  to_js(self : Self) -> JsValue = _
}

///|
impl AddEventListenerOptionsArg with to_js(_ : Self) -> JsValue = "%identity"

///|
pub impl AddEventListenerOptionsArg for Bool

///|
#external
type AddEventListenerOptions

///|
pub impl AddEventListenerOptionsArg for AddEventListenerOptions

///|
extern "js" fn add_event_listener_options_ffi(
  capture : Bool,
  passive : Bool,
  once : Bool,
  signal : JsValue,
) -> AddEventListenerOptions =
  #| (capture, passive, once, signal) => ({ capture, passive, once, signal })

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
extern "js" fn default_add_event_listener_options() -> AddEventListenerOptions =
  #| () => ({})

///|
extern "js" fn add_event_listener_ffi(
  obj : JsValue,
  type_ : String,
  listener : JsValue,
  options : JsValue,
) -> Unit =
  #| (obj, type, listener, options) => obj.addEventListener(type, listener, options)

///|
impl TEventTarget with add_event_listener(
  self : Self,
  type_ : String,
  listener : &AddEventListenerListenerArg,
  options? : &AddEventListenerOptionsArg,
) -> Unit {
  let options = if options is Some(options) {
    options.to_js()
  } else {
    default_add_event_listener_options().to_js()
  }
  add_event_listener_ffi(self.to_js(), type_, listener.to_js(), options)
}

//---------------------------------------------------------------------------------------------------------------------------------
// undefined removeEventListener(DOMString type, EventListener? listener, optional (EventListenerOptions or boolean) options = {});
//---------------------------------------------------------------------------------------------------------------------------------

///|
/// Arg: listener
pub trait RemoveEventListenerListenerArg {
  to_js(self : Self) -> JsValue = _
}

///|
impl RemoveEventListenerListenerArg with to_js(_ : Self) -> JsValue = "%identity"

///|
pub impl RemoveEventListenerListenerArg for EventListener

///|
pub impl RemoveEventListenerListenerArg for JsNull

///|
/// Arg : options
pub trait RemoveEventListenerOptionsArg {
  to_js(self : Self) -> JsValue = _
}

///|
impl RemoveEventListenerOptionsArg with to_js(_ : Self) -> JsValue = "%identity"

///|
pub impl RemoveEventListenerOptionsArg for Bool

///|
#external
type EventListenerOptions

///|
pub impl RemoveEventListenerOptionsArg for EventListenerOptions

///|
pub extern "js" fn event_listener_options(
  capture? : Bool = false,
) -> EventListenerOptions =
  #| (capture) => ({ capture })

///|
pub extern "js" fn default_event_listener_options() -> EventListenerOptions =
  #| () => ({})

///|
extern "js" fn remove_event_listener_ffi(
  obj : JsValue,
  type_ : String,
  listener : JsValue,
  options : JsValue,
) -> Unit =
  #| (obj, type, listener, options) => obj.removeEventListener(type, listener, options)

///|
impl TEventTarget with remove_event_listener(
  self : Self,
  type_ : String,
  listener : &RemoveEventListenerListenerArg,
  options? : &RemoveEventListenerOptionsArg,
) -> Unit {
  let options = match options {
    Some(options) => options.to_js()
    None => default_event_listener_options().to_js()
  }
  remove_event_listener_ffi(self.to_js(), type_, listener.to_js(), options)
}
