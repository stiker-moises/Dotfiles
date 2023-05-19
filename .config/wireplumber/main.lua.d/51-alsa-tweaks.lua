rule = {
	matches = {
		{
			{"device.name", "matches", "alsa_card.usb-046d_HD_Pro_Webcam_C920*"}
		},
		{
			{"device.name", "matches", "alsa_card.usb-Sony_Interactive_Entertainment_Wireless_Controller*"}
		},
	},
	apply_properties = {
		["device.disabled"] = true,
	},
	{
		matches = {
			{
			-- Matches all sources.
				{ "node.name", "matches", "alsa_input.*" },
			},
			{
			-- Matches all sinks.
				{ "node.name", "matches", "alsa_output.*" },
			},
		},
		apply_properties = {
			["session.suspend-timeout-seconds"] = 7200,
		},
	},
}

table.insert(alsa_monitor.rules, rule)
