///|
fn main {
  let document = Document::document()
  let button = create_button("Click me!")
  let event_handler = (_ : Event) => println("Button clicked!")
  button.add_event_listener("click", event_handler)
  let body = document.body()
  body.append_child(button)

  // Add click handler button
  let add_click_handler_btn = create_button("Add click handler")
  add_click_handler_btn.add_event_listener("click", (_ : Event) => button.add_event_listener(
    "click", event_handler,
  ))
  body.append_child(add_click_handler_btn)

  // Remove click handler button
  let remove_click_handler_btn = create_button("Remove click handler")
  remove_click_handler_btn.add_event_listener("click", (_ : Event) => button.remove_event_listener(
    "click", event_handler,
  ))
  body.append_child(remove_click_handler_btn)
}
