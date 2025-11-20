///|
#external
pub type JsValue

///|
pub trait TJsValue {
  to_js(Self) -> JsValue = _
}

///|
pub fn undefined() -> JsValue = "JsValue" "undefined"

///|
pub fn null() -> JsValue = "JsValue" "null"

///|
impl TJsValue with to_js(self : Self) -> JsValue = "%identity"

///|
pub impl TJsValue for Bool with to_js(self : Bool) -> JsValue = "%identity"

///|
#external
type HTMLButtonElement

///|
pub impl TJsValue for HTMLButtonElement

///|
#external
type Event

///|
pub impl TJsValue for Event

///|
#external
type Document

///|
pub impl TJsValue for Document

///|
#external
type HTMLBodyElement

///|
pub impl TJsValue for HTMLBodyElement

///|
#external
type AbortSignal

///|
pub impl TJsValue for AbortSignal
