resource "azurerm_monitor_data_collection_rule" "dcr" {
  name                = "linuxvm-dcr"
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name

  destinations {
    log_analytics {
      workspace_resource_id = azurerm_log_analytics_workspace.law.id
      name                  = "law-destination"
    }
  }

  data_sources {
    performance_counter {
      name                          = "LinuxPerfCounters"
      streams                       = ["Microsoft-Perf"]
      sampling_frequency_in_seconds = 60

      counter_specifiers = [
        "\\Processor Information(_Total)\\% Processor Time",
        "\\Memory\\Available MBytes"
      ]
    }
  }

  data_flow {
    streams      = ["Microsoft-Perf"]
    destinations = ["law-destination"]
  }
}

resource "azurerm_monitor_data_collection_rule_association" "dcr_assoc" {
  name                    = "linuxvm-dcr-association"
  target_resource_id      = azurerm_linux_virtual_machine.vm.id
  data_collection_rule_id = azurerm_monitor_data_collection_rule.dcr.id
}
