interface Window {
  Stimulus: import("@hotwired/stimulus").Application;
}

// Type declarations for JavaScript modules without type definitions
declare module "@rails/activestorage" {
  export function start(): void;
}

declare module "@rails/actioncable" {
  interface Cable {
    subscriptions: {
      create(
        channel: string | object,
        obj?: object,
      ): {
        unsubscribe(): void;
      };
    };
  }
  export function createConsumer(url?: string): Cable;
}

declare module "bootstrap" {
  // Bootstrap JS side-effect import — no explicit exports needed
}
