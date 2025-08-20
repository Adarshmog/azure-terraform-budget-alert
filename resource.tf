data "azurerm_subscription" "current" {}

data "azurerm_resource_group" "vmss_rg" {
  name = "EARTH"
}

resource "azurerm_consumption_budget_resource_group" "vmss_budget" {
  name              = "vmss-budget-alert"
  resource_group_id = data.azurerm_resource_group.vmss_rg.id
  amount            = 50 
  time_grain        = "Monthly"

  time_period {
    start_date = "2025-08-01T00:00:00Z"
    end_date   = "2026-08-01T00:00:00Z"
  }

  notification {
    enabled   = true
    threshold = 80 
    operator  = "GreaterThan"

    contact_emails = [
      "adarshmoger2000@gmail.com"
    ]
  }
}

