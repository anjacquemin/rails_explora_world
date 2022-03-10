import { Controller } from "stimulus"

export default class extends Controller {
  static targets = [ "" ]

  connect() {
  }

  openTab (event) {
    const target = event.currentTarget.dataset.tab;
    const tab = document.querySelector(`#${target}`);

    // this.bookingsTarget.classlist.toggle("active")
    const tab1 = document.querySelector("#future-visits");
    const tab2 = document.querySelector("#past-visits");

    // console.log(tab)
    // console.log(tab1)
    // console.log(tab2)

    const button3 = document.querySelector("#button3");
    const button4 = document.querySelector("#button4");
    // console.log(target)


    // // console.log(tab)
    tab1.classList.add("d-none")
    tab2.classList.add("d-none")
    tab.classList.remove("d-none")

    // button1.classList.remove("tabgrey")
    // button2.classList.remove("tabgrey")
    // button3.classList.remove("tabgrey")
    // console.log(event.currentTarget)
    // event.currentTarget.classList.add("tabgrey")

  }
}
