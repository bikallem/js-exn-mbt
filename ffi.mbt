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
pub trait OptionsOrUseCapture: TJsValue {}

///|
pub impl OptionsOrUseCapture for Bool
