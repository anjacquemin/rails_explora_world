import { Controller } from "stimulus"

export default class extends Controller {
  static targets = [ "" ]

  connect() {
  }

  openTab (event) {
    const target = event.currentTarget.dataset.tab;
    const tab = document.querySelector(`#${target}`);

    // this.bookingsTarget.classlist.toggle("active")
    const tab1 = document.querySelector("#my-visits");
    const tab2 = document.querySelector("#my-flashcards");
    const tab2 = document.querySelector("#my-map");

    console.log(tab)
    console.log(tab1)
    console.log(tab2)

    const button1 = document.querySelector("#button1");
    const button2 = document.querySelector("#button2");
    const button5 = document.querySelector("#button5");
    console.log(target)


    // // console.log(tab)
    tab1.classList.add("d-none")
    tab2.classList.add("d-none")
    tab3.classList.add("d-none")
    tab.classList.remove("d-none")

    // button1.classList.remove("tabgrey")
    // button2.classList.remove("tabgrey")
    // button3.classList.remove("tabgrey")
    // console.log(event.currentTarget)
    // event.currentTarget.classList.add("tabgrey")

  }
}
