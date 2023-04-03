import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="steps"
export default class extends Controller {
  static targets = ["stepsList"]

  connect() {
    console.log("Steps connected")
    document.addEventListener("turbo:before-visit", (event) => {
    })
  }

  updateSteps(event) {
    let stepCount = event.params.step
    console.log(stepCount)
    console.log(event.params)
    let steps = this.stepsListTarget.children
    let i = 0
    while(i<=stepCount){
      steps[i].classList.add('step-neutral')
      steps[i].setAttribute('id', i)
      i++
    }
    event
  }
  updateLastStep(event){
    document.getElementById("last").classList.add('step-neutral')
  }
}
