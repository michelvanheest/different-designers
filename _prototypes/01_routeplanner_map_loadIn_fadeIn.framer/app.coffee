#diffərənt x ANWB
#Minor IUXD

#defaults
defaultBezier = "Bezier(0.25, 0.1, 0.25, 1)"
defaultSpring = "spring(250, 20, 5)"

flow = new FlowComponent

flow.showNext(a1)

#set road
road.opacity = 0

road.states =
	invisible:
		opacity: 0
		options: 
			time: 0
	visible:
		opacity: 1
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
		animationOptions:
			curve: defaultBezier

#trigger
button_trigger.onTap ->
	road.stateCycle("visible", "invisible")
	markerB.stateCycle("visible", "invisible")