export const SWITCH_CURRENCY = "SWITCH_CURRENCY";

export const selectCurrency = (base, rates) => ({
  type: SWITCH_CURRENCY,
  baseCurrency: base,
  rates: rates
});
