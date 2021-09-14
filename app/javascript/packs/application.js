// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.

import Rails from "@rails/ujs";
import Turbolinks from "turbolinks";
import * as ActiveStorage from "@rails/activestorage";
import "channels";

// ----------------------------------------------------
// Note(lewagon): ABOVE IS RAILS DEFAULT CONFIGURATION
// WRITE YOUR OWN JS STARTING FROM HERE 👇
// ----------------------------------------------------
Rails.start();
Turbolinks.start();
ActiveStorage.start();
// Internal imports, e.g:
// import { initSelect2 } from '../components/init_select2';
async function loadBootstrapIfNeeded() {
	const needsBootstrap =
		document.querySelector("[data-bs-toggle]") ||
		document.querySelector(
			".dropdown, .modal, .toast, .collapse, .offcanvas, .tooltip, .popover",
		);

	if (needsBootstrap) {
		await import("bootstrap");
	}
}

async function loadPageModule() {
	const page = document.body?.dataset?.page;
	if (!page) return;

	const key = page.replace("#", "_");

	try {
		await import(
			/* webpackChunkName: "page-[request]" */
			`../pages/${key}`
		);
	} catch (_err) {
		// no-op: page module is optional
	}
}

document.addEventListener("turbolinks:load", () => {
	void loadBootstrapIfNeeded();
	void loadPageModule();
});
