import { Controller } from "@hotwired/stimulus";
import { enter, leave, toggle } from "el-transition";

export default class extends Controller {
  static targets = ["openMenu", "dropDown"];

  connect() {
    this.openMenuTarget.addEventListener("click", (e) => {
      openDropDown(this.dropDownTarget);
    });
  }
}

function openDropDown(element){
  toggle(element)
}
