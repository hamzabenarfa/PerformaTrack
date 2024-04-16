// app/javascript/controllers/dropdown_controller.js
import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["menu"]

  connect() {
    this.handleClickOutside = this.handleClickOutside.bind(this);
  }

  toggle(event) {
    event.stopPropagation();
    this.menuTarget.classList.toggle('hidden');
  }

  hide(event) {
    if (!this.element.contains(event.target)) {
      this.menuTarget.classList.add('hidden');
    }
  }

  handleClickOutside(event) {
    if (this.menuTarget && !this.menuTarget.contains(event.target) && !this.menuTarget.classList.contains('hidden')) {
      this.menuTarget.classList.add('hidden');
    }
  }

  disconnect() {
    window.removeEventListener("click", this.handleClickOutside);
  }
}
