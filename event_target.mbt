// add_event_listener()

///|
#external
type AddEventListenerOptions

///|
pub impl TJsValue for AddEventListenerOptions

///|
/// Third parameter of addEventListener()
pub trait AddEventListenerParam3: TJsValue {
  id(Self) -> Unit = _ // dummy method to disallow empty trait equivalence
}

///|
impl AddEventListenerParam3 with id(_) -> Unit {
  ()
}

///|
pub impl AddEventListenerParam3 for Bool

///|
pub impl AddEventListenerParam3 for AddEventListenerOptions

// remove event_listener()

///|
#external
type EventListenerOptions

///|
pub impl TJsValue for EventListenerOptions

///|
/// Third parameter of removeEventListener()
pub trait RemoveEventListenerParam3: TJsValue {
  id(Self) -> Unit = _ // dummy method to disallow empty trait equivalence
}

///|
impl RemoveEventListenerParam3 with id(_) -> Unit {
  ()
}

///|
pub impl RemoveEventListenerParam3 for Bool

///|
pub impl RemoveEventListenerParam3 for EventListenerOptions
