///|
#external
type HTMLBodyElement

///|
pub impl TJsValue for HTMLBodyElement with to_js(self : HTMLBodyElement) -> JsValue = "%identity"

///|
fn HTMLBodyElement::append_child_ffi(
  self : HTMLBodyElement,
  child : JsValue,
) -> Unit = "webapi_HTMLBodyElement" "appendChild"

///|
pub fn[T : TJsValue] HTMLBodyElement::append_child(
  self : HTMLBodyElement,
  child : T,
) -> Unit {
  HTMLBodyElement::append_child_ffi(self, child.to_js())
}
