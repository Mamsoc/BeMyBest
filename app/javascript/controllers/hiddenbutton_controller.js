import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="hiddenbutton"
export default class extends Controller {
  static targets = ["items", "form"]
  connect() {
    console.log(this.element)
    console.log(this.itemsTarget)
    console.log(this.formTarget)
  }
}
