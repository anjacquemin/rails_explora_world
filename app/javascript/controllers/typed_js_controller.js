import { Controller } from "@hotwired/stimulus"
import Typed from "typed.js"

export default class extends Controller {
  connect() {
    new Typed(this.element, {
      strings: ["EXPLORA WORLD", "EXPLORA WORLD"],
      typeSpeed: 75,
      loop: true
    });
  }
}
