#diffərənt x ANWB
#Minor IUXD

#defaults
# defaultBezier = "Bezier(0.25, 0.1, 0.25, 1)"
defaultBezier = "Bezier(0.46, 0.92, 0.46, 0.92)"
defaultSpring = "spring(250, 20, 5)"

flow = new FlowComponent

flow.showNext(a1)

#set markers
markerA.opacity = 1
markerB.opacity = 0
markerB.y = 344
markerB.scale = 0.8

markerB.states =
	visible:
		opacity: 1
		y: 334
		scale: 1
		animationOptions:
			curve: defaultSpring
# 	invisible:
# 		opacity: 0
# 		y: 344
# 		scale: 0.8
# 		animationOptions:
# 			curve: defaultSpring

#call SVG module
{SVGLayer} = require "SVGLayer"

#create SVG roadMain
roadMain = new SVGLayer
	strokeWidth: 6
	dashOffset: 0
# 	dashOffset: 1
	x: 446
	y: 355
	stroke: "#003C85"
	opacity: 0.8
	path: '<path class="cls-1" d="M3,248l13-2,6-5,3,3-1,1,3,6v6l8,2H46l21-11v-4l-5-10-1-7L49,216l-8-18,3-17-5-23,8-4,14-3,26-17,15-12,24-24,4-13-3-7,1-4,3-3,20-9,15-11,18-24,7-6,5-2h10l41,3,16-6h37l12-3,14-8,7-2h39l20,7,27,6,16,6,4,3,21,3,9,5,4-11h2l3-3,6,1"/>'

roadMain.states.add
	second:
		dashOffset: 1

roadMain.states.animationOptions =
		curve: defaultBezier
		time: 1.6

#states roadAlternative
roadAlternative1.states =
	visible:
		opacity: 1
		animationOptions:
			curve: defaultBezier

roadAlternative2.states =
	visible:
		opacity: 1
		animationOptions:
			curve: defaultBezier

#trigger
button_trigger.onTapStart ->
	button_trigger.animate
		opacity: 0.95
		options:
			time: 0.2
button_trigger.onTapEnd ->
	button_trigger.animate
		opacity: 1
		options:
			time: 0.2
button_trigger.onTap ->
	roadMain.states.next()
	Utils.delay 1.6, ->
		markerB.stateCycle("visible")
		Utils.delay 0.4, ->
			roadAlternative1.stateCycle("visible")
			roadAlternative2.stateCycle("visible")