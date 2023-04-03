import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="forms"
export default class extends Controller {
  connect() {
    console.log("Connected")
  }
  redirect(event){
    console.log("Testing")
    if (event.detail.success){
      console.log("SUCCESS")
      const fetchResponse = event.detail.fetchResponse
      history.pushState(
        {turbo_frame_history: true},
      fetchResponse.response.url
      )
      Turbo.visit(fetchResponse.response.url)
    }
  }
}
