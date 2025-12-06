///|
#external
pub type HTMLBodyElement

///|
pub impl TJsValue for HTMLBodyElement with to_js(self : HTMLBodyElement) -> JsValue = "%identity"

///|

///|
#cfg(target="wasm-gc")
fn HTMLBodyElement::append_child_ffi(
  self : HTMLBodyElement,
  child : HTMLButtonElement,
) -> Unit = "webapi_HTMLBodyElement" "appendChild"

///|
#cfg(target="js")
extern "js" fn HTMLBodyElement::append_child_ffi(
  self : HTMLBodyElement,
  child : HTMLButtonElement,
) -> Unit =
  #| (self, child) => self.appendChild(child)

///|
pub fn HTMLBodyElement::append_child(
  self : HTMLBodyElement,
  child : HTMLButtonElement,
) -> Unit {
  self.append_child_ffi(child)
}
