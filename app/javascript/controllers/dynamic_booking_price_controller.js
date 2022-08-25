import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = [ 'startDateInput', 'endDateInput', 'priceHolder' ]
  static values = { price: Number }

  updatePrice() {
    const startDate = this.startDateInputTarget.value
    const endDate = this.endDateInputTarget.value

    const days = this.#diffInDays(startDate, endDate)

    // calculate total value based on the pokemon's
    // price_per_day and the number of days between the two dates
    // with the function #totalValue
    const totalValue = this.#totalValue(days)

    // Change the displayed value in the HTML with the function
    // #setPriceValue()
    this.#setPriceValue(totalValue)
  }

  #setPriceValue(value) {
    // Replace the text inside the priceHolder target with the value argument
    this.priceHolderTarget.innerText = value
  }

  #diffInDays(startDate, endDate) {
    // Calculate the difference between the two dates only if they both
    // are defined (they are undefined if an input has no value)
    if (startDate && endDate) {
      // retrieve the difference between the two dates in milliseconds
      const diffTime = (Date.parse(endDate) - Date.parse(startDate))
      // Turn milliseconds to days
      var days = Math.ceil(diffTime / (1000 * 60 * 60 * 24))
    } else {
      var days = 0
    }
    // Add 1 day by default
    return days + 1
  }

  #totalValue(days) {
    // Multiply the pokemon's price_per_day by the number of days
    return (days) * this.priceValue
  }
}
