#diffərənt x ANWB
#Minor IUXD

#defaults
defaultBezier = "Bezier(0.46, 0.92, 0.46, 0.92)"
defaultSpring = "spring(250, 20, 5)"

flow = new FlowComponent

flow.showNext(a1)

#set road
road.opacity = 0
markerB.opacity = 0
roadVisible = false

road.states =
	invisible:
		opacity: 0
		options: 
			time: 0
	visible:
		opacity: 1
		options: 
			time: 0.8
		animationOptions:
			curve: defaultBezier

#set markers
markerA.opacity = 1
markerB.opacity = 0

markerB.states =
	invisible:
		opacity: 0
		options: 
			time: 0
	visible:
		opacity: 1
		options: 
			time: 0.8
		animationOptions:
			curve: defaultBezier

#trigger
# button_trigger.onTap ->
# 	road.stateCycle("visible", "invisible")
# 	Utils.delay 0.4, ->
# 		markerB.stateCycle("visible", "invisible")

button_trigger.onTap ->
	if roadVisible is false
		road.stateCycle("visible")
		Utils.delay 0.4, ->	
			markerB.stateCycle("visible")
		
		roadVisible = true
	
# button_trigger.onTap ->
# 	if roadVisible is true
# 		road.stateCycle("invisible")
# 		Utils.delay 0.01, ->
# 			markerB.stateCycle("invisible")
# 		
# 		roadVisible = false