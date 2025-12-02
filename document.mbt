///|
#external
pub type Document

///|
pub impl TJsValue for Document with to_js(self : Document) -> JsValue = "%identity"

///|
fn Document::document() -> Document = "webapi_Document" "new"

///|
pub let document : Document = Document::document()

///|
pub fn Document::body(self : Document) -> HTMLBodyElement = "webapi_Document" "body"

///|
pub fn Document::query_selector(
  self : Document,
  selector : String,
) -> HTMLButtonElement = "webapi_Document" "querySelector"
