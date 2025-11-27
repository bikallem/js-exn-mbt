///|
#external
pub type JsValue

///|
pub(open) trait TJsValue {
  to_js(Self) -> JsValue
}

///|
pub fn JsValue::undefined() -> JsValue = "JsValue" "undefined"

///|
pub fn JsValue::null() -> JsValue = "JsValue" "null"

///|
pub impl TJsValue for Bool with to_js(self : Bool) -> JsValue = "%identity"
