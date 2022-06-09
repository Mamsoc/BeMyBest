// Entry point for the build script in your package.json
import "@hotwired/turbo-rails"
import "./controllers"
import "bootstrap"
import 'js-confetti'

if(document.querySelector(".alert")) {
  setTimeout(() => {
    document.querySelector(".alert").style.display="none"
  }, 1000);
}
