///|
extern "js" fn Document::document() -> Document =
  #| () => document

///|
pub extern "js" fn Document::body(self : Document) -> HTMLBodyElement =
  #| (self) => self.body

///|
pub extern "js" fn Document::query_selector(
  self : Document,
  selector : String,
) -> HTMLButtonElement =
  #| (self, selector) => self.querySelector(selector)
