--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- __________.__                                ________                          __               .__.__  __      __  .__    .__           _____.__.__              
-- \______   |  |   ____ _____    ______ ____   \______ \   ____     ____   _____/  |_    ____   __| _|___/  |_  _/  |_|  |__ |__| ______ _/ ____|__|  |   ____      
--  |     ___|  | _/ __ \\__  \  /  ____/ __ \   |    |  \ /  _ \   /    \ /  _ \   __\ _/ __ \ / __ ||  \   __\ \   __|  |  \|  |/  ___/ \   __\|  |  | _/ __ \     
--  |    |   |  |_\  ___/ / __ \_\___ \\  ___/   |    `   (  <_> ) |   |  (  <_> |  |   \  ___// /_/ ||  ||  |    |  | |   Y  |  |\___ \   |  |  |  |  |_\  ___/     
--  |____|   |____/\___  (____  /____  >\___  > /_______  /\____/  |___|  /\____/|__|    \___  \____ ||__||__|    |__| |___|  |__/____  >  |__|  |__|____/\___  > /\ 
--                     \/     \/     \/     \/          \/              \/                   \/     \/                      \/        \/                      \/  \/ 
--
--	Please do not edit this file!							Please do not edit this file!							Please do not edit this file!
--
--	Editing this file will cause you to be able to use Github Desktop to update!
--
--	Any changes you wish to make in this file you should be able to make by overloading. That is Re-Defining the same variables or functions in another file, by copying and
--	pasting them to a file that is loaded after the original file, all of my library files, and then job files are loaded first.
--	The last files to load are the ones unique to you. User-Globals, Charactername-Globals, Charactername_Job_Gear, in that order, so these changes will take precedence.
--
--	You may wish to "hook" into existing functions, to add functionality without losing access to updates or fixes I make, for example, instead of copying and editing
--	status_change(), you can instead use the function user_status_change() in the same manner, which is called by status_change() if it exists, most of the important 
--  gearswap functions work like this in my files, and if it's unique to a specific job, user_job_status_change() would be appropriate instead.
--
--  Variables and tables can be easily redefined just by defining them in one of the later loaded files: autofood = 'Miso Ramen' for example.
--  States can be redefined as well: state.HybridMode:options('Normal','PDT') though most of these are already redefined in the gear files for editing there.
--	Commands can be added easily with: user_self_command(commandArgs, eventArgs) or user_job_self_command(commandArgs, eventArgs)
--
--	If you're not sure where is appropriate to copy and paste variables, tables and functions to make changes or add them:
--		User-Globals.lua - 			This file loads with all characters, all jobs, so it's ideal for settings and rules you want to be the same no matter what.
--		Charactername-Globals.lua -	This file loads with one character, all jobs, so it's ideal for gear settings that are usable on all jobs, but unique to this character.
--		Charactername_Job_Gear.lua-	This file loads only on one character, one job, so it's ideal for things that are specific only to that job and character.
--
--
--	If you still need help, feel free to contact me or on discord or ask in my chat for help: https://discord.gg/ug6xtvQ
--  !Please do NOT message me in game about anything third party related, though you're welcome to message me there and ask me to talk on another medium.
--
--  Please do not edit this file!							Please do not edit this file!							Please do not edit this file!
-- __________.__                                ________                          __               .__.__  __      __  .__    .__           _____.__.__              
-- \______   |  |   ____ _____    ______ ____   \______ \   ____     ____   _____/  |_    ____   __| _|___/  |_  _/  |_|  |__ |__| ______ _/ ____|__|  |   ____      
--  |     ___|  | _/ __ \\__  \  /  ____/ __ \   |    |  \ /  _ \   /    \ /  _ \   __\ _/ __ \ / __ ||  \   __\ \   __|  |  \|  |/  ___/ \   __\|  |  | _/ __ \     
--  |    |   |  |_\  ___/ / __ \_\___ \\  ___/   |    `   (  <_> ) |   |  (  <_> |  |   \  ___// /_/ ||  ||  |    |  | |   Y  |  |\___ \   |  |  |  |  |_\  ___/     
--  |____|   |____/\___  (____  /____  >\___  > /_______  /\____/  |___|  /\____/|__|    \___  \____ ||__||__|    |__| |___|  |__/____  >  |__|  |__|____/\___  > /\ 
--                     \/     \/     \/     \/          \/              \/                   \/     \/                      \/        \/                      \/  \/ 
--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--Needed for the Stahp module.

--List of moves to activate cure Received gear on.

--List of moves to stun.
--Seperated move sets are ones that might want to be pulled out in some situations

StunAbility = 	  S{"Fulmination","Breakga","Death Scissors","Hell Scissors","Tera Slash",
					"Smouldering Swarm","Blackout","Tempestuous Upheaval", "Vespine Hurricane", "Stinger Volley", "Incisive Denouement",
					"Incisive Apotheosis","Death","Saurian Swamp","Saurian Slide", "Jungle Wallop", "Velkkan Pygmachia", "Barreling Smash",
					"Jungle Hoodoo","Merciless Mauling", "Galumph","Velkkan Ambush", "Rending Deluge", "Riptide Eupnea", "Sundering Snip",
					"Impenetrable Carapace", "Viscid Spindrift", "Venom Shower", "Protolithic Puncture", "Aquatic Lance","Pelagic Cleaver",
					"Tidal Guillotine", "Mayhem Lantern", "Whirling Inferno","Tarichutoxin", "Calcifying Mist", "Testudo Tremor",
					"Batholithic Shell", "Volcanic Stasis", "Tyrannical Blow", "Blistering Roar", "Meteor", "Kaustra", "Amnesic Blast",
					"Cruel Joke","Seismostomp","Torpid Glare","Danse Macabre", "Gates of Hades","Just Desserts","Sakra Storm",
					"Acheron Flame","No Quarter","Denounce","Naakual's Vengeance","Pestilent Penance","Infernal Deliverance","Malevolent Blessing",
					"Empty Salvation","Winds of Oblivion","Bewitching Lantern","Quenching Hammer","Dread Spikes","Yama's Judgment",
					"??? Needles","10000 Needles","4000 Needles","Slimy Proposal","Ruthlessness","Stalking Prey","Level 3 Petrify",
					"Chymous Reek","Crowning Flatus","Gnash 'n Guttle","Infected Illusion","Dynastic Gravitas","Fulminous Fury","Tartaric Sigil",
				   }

--"Raksha: Vengeance","Raksha: Judgment",

--List of moves to activate physical defense on.

PhysicalAbility = S{"Ripper Fang","Chomp Rush","Scythe Tail","Cyclotail","Delta Thrust","Spike Flail",
					"Head Butt","Tortoise Stomp","Painful Whip","Recoil Dive","Gnash","Deathgnash","Seismic Tail","Big Scissors",
					"Megascissors","Drill Branch","Pinecone Bomb","Predator Claws","Mountain Buster","Spinning Dive","Chaotic Strike",
					"Volt Strike","Rush","Flaming Crush","Double Punch","Death Scissors","Velkkan Pygmachia","Barreling Smash",
					"Merciless Mauling","Galumph","Velkkan Ambush","Cross Reaver","Seismostomp","Pentapeck","Swooping Frenzy",
					"From The Skies","Wild Horn","Amnesic Blast","Incensed Pummel","Asuran Claws","Eclipse Bite","Crescent Fang",
					"Moonlit Charge","Bone Crunch","Throat Stab","Hell Scissors","Impalement","Deadly Hold","Empty Thrash","View Sync",
					"Carousel","Vanity Dive","Quadratic Continuum","??? Needles","10000 Needles","4000 Needles","2000 Needles","1000 Needles",
					"Rhinowrecker","Sub-zero Smash","Benthic Typhoon","Diabolic Claw","Barbed Crescent","Jet Stream","Megalith Throw",
				   }

--List of moves to activate magical defense on.

MagicalAbility = S{"Stone III","Stone IV","Stone V","Stone VI","Stonega III","Stonega IV","Stonega V","Stoneja","Quake","Quake II",
					"Water III","Water IV","Water V","Water VI","Waterga III","Waterga IV","Waterga V","Waterja","Flood","Flood II",
					"Fire III", "Fire IV", "Fire V", "Fire VI","Firaga III","Firaga IV","Firaga V","Firaja","Flare","Flare II",
					"Blizzard III","Blizzard IV","Blizzard V","Blizzard VI","Blizzaga III","Blizzaga IV","Blizzaga V","Blizzaja","Freeze","Freeze II",
					"Aero III","Aero IV","Aero V","Aero VI","Aeroga III","Aeroga IV","Aeroga V","Aeroja","Tornado","Tornado II","Inferno",
					"Thunder III","Thunder IV", "Thunder V","Thunder VI","Thundaga III","Thundaga IV","Thundaga V","Thundaja","Burst","Burst II",
					"Earthen Fury","Geocrush", "Wind Blade","Tidal Wave","Grand Fall","Aerial Blast","Judgment Bolt","Meteor Strike","Thunderspark",
					"Thunderstorm","Heavenly Strike","Whirling Inferno","Foul Breath","Tetsudo Tremor","Palsynyxis","Leeching Current","Meteor","Comet",
					"Venom Shower","Marine Mayhem","Tidal Guillotine","Leafstorm","Ecliptic Meteor","Spirit Absorption",
					"Stygian Release","Atramentous Libations","Dragon Breath","Searing Light","Everyone's Grudge","Everyone's Rancor",
					"Pain Sync","Backdraft","Radiant Breath","Chaos Breath","Dark Orb","Spectral Floe","Zero Hour","Interference","Flank Opening",
					"Hellish Crescendo","Malign Invocation","Shadow Wreck","Stygian Cyclone",
				  }

--List of moves to activate resist defense on.

ResistAbility = S{"Death","Frond Fatale","Atropine Spore","Deracinator","Cruel Joke","Paralyga","Break","Breakga","Bad Breath","Sweet Breath","Torpefying Charge",
					"Sleep","Sleepga","Sleepga II","Bindga","Torpid Glare","Danse Macabre","Stalking Prey","Hemocladis","Mayhem Lantern","Absoloute Terror",
					"Fulmination","Chilling Roar","Maiden's Virelai","Entice","Psyche Suction","Scream","Fatal Scream","Tepal Twist","Bloom Fouette",
					"Petalback Spin","Potted Plant","Tiiimbeeer","Level 3 Petrify","Afflicting Gaze","Beleaguerment","Besieger's Bane","Deathly Diminuendo",
					"Enthrall","Shah Mat","Infected Illusion","Impact","Slimy Proposal","Spinning Fin","Nosferatu's Kiss","Ululation","Malevolent Blessing",
				 }

AoEAbility = S{"Frond Fatale","Atropine Spore","Deracinator","Cruel Joke","Paralyga","Breakga","Bad Breath","Sweet Breath","Torpefying Charge",
					"Sleepga","Sleepga II","Bindga","Torpid Glare","Stalking Prey","Hemocladis","Mayhem Lantern","Cyclotail","Tortoise Stomp",
					"Recoil Dive","Seismic Tail","Megascissors","Merciless Mauling","Galumph","Seismostomp","Swooping Frenzy","Wild Horn",
					"Stonega III","Stonega IV","Stonega V","Stoneja","Earthen Fury","Zero Hour",
					"Waterga III","Waterga IV","Waterga V","Waterja","Tidal Wave",
					"Firaga III","Firaga IV","Firaga V","Firaja","Inferno",
					"Blizzaga III","Blizzaga IV","Blizzaga V","Blizzaja","Level 3 Petrify",
					"Aeroga III","Aeroga IV","Aeroga V","Aeroja","Aerial Blast","Grand Fall",
					"Thundaga III","Thundaga IV","Thundaga V","Thundaja","Judgment Bolt","Thunderspark",
					"Whirling Inferno","Foul Breath","Tetsudo Tremor","Leeching Current","Meteor","Venom Shower","Marine Mayhem","Tidal Guillotine",
					"Leafstorm","Fulmination","Ecliptic Meteor","Atramentous Libations","Dragon Breath","Searing Light",
					"Empty Thrash","View Sync","Carousel","Vanity Dive","Chilling Roar","Scream","Fatal Scream","Tepal Twist","Bloom Fouette",
					"Petalback Spin","Potted Plant","Tiiimbeeer","Rhinowrecker","Dark Orb","Spectral Floe","Zero Hour","Interference","Beleaguerment",
					"Besieger's Bane","Deathly Diminuendo","Enthrall","Flank Opening","Malign Invocation","Shadow Wreck","Shah Mat","Stygian Cyclone",
				 }
