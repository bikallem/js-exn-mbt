///|
#external
pub type JsValue

///|
pub trait TJsValue {
  to_js(Self) -> JsValue = _
}

///|
impl TJsValue with to_js(self : Self) -> JsValue = "%identity"

///|
pub impl TJsValue for Bool with to_js(self : Bool) -> JsValue = "%identity"

///|
#external
type HTMLButtonElement

///|
pub impl TJsValue for HTMLButtonElement

///|
#external
type Event

///|
pub impl TJsValue for Event

///|
#external
type Document

///|
pub impl TJsValue for Document

///|
#external
type HTMLBodyElement

///|
pub impl TJsValue for HTMLBodyElement

///|
#external
type AbortSignal

///|
pub impl TJsValue for AbortSignal

///|
#external
type AddEventListenerOptions

///|
pub impl TJsValue for AddEventListenerOptions

///|
/// Third parameter of addEventListener()
pub trait AddEventListenerParam3: TJsValue {}

///|
pub impl AddEventListenerParam3 for Bool

///|
pub impl AddEventListenerParam3 for AddEventListenerOptions

///|
#external
type EventListenerOptions

///|
pub impl TJsValue for EventListenerOptions

///|
/// Third parameter of removeEventListener()
pub trait RemoveEventListenerParam3: TJsValue {}

///|
pub impl RemoveEventListenerParam3 for Bool

///|
pub impl RemoveEventListenerParam3 for EventListenerOptions
