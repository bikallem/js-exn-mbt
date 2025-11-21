///|
#external
pub type JsValue

///|
pub trait TJsValue {
  to_js(Self) -> JsValue = _
}

///|
pub fn JsValue::undefined() -> JsValue = "JsValue" "undefined"

///|
pub fn JsValue::null() -> JsValue = "JsValue" "null"

///|
impl TJsValue with to_js(self : Self) -> JsValue = "%identity"

///|
pub impl TJsValue for Bool with to_js(self : Bool) -> JsValue = "%identity"
