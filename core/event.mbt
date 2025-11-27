///|
#external
type Event

///|
pub impl TJsValue for Event with to_js(self : Event) -> JsValue = "%identity"
