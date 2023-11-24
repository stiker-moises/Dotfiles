alsa_monitor.enabled = true

alsa_monitor.properties = {
  -- Create a JACK device. This is not enabled by default because
  -- it requires that the PipeWire JACK replacement libraries are
  -- not used by the session manager, in order to be able to
  -- connect to the real JACK server.
  --["alsa.jack-device"] = false,

  -- Reserve devices via org.freedesktop.ReserveDevice1 on D-Bus
  -- Disable if you are running a system-wide instance, which
  -- doesn't have access to the D-Bus user session
  ["alsa.reserve"] = true,
  --["alsa.reserve.priority"] = -20,
  --["alsa.reserve.application-name"] = "WirePlumber",

  -- Enables MIDI functionality
  ["alsa.midi"] = true,

  -- Enables monitoring of alsa MIDI devices
  ["alsa.midi.monitoring"] = true,

  -- MIDI bridge node properties
  ["alsa.midi.node-properties"] = {
    -- Name set for the node with ALSA MIDI ports
    ["node.name"] = "Midi-Bridge",
    -- Removes longname/number from MIDI port names
    --["api.alsa.disable-longname"] = true,
  },

  -- These properties override node defaults when running in a virtual machine.
  -- The rules below still override those.
  ["vm.node.defaults"] = {
    ["api.alsa.period-size"] = 256,
    ["api.alsa.headroom"] = 8192,
  },
}

alsa_monitor.rules = {
  -- An array of matches/actions to evaluate.
  --
  -- If you want to disable some devices or nodes, you can apply properties per device as the following example.
  -- The name can be found by running pw-cli ls Device, or pw-cli dump Device
  --{
  --  matches = {
  --    {
  --      { "device.name", "matches", "name_of_some_disabled_card" },
  --    },
  --  },
  --  apply_properties = {
  --    ["device.disabled"] = true,
  --  },
  --}
	{
    -- Rules for matching a device or node. It is an array of
    -- properties that all need to match the regexp. If any of the
    -- matches work, the actions are executed for the object.
		matches = {
			{
				--This matches all cards.
				{ "device.name", "matches", "alsa_card.*" },
			},
		},
    -- Apply properties on the matched object.
		apply_properties = {
      -- Use ALSA-Card-Profile devices. They use UCM or the profile
      -- configuration to configure the device and mixer settings.
			["api.alsa.use-acp"] = true,

      -- Use UCM instead of profile when available. Can be
      -- disabled to skip trying to use the UCM profile.
      --["api.alsa.use-ucm"] = true,

      -- Don't use the hardware mixer for volume control. It
      -- will only use software volume. The mixer is still used
      -- to mute unused paths based on the selected port.
      --["api.alsa.soft-mixer"] = false,

      -- Ignore decibel settings of the driver. Can be used to
      -- work around buggy drivers that report wrong values.
      --["api.alsa.ignore-dB"] = false,

      -- The profile set to use for the device. Usually this is
      -- "default.conf" but can be changed with a udev rule or here.
      --["device.profile-set"] = "profileset-name",

      -- The default active profile. Is by default set to "Off".
      --["device.profile"] = "default profile name",

      -- Automatically select the best profile. This is the
      -- highest priority available profile. This is disabled
      -- here and instead implemented in the session manager
      -- where it can save and load previous preferences.
			["api.acp.auto-profile"] = false,

      -- Automatically switch to the highest priority available port.
      -- This is disabled here and implemented in the session manager instead.
			["api.acp.auto-port"] = false,

      -- Other properties can be set here.
			--["device.nick"] = "My Device",
		},
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
			--["node.nick"]              = "My Node",
			--["node.description"]       = "My Node Description",
			--["node.pause-on-idle"]     = false,
			--["audio.format"]           = "S16LE",
			--["audio.rate"]             = 44100,
			--["audio.allowed-rates"]    = "32000,96000",
			--["audio.position"]         = "FL,FR",
			--["api.alsa.period-size"]   = 1024,
			--["api.alsa.period-num"]    = 2,
			--["api.alsa.headroom"]      = 0,
			--["api.alsa.start-delay"]   = 0,
			--["api.alsa.disable-mmap"]  = false,
			--["api.alsa.disable-batch"] = false,
			--["api.alsa.use-chmap"]     = false,
			--["latency.internal.rate"]  = 0,
			--["latency.internal.ns"]    = 0,
			["session.suspend-timeout-seconds"] = 7200,  -- 0 disables suspend
		},
	},
	{
		matches = {
			{
				{"node.name", "matches", "alsa_output.pci*"},
			},
		},
		apply_properties = {
			["api.alsa.disable-batch"] = true,
			--["alsa.resolution_bits"] = 32,
			["api.alsa.headroom"]      = 0,
			--["api.alsa.period-size"]   = 64,
			--["audio.rate"]   = 196000,
		},
	},
	{
		matches = {
			{
				{ "device.name", "matches", "alsa_card.pci-0000_06_00*" },
			},
		},
		apply_properties = {
			["device.name"] = "alsa_card.pci-0000_06_00",
		},
	},
	{
		matches = {
			{
				{ "device.name", "matches", "alsa_card.pci-0000_0a_00*" },
			},
		},
		apply_properties = {
			["device.name"] = "alsa_card.pci-0000_0a_00",
		},
	},
	{
		matches = {
			{
				{ "device.name", "matches", "alsa_card.usb-Creative_Technology_Ltd_Sound_Blaster_X4*" },
			},
		},
		apply_properties = {
			["device.name"] = "alsa_card.usb-Creative_Technology_Ltd_Sound_Blaster_X4",
		},
	},

	{
		matches = {
			{
				{ "node.name", "matches", "alsa_input.usb-BLUE_MICROPHONE_Blue_Snowball*" },
			},
		},
		apply_properties = {
			["api.alsa.disable-batch"] = true,
			["api.alsa.headroom"]      = 0,
			--["api.alsa.period-size"]   = 1,
			--["audio.rate"]   = 196000,
		},
	},
}