///|
#external
type Document

///|
pub impl TJsValue for Document

///|
pub fn Document::new() -> Document = "webapi_Document" "new"

///|
pub fn Document::body(self : Document) -> HTMLBodyElement = "webapi_Document" "body"

///|
pub fn Document::query_selector(
  self : Document,
  selector : String,
) -> HTMLButtonElement = "webapi_Document" "querySelector"
