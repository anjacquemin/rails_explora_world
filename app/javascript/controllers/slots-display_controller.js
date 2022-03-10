import { Controller } from "@hotwired/stimulus"

export default class extends Controller {

  static targets = ["slots", "globaldiv", "description"]

  connect() {
    // console.log("Hello from our first Stimulus controller")
  }

  display() {
    // console.log(`display activated`)
    this.slotsTarget.classList.remove("d-none")
    // this.globaldivTarget.classList.add("very-gray-background")
    this.globaldivTarget.setAttribute("id", "very-gray-background")
    this.descriptionTarget.setAttribute("id", "very-gray-background")
    // console.log (this.sglobaldivTarget)
  }

}
