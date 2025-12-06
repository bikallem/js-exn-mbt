///|
#external
pub type Document

///|
pub impl TJsValue for Document with to_js(self : Document) -> JsValue = "%identity"

///|
#cfg(target="js")
extern "js" fn Document::document_ffi() -> Document =
  #| () => document

///|
#cfg(target="wasm-gc")
fn Document::document_ffi() -> Document = "webapi_Document" "new"

///|
pub fn Document::document() -> Document {
  Document::document_ffi()
}

///|
#cfg(target="wasm-gc")
fn Document::body_ffi(self : Document) -> HTMLBodyElement = "webapi_Document" "body"

///|
#cfg(target="js")
extern "js" fn Document::body_ffi(self : Document) -> HTMLBodyElement =
  #| (self) => self.body

///|
pub fn Document::body(self : Document) -> HTMLBodyElement {
  Document::body_ffi(self)
}

///|
pub let document : Document = Document::document()

///|
#cfg(target="wasm-gc")
fn Document::query_selector_ffi(
  self : Document,
  selector : String,
) -> HTMLButtonElement = "webapi_Document" "querySelector"

///|
#cfg(target="js")
extern "js" fn Document::query_selector_ffi(
  self : Document,
  selector : String,
) -> HTMLButtonElement =
  #| (self, selector) => self.querySelector(selector)

///|
pub fn Document::query_selector(
  self : Document,
  selector : String,
) -> HTMLButtonElement {
  Document::query_selector_ffi(self, selector)
}
