///|
fn main {
  let document = Document::new()
  let button = HTMLButtonElement::new("Click me!")
  let event_handler = cb(_ => println("Button clicked!"))
  button.add_event_listener("click", event_handler)
  let body = document.body()
  body.append_child(button)

  // // Add click handler button
  // let add_click_handler_btn = HTMLButtonElement::new("Add click handler")
  // add_click_handler_btn.add_event_listener(
  //   "click",
  //   cb(_ => button.add_event_listener("click", event_handler)),
  // )
  // body.append_child(add_click_handler_btn)

  // // Remove click handler button
  // let remove_click_handler_btn = HTMLButtonElement::new("Remove click handler")
  // remove_click_handler_btn.add_event_listener(
  //   "click",
  //   cb(_ => button.remove_event_listener("click", event_handler)),
  // )
  // body.append_child(remove_click_handler_btn)

  // // click once button
  // let click_once_btn = HTMLButtonElement::new("Click once")
  // click_once_btn.add_event_listener(
  //   "click",
  //   cb(_ => println("Button clicked once!")),
  //   options=add_event_listener_options(capture=true),
  // )
  // body.append_child(click_once_btn)
}
