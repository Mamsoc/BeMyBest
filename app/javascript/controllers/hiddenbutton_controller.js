import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="hiddenbutton"
export default class extends Controller {
  static targets = ["input", "button"]
  static values = { response: String } // Add this

  connect() {
    // console.log(this.element)
    // console.log(this.inputTarget)
    // console.log(this.buttonTarget)

  }

  responseTrue() {
    const response = this.inputTarget.value
    console.log(response)
    console.log(this.responseValue)
    if (response != this.responseValue) {
      // .value pour convertir input en string
      this.buttonTarget.disabled = true
      this.buttonTarget.hidden = true
    } else {
      this.buttonTarget.disabled = false
      this.buttonTarget.hidden = false
    }
  }

}
