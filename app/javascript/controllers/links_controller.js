import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="links"
export default class extends Controller {
  static targets = ["button"]
  connect() {
    console.log("testing")
  }
  copy(){
    navigator.clipboard.writeText(this.buttonTarget.value)
    this.buttonTarget.innerHTML = "Copied!"
  }
}
