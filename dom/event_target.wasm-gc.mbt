///|
fn add_event_listener_options_ffi(
  capture : Bool,
  passive : Bool,
  once : Bool,
  signal : JsValue,
) -> AddEventListenerOptions = "webapi_AddEventListenerOptions" "new"
