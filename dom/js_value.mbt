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
fn null_ffi() -> JsValue = "JsNull" "null"

///|
fn[T] cast(value : JsValue) -> T = "%identity"

///|
#as_free_fn(null)
pub fn[T] JsValue::null() -> T {
  cast(null_ffi())
}

///|
pub impl TJsValue for Bool with to_js(self : Bool) -> JsValue = "%identity"
