import { Controller } from "@hotwired/stimulus"

export default class extends Controller {

  // static targets = [ 'startDateInput', 'endDateInput' ]

  connect() {
    console.log("Coucou from Alert")
  }

  send(event){
    Swal.fire({
      icon: 'success',
      title: 'Your van has been saved',
      showConfirmButton: false,
      timer: 1500
    })
  }

  hop(event){
    Swal.fire({
      icon: 'success',
      title: 'Your review has been saved',
      showConfirmButton: false,
      timer: 1500
    })
  }
}
