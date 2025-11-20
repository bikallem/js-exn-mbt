///|
fn main {
  let document = Document::document()
  let button = HTMLButtonElement::new("Click me!")
  let event_handler = (_ : Event) => println("Button clicked!")
  button.add_event_listener("click", event_handler)
  let body = document.body()
  body.append_child(button)

  // Add click handler button
  let add_click_handler_btn = HTMLButtonElement::new("Add click handler")
  add_click_handler_btn.add_event_listener("click", (_ : Event) => button.add_event_listener(
    "click", event_handler,
  ))
  body.append_child(add_click_handler_btn)

  // Remove click handler button
  let e : AddEventListenerOptions = add_event_listener_options(once=true)
  let remove_click_handler_btn = HTMLButtonElement::new("Remove click handler")
  remove_click_handler_btn.add_event_listener("click", (_ : Event) => button.remove_event_listener(
    "click",
    event_handler,
    options=e,
  ))
  body.append_child(remove_click_handler_btn)

  // click once button
  let click_once_btn = HTMLButtonElement::new("Click once")
  click_once_btn.add_event_listener(
    "click",
    (_ : Event) => println("Button clicked once!"),
    options=event_listener_options(capture=true),
  )
  body.append_child(click_once_btn)
}

// Trait object issue

///|
trait C {
  to_js(Self) -> JsValue = _
}

///|
impl C with to_js(self : Self) -> JsValue = "%identity"

///|
trait T_A: C {
  id(Self) -> Unit = _
}

///|
impl T_A with id(_) -> Unit {
  ()
}

///|
struct A(Int)

///|
impl T_A for A

///|
impl C for A

///|
trait T_B: C {
  id(Self) -> Unit = _
}

///|
impl T_B with id(_) -> Unit {
  ()
}

///|
impl T_B for B

///|
impl C for B

///|
struct B(String)

///|
impl T_B for B

///|
fn foo(_a : &T_A) -> Unit {
  println("foo called with &T_A")
}

///|
fn bar(_b : &T_B) -> Unit {
  println("bar called with &T_B")
}

///|
fn call() -> Unit {
  let a : &T_A = A(1)
  let _ = a.to_js() // a is not empty
  let b : &T_B = B("2")
  let _ = b.to_js() // b is not empty
  foo(a) // a is &T_A and foo takes &T_A
  // foo(b) // b is &T_B and foo takes &T_A -- what is going on here??
  // bar(a) // a is &T_A but bar takes &T_B -- what is going on here??
  bar(b) // b is &T_B and bar takes &T_B
}
