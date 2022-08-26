import { Controller } from "@hotwired/stimulus"
import flatpickr from "flatpickr"
import rangePlugin from "flatpickr/dist/plugins/rangePlugin";

export default class extends Controller {
  static targets = [ 'startDateInput', 'endDateInput' ]
  static values = { dates: Object }

  connect() {
    this.#initFlatPickr()
  }

  #initFlatPickr() {
    console.log(document.querySelector(".datepicker"))
    flatpickr(this.startDateInputTarget, this.#options());
  }

  #options() {
    return {
      ...this.#parsedBookedDates(),
      enableTime: true,
      minDate: new Date(),
      mode: 'range',
      "plugins": [new rangePlugin({ input: this.endDateInputTarget})]
    }
  }

  #parsedBookedDates() {
    return this.datesValue
  }

  send(event){
    Swal.fire({
      icon: 'warning',
      title: 'OOPPPSSSS Something went wrong !',
      showConfirmButton: false,
      timer: 2000
    })
  }
}
