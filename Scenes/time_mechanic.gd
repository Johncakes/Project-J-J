extends Node

# === TIME PHASES ===
var time_phases = ["Morning", "Afternoon", "Evening", "Night"]
var current_phase_index = 0
var time_of_day = time_phases[current_phase_index]

# === DAY AND SEASON ===
var current_day = 1
var days_per_season = 10
var season_order = ["Spring", "Summer", "Fall", "Winter"]
var current_season = season_order[0]

# === TIME CONFIG ===
var phase_duration = 5.0  # Seconds per phase
var phase_timer = 0.0

func _ready():
	# Print the initial state as soon as the game starts
	print("Day %d - %s (%s)" % [current_day, time_of_day, current_season])

func _process(delta):
	phase_timer += delta
	if phase_timer >= phase_duration:
		advance_time_phase()
		phase_timer = 0.0

func advance_time_phase():
	current_phase_index += 1

	if current_phase_index >= time_phases.size():
		current_phase_index = 0
		current_day += 1
		update_season()

	time_of_day = time_phases[current_phase_index]
	print("Day %d - %s (%s)" % [current_day, time_of_day, current_season])

func update_season():
	var season_index = int((current_day - 1) / days_per_season) % season_order.size()
	current_season = season_order[season_index]
