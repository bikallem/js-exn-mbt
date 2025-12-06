///|
#external
pub type Document

///|
pub impl TJsValue for Document with to_js(self : Document) -> JsValue = "%identity"

///|
pub let document : Document = Document::document()
