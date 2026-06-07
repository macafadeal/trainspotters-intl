interface Window {
  Stimulus: import("@hotwired/stimulus").Application;
}

// Type declarations for JavaScript modules without type definitions
declare module "@rails/activestorage" {
  export function start(): void;
}

declare module "bootstrap" {
  // Bootstrap JS side-effect import — no explicit exports needed
}
