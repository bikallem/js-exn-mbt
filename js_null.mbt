///|
#external
pub type JsNull

///|
fn null_ffi() -> JsNull = "JsNull" "null"

///|
fn[T] cast(value : JsNull) -> T = "%identity"

///|
#as_free_fn(null)
pub fn[T] JsNull::null() -> T {
  cast(null_ffi())
}
