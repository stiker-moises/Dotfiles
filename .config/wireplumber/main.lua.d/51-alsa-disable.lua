rule = {
	matches = {
		{
			{"device.name", "equals", "alsa_card.usb-046d_HD_Pro_Webcam_C920_5E7A1F4F-02"}
		},
		{
			{"device.name", "equals", "alsa_card.usb-Sony_Interactive_Entertainment_Wireless_Controller-00"}
		},
	},
	apply_properties = {
		["device.disabled"] = true,
	},
}

table.insert(alsa_monitor.rules, rule)
