import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="forms"
export default class extends Controller {
  connect() {
  }
  redirect(event){
    if event.detail.success{
      const fetchResponse = event.detail.fetchResponse
      history.pushState(
        {turbo_frame_history: true},
      fetchResponse.response.url
      )
      Turbo.visit(fetchResponse.response.url)
    }
  }
}
