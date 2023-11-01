defmodule FreelancerRates do
  def daily_rate(hourly_rate), do:
    hourly_rate * 8.0

  def apply_discount(before_discount, discount), do:
    before_discount - (before_discount * discount / 100)

  def monthly_rate(hourly_rate, discount), do:
    apply_discount(daily_rate(hourly_rate) * 22, discount)
    |> ceil

  def days_in_budget(budget, hourly_rate, discount), do:
    budget / apply_discount(daily_rate(hourly_rate), discount)
    |> Float.floor(1)
end
