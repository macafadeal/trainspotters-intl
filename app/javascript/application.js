// app/javascript/application.js
import "bootstrap";
import "@hotwired/turbo-rails";
import "./controllers";
import * as ActiveStorage from "@rails/activestorage";

ActiveStorage.start();

// Add page-specific modules here keyed by document.body.dataset.page value:
// const pageModules = {
//   pages_index: () => import("./pages/pages_index"),
// };
