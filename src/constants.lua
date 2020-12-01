local constants = {}

-- CALCULATORS

constants.energy_source_calculators = {
  burner = {
    prototype_name = "burner_prototype",
    measure = "materials"
  },
  electric = {
    prototype_name = "electric_energy_source_prototype",
    measure = "electricity"
  },
  fluid = {
    prototype_name = "fluid_energy_source_prototype",
    measure = "materials"
  },
  heat = {
    prototype_name = "heat_energy_source_prototype",
    measure = "heat"
  }
}

-- SELECTION TOOL

-- every entity type will get their energy source processed
constants.entity_type_data = {
  ["accumulator"] = {},
  ["arithmetic-combinator"] = {},
  ["assembling-machine"] = {
    blacklist = {
      -- mining drones - https://mods.factorio.com/mod/Mining_Drones
      ["mining-depot"] = true,
      -- transport drones - https://mods.factorio.com/mod/Transport_Drones
      ["buffer-depot"] = true,
      ["fuel-depot"] = true,
      ["request-depot"] = true,
      ["supply-depot"] = true
    },
    materials_calculator = "recipe"
  },
  ["beacon"] = {},
  ["boiler"] = {
    materials_calculator = "boiler"
  },
  ["burner-generator"] = {},
  ["decider-combinator"] = {},
  ["electric-energy-interface"] = {},
  ["electric-turret"] = {},
  ["furnace"] = {
    blacklist = {
      -- transport drones - https://mods.factorio.com/mod/Transport_Drones
      ["fluid-depot"] = true
    },
    materials_calculator = "recipe"
  },
  ["generator"] = {
    materials_calculator = "generator"
  },
  -- NOTE: inserters don't support pollution
  ["inserter"] = {},
  ["lab"] = {
    materials_calculator = "lab"
  },
  ["lamp"] = {},
  ["mining-drill"] = {
    materials_calculator = "mining-drill"
  },
  ["offshore-pump"] = {
    materials_calculator = "offshore-pump"
  },
  ["programmable-speaker"] = {},
  ["pump"] = {
    calculators = {
    }
  },
  ["radar"] = {
    calculators = {
    }
  },
  -- reactor has special logic for processing its heat output
  ["reactor"] = {},
  ["roboport"] = {},
  ["solar-panel"] = {},
  ["rocket-silo"] = {
    materials_calculator = "recipe"
  }
}

constants.selection_tools = {
  all = {i = 1, color = {r = 1, g = 1}, label = "All", selection_box = "entity"},
  materials = {i = 2, color = {r = 0.5, g = 1}, label = "Materials", selection_box = "copy"},
  electricity = {i = 3, color = {57, 156, 251}, label = "Electricity", selection_box = "electricity"},
  -- pollution = {i = 4, color = {r = 1, g = 0.3, b = 0.3}, label = "Pollution", selection_box = "not-allowed"},
  heat = {i = 4, color = {r = 1, g = 0.5, }, label = "Heat", selection_box = "entity"}
}

-- for scrolling
constants.selection_tool_measures = {}
for k in pairs(constants.selection_tools) do
  constants.selection_tool_measures[#constants.selection_tool_measures+1] = k
end

-- UNITS

local units = {
  materials_per_second = "rcalc-gui-units.materials-per-second",
  materials_per_minute = "rcalc-gui-units.materials-per-minute",
  transport_belts = "rcalc-gui-units.transport-belts",
  train_wagons_per_second = "rcalc-gui-units.train-wagons-per-second",
  train_wagons_per_minute = "rcalc-gui-units.train-wagons-per-minute",
  power = "rcalc-gui-units.power"
}

local units_dropdown_localised = {}
local units_lookup = {}

local i = 0
for key, value in pairs(units) do
  i = i + 1
  units_dropdown_localised[i] = value
  units_lookup[key] = i
end

constants.units_dropdown_contents = units_dropdown_localised
constants.units_lookup = units_lookup

constants.units_to_setting_name = {
  [units_lookup.transport_belts] = "transport_belt",
  [units_lookup.train_wagons_per_second] = "wagon",
  [units_lookup.train_wagons_per_minute] = "wagon"
}

-- CHOOSE ELEM BUTTONS

constants.choose_elem_buttons = {
  [units_lookup.transport_belts] = {
    type = "transport_belt",
    filters = {{filter = "type", type = "transport-belt"}}
  },
  [units_lookup.train_wagons_per_second] = {
    type = "wagon",
    filters = {{filter = "type", type = "cargo-wagon"}, {filter = "type", type = "fluid-wagon"}}
  },
  [units_lookup.train_wagons_per_minute] = {
    type = "wagon",
    filters = {{filter = "type", type = "cargo-wagon"}, {filter = "type", type = "fluid-wagon"}}
  }
}

-- RATES

constants.rate_key_overrides = {
  ["entity.ee-infinity-accumulator-primary-output"] = {"entity", "ee-infinity-accumulator-tertiary-buffer"},
  ["entity.ee-infinity-accumulator-primary-input"] = {"entity", "ee-infinity-accumulator-tertiary-buffer"},
  ["entity.ee-infinity-accumulator-secondary-output"] = {"entity", "ee-infinity-accumulator-tertiary-buffer"},
  ["entity.ee-infinity-accumulator-secondary-input"] = {"entity", "ee-infinity-accumulator-tertiary-buffer"},
  ["entity.ee-infinity-accumulator-tertiary-output"] = {"entity", "ee-infinity-accumulator-tertiary-buffer"},
  ["entity.ee-infinity-accumulator-tertiary-input"] = {"entity", "ee-infinity-accumulator-tertiary-buffer"}
}

-- GUI

constants.widths = {
  en = {50, 75, 49, 84},
  ru = {62, 73, 92, 96}
}

return constants
