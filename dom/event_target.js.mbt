///|
extern "js" fn add_event_listener_options_ffi(
  capture : Bool,
  passive : Bool,
  once : Bool,
  signal : JsValue,
) -> AddEventListenerOptions =
  #| (capture, passive, once, signal) => ({ capture, passive, once, signal })
