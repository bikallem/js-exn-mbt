///|
#external
pub type JsValue

///|
pub trait TJsValue {
  to_js(Self) -> JsValue = _
}

///|
impl TJsValue with to_js(self : Self) -> JsValue = "%identity"

///|
pub trait TNullable {
  nullable(Self) -> Self
}

///|
pub impl TJsValue for Bool with to_js(self : Bool) -> JsValue = "%identity"

///|
#external
type HTMLButtonElement

///|
pub impl TJsValue for HTMLButtonElement with to_js(self : HTMLButtonElement) -> JsValue = "%identity"

///|
#external
type Event

///|
#external
type Document

///|
#external
type HTMLBodyElement

///|
/// EventListener callback
pub(all) struct EventListener((Event) -> Unit)

///|
extern "js" fn event_listener_to_js(listener : (Event) -> Unit) -> JsValue = "%identity"

///|
pub impl TJsValue for EventListener with to_js(self : EventListener) -> JsValue {
  event_listener_to_js(self.0)
}

///|
pub trait OptionsOrUseCapture: TJsValue {}

///|
pub impl OptionsOrUseCapture for EventListener

///|
pub impl OptionsOrUseCapture for Bool
