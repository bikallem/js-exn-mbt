///|
#external
pub type HTMLButtonElement

///|
pub impl TJsValue for HTMLButtonElement with to_js(self : HTMLButtonElement) -> JsValue = "%identity"

///|
pub impl TEventTarget for HTMLButtonElement

///|

///|
#cfg(target="wasm-gc")
fn HTMLButtonElement::new_ffi(label : String) -> HTMLButtonElement = "webapi_HTMLButtonElement" "new"

///|
#cfg(target="js")
extern "js" fn HTMLButtonElement::new_ffi(label : String) -> HTMLButtonElement =
  #| (label) => {
  #|   const btn = document.createElement("button");
  #|   btn.textContent = label;
  #|   return btn;
  #| }

///|
pub fn HTMLButtonElement::new(label : String) -> HTMLButtonElement {
  HTMLButtonElement::new_ffi(label)
}
