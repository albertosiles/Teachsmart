import { Controller } from "@hotwired/stimulus"
import { createConsumer } from "@rails/actioncable"


export default class extends Controller {
  static values = { chatroomId: Number }
  static targets = ["messages", "form"]

  connect() {
    this.channel = createConsumer().subscriptions.create(
      { channel: "ChatroomChannel", id: this.chatroomIdValue },
      {
        received: data => {
          this.messagesTarget.insertAdjacentHTML('beforeend', data);
          this.formTarget.reset();
        }
      }
    )
    console.log(`Subscribed to the chatroom with the id ${this.chatroomIdValue}.`)
  }
}
