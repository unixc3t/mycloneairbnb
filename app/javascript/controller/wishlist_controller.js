import { Controller } from "@hotwired/stimulus";

export default class extends Controller {

  updateWishlistStatus() {
    const isUserLoggedIn = this.element.dataset.userLoggedIn;

    if(isUserLoggedIn === "false"){
      document.querySelector(".js-login").click()
      return;
    }

    if (this.element.dataset.status === "false") {
      this.element.classList.remove("fill-none");
      this.element.classList.add("fill-red-500");
      this.element.dataset.status = "true";
    } else {
      this.element.classList.remove("fill-red-500");
      this.element.classList.add("fill-none");
      this.element.dataset.status = "false";
    }
  }
}
