import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="favorite"
export default class extends Controller {

  // static targets = ["heart"]

  connect() {
    this.csrfToken = document.querySelector('meta[name="csrf-token"]').getAttribute("content")
  }

  async fav(evt) {
    evt.preventDefault();
    console.log(evt.params.projectId)

    const options = {
      method: "PATCH",
      headers: { "Accept": "application/json", "X-CSRF-Token": this.csrfToken }
    }

    const response =  await fetch(`/projects/${evt.params.projectId}/fav`, options)
    const data = await response.json()

    if (data.favorite) {
      const previousfavorite = document.querySelector(".fa-solid")
      if (previousfavorite) {
        previousfavorite.classList.remove('fa-solid')
        previousfavorite.classList.add('fa-regular')
      }
      evt.target.classList.add('fa-solid')
      evt.target.classList.remove('fa-regular')
    } else {
      evt.target.classList.remove('fa-solid')
      evt.target.classList.add('fa-regular')
    }

    // if (data.previousfavorite){
    //   this.heartTarget.classList.remove('fa-solid')
    //   this.heartTarget.classList.add('fa-regular')
    // }
  }
}
