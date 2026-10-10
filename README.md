# Wedley: wedding budget site prototype

A click-through prototype for class. Plain HTML, CSS and JavaScript: no install, no API, no backend. All prices are sample numbers calculated in the browser.

## Run it

In Cursor, open the terminal (Ctrl + `), and run:

```
python3 -m http.server 5173 --directory ~/Desktop/wedding-budget-app
```

If the browser shows an old version after an edit, hard refresh (Cmd + Shift + R). The page is marked no-store so this should be rare.

```
```

Then open http://localhost:5173 in your browser. Press Ctrl + C in the terminal to stop the server.

## What it does

- Dashboard: once the budget is built, the home screen is one connected dashboard: money with the pie, who pays, countdown and next tasks, the six budget sliders with their option dropdowns (filter live as you drag), the smaller lines, picks with the reality check, rentals and resale, inspiration, and this month's calendar. Share it by link or Excel.
- Helpers and agreements: add Mom, Dad or anyone. Tap what they cover, set a cap, assign tasks. Each person gets their own link that shows only their part in plain words ("catering up to $4,000 and no more") with a yes button. Anything over a cap falls back to the couple. Owners show on the calendar.
- Business model on the landing page: free for couples; 10% + 5% on rentals, 8% vendor referral fee, and a $39 one-time Plus plan for unlimited helpers, reminders and printable agreements.
- All features: the last nav tab stacks every screen on one page with a short note on each. Press "Fill with sample picks" to populate everything at once for a demo.

- Budget planner: set a total, where the wedding is, guest count and up to 3 priorities. The split updates live. Each category row opens inline to show the options that fit the slider amount; drag the slider and over-budget options drop out of the list live. Add a pick without leaving the page.
- Growth loops: reserve a vendor pick with a 20% deposit held in escrow (vendor pays an 8% fee, couple pays nothing), an insurance task with a referral partner, a one-tap "List what I bought" resale prompt on the dashboard, and a "Start my own plan" button on every helper's page.
- Real sample prices: every option is a base cost plus a per-guest cost, scaled by region (small town, mid-size city, major metro). Prices stay the same when the budget changes, so "in range" and "over" mean something.
- Guest stepper: tap −10 / +10 on the dashboard and watch the per-guest savings.
- Smaller lines: cake, invitations, decor, rings and officiant are named lines instead of a hidden "everything else".
- Reality check: My picks adds tax, tips, fees, alterations, vendor meals and a 5% overage to show the real total.
- DIY time cost: DIY options show hours and helpers needed; the schedule's DIY task totals them.
- Inspiration: each look is priced across the categories it touches, with a DIY cost and hours.
- Schedule: a countdown (days, months, weeks), a four-phase progress strip, and a month calendar with every task on its due date. Switch to the checklist view for the grouped list. If the date is under 12 months out, the plan is compressed to fit.
- Saving: progress is stored in the browser. "Copy share link" on My picks makes a link that opens the same plan anywhere. "Start over" in the footer clears it.
- Rentals marketplace: peer-to-peer listings for arches, tables, tents, lights, linens, sound gear, dresses and local services. Filter by category, search, and add items to the budget. Anyone can list an item with a live earnings estimate.
- Business model: free to browse and list. The owner pays a 10% commission and the renter a 5% service fee on each booking. The numbers are `OWNER_CUT` and `RENTER_FEE` in `app.js`, and the page shows the split on an example listing.
- Export: Excel file with Budget, Hidden costs, Rentals and Summary sheets.

## Files

- `index.html`: the page shell
- `styles.css`: all the styling (colors are at the top)
- `app.js`: the screens, sample data and click handling. Set `APP_NAME` at the top. Prices live in `CATS`, `LINES`, `REGIONS` and `LOOKS` near the top.
- `xlsx.full.min.js`: the SheetJS library that writes the Excel export. No need to edit it.
