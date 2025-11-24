///|
#external
type HTMLBodyElement

///|
pub impl TJsValue for HTMLBodyElement with to_js(self : HTMLBodyElement) -> JsValue = "%identity"

///|
pub fn HTMLBodyElement::append_child(
  self : HTMLBodyElement,
  child : HTMLButtonElement,
) -> Unit = "webapi_HTMLBodyElement" "appendChild"
