import { Controller } from "stimulus"

export default class extends Controller {
  static targets = [ "output" ]

  connect() {
   console.log('Hello, Stimulus!')
  }

  display() {

    if (window.scrollY >= window.innerHeight) {
      this.element.style.transform = "translateY(0px)"
      this.element.style.position = "fixed"
      this.element.style.width = "100%"
      this.element.style.top ="0"
      this.element.style.zIndex = "111111111111111"

    } else {
      this.element.style.transform = "translateY(-135px)"
    }
  }
}
