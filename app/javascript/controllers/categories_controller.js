import { Controller } from "stimulus"

export default class extends Controller {
  static targets = [ "card" ]

  connect() {
  }

  openTab (event) {
    const target = event.currentTarget.dataset.tab;
    const tab = document.querySelector(`#${target}`);

    console.log(target)
    console.log(tab)


    // this.bookingsTarget.classlist.toggle("active")
    const tab1 = document.querySelector("#Museums");
    const tab2 = document.querySelector("#Monuments");
    const tab3 = document.querySelector("#Neighborhoods");


    // console.log(tab1)
    // console.log(tab2)

    // const button6 = document.querySelector("#button6");
    // const button7 = document.querySelector("#button7");
    // const button8 = document.querySelector("#button8");


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
