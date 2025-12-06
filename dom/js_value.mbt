///|
#external
pub type JsValue

///|
pub(open) trait TJsValue {
  to_js(Self) -> JsValue
}

///|
#cfg(target="wasm-gc")
fn undefined_ffi() -> JsValue = "JsValue" "undefined"

///|
#cfg(target="js")
extern "js" fn undefined_ffi() -> JsValue =
  #| () => undefined

///|
pub fn JsValue::undefined() -> JsValue {
  undefined_ffi()
}

///|

///|
#cfg(target="wasm-gc")
fn null_ffi() -> JsValue = "JsNull" "null"

///|
#cfg(target="js")
extern "js" fn null_ffi() -> JsValue =
  #| () => null

///|
fn[T] cast(value : JsValue) -> T = "%identity"

///|
#as_free_fn(null)
pub fn[T] JsValue::null() -> T {
  cast(null_ffi())
}

///|
pub impl TJsValue for Bool with to_js(self : Bool) -> JsValue = "%identity"
