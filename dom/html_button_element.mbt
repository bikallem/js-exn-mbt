///|
#external
pub type HTMLButtonElement

///|
pub impl TJsValue for HTMLButtonElement with to_js(self : HTMLButtonElement) -> JsValue = "%identity"

///|
pub impl TEventTarget for HTMLButtonElement

///|
pub fn HTMLButtonElement::new(label : String) -> HTMLButtonElement = "webapi_HTMLButtonElement" "new"
