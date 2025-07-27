_: {
  services.tlp = {
    enable = true;
    settings = {
      CPU_SCALING_GOVERNOR_ON_BAT = "powersave";
      CPU_ENERGY_PERF_POLICY_ON_BAT = "power";
      NMI_WATCHDOG = 0;
      SATA_LINKPWR_ON_BAT = "med_power_with_dipm min_power";
      WIFI_PWR_ON_BAT = "on";
      PCIE_ASPM_ON_BAT = "powersave";
      START_CHARGE_THRESH_BAT0 = 40;
      STOP_CHARGE_THRESH_BAT0 = 80;
    };
  };
}
