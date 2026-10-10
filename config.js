// Wedly backend settings. Leave everything blank and the site works on one device only.
// Fill these in (see backend/README.md) to turn on cloud sync, Pinterest import and test deposits.
window.WEDLY_CONFIG = {
  SUPABASE_URL: '',          // e.g. https://abcdefgh.supabase.co
  SUPABASE_ANON_KEY: '',     // the "anon public" key from Supabase, safe to put in a web page
  PINTEREST_PROXY: '',       // e.g. https://wedly-pins.yourname.workers.dev
  STRIPE_DEPOSIT_LINK: '',   // a Stripe Payment Link in test mode, "customer chooses amount"
};
