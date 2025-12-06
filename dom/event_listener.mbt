///|
#external
pub type EventListener

///|
pub impl TJsValue for EventListener with to_js(self : EventListener) -> JsValue = "%identity"

///|
#cfg(target="wasm-gc")
fn event_listener_new_ffi(callback : (Event) -> Unit) -> EventListener = "webapi_EventListener" "new"

///|
#cfg(target="js")
extern "js" fn event_listener_new_ffi(
  callback : (Event) -> Unit,
) -> EventListener =
  #| (callback) => callback

///|
#as_free_fn(event_listener)
pub fn EventListener::new(callback : (Event) -> Unit) -> EventListener {
  event_listener_new_ffi(callback)
}

///|
#cfg(target="wasm-gc")
pub fn EventListener::null() -> EventListener = "JsValue" "null"

///|
#cfg(target="js")
pub extern "js" fn EventListener::null() -> EventListener =
  #| () => null
