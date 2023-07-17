#diffərənt x ANWB
#Minor IUXD

# 🔵Defaults

## 🔴Variables
defaultScroll = "Bezier(0.05, 0.58, 0.52, 0.95)"
defaultBezier = "Bezier(0.46, 0.92, 0.46, 0.92)"
defaultSpring = "spring(250, 20, 5)"

gradient_button = new Gradient
	start: "#0096DA"
	end: "#003D86"
	angle: 270

gradient_pressed = new Gradient
	start: "#003D86"
	end: "#003D86"
	angle: 270

loading_gradient_left = new Gradient
	start: "#FFFFFF"
# 	end: "#EDEDED"
	end: "#F2F2F2"
# 	end: "#F9F9F9"
	angle: 270
	
loading_gradient_right = new Gradient
	start: "#FFFFFF"
	end: "#FFFFFF"
	angle: 270

bg_img_default.opacity = 1
bg_img_footer.opacity = 1
bg_img_footer.y = 1403
routeplanner_planning.opacity = 0
bg_img_planning.opacity = 0
input_button_plan.y = 680
markerA.opacity = 1
markerB.opacity = 0
markerB.y = 50
markerB.scale = 0.8
road_alternative.opacity = 0
route_extra_info_1_content.opacity = 0
route_extra_info_2_content.opacity = 0
route_extra_info_3_content.opacity = 0
route_directions.opacity = 0

## 🔴Create main_frame
flow = new FlowComponent
flow.showNext(main_frame)

## 🔴Make main_frame scrollable
scroll = new ScrollComponent
	width: safariContent.width
	height: safariContent.height
	scrollHorizontal: false
	parent: safariContent
routeplanner_content.parent=scroll.content
scroll.mouseWheelEnabled = true

# 🔵Planner form

## 🔴Button
input_button_plan.states = 
	input_button_plan_hover:
		y: 679
		gradient: gradient_button
		options:
			time: 0.2
	input_button_plan_default:
		y: 680
		gradient: gradient_button
		options:
			time: 0.2
	input_button_plan_press:
		y: 681
		gradient: gradient_pressed
		options:
			time: 0.1

input_button_plan.onMouseOver ->
	input_button_plan.animate("input_button_plan_hover")
input_button_plan.onMouseOut ->
	input_button_plan.animate("input_button_plan_default")
input_button_plan.onTapStart ->
	input_button_plan.animate("input_button_plan_press")
input_button_plan.onTapEnd ->
	input_button_plan.animate("input_button_plan_default")

# 🔵Map

## 🔴Set state
markerB.states =
	visible:
		opacity: 1
		y: 40
		scale: 1
		animationOptions:
			curve: defaultSpring

## 🔴Call SVG module
{SVGLayer} = require "SVGLayer"

## 🔴Create SVG road_main
road_main = new SVGLayer
	strokeWidth: 6
	dashOffset: 0
# 	dashOffset: 1
	x: -50
	y: -30
	stroke: "#003C85"
	opacity: 0.8
	parent: route_map_small
	path: '<path class="cls-1" d="M446,112h-6l-1,3l-4,2l-45-14h-19l-16,7h-21l-8,3l-18-2l-9,1l-4,3l-11,14l-17,10v12l-12,12l-18,13l-8,3h-6l-2,2l2,2l2,7l-1,11l2,6l8,8l2,10l-8,6l-10-1l-3-7l-6,3h-4"/>'

road_main.states.add
	second:
		dashOffset: -1

road_main.states.animationOptions =
		curve: defaultBezier
		time: 1.6
		
# 🔴States road_alternative
road_alternative.states =
	visible:
		opacity: 1
		animationOptions:
			curve: defaultBezier

# 🔵Content preloaders
##01
content_loader_route_extra_info_1 = new Layer
	width: 317
	height: 100
	x: 18
	y: 55
	z: 999
	borderRadius: 8
	parent: route_extra_info_1
	gradient: loading_gradient_right
content_loader_route_extra_info_1.states =
	1:
		gradient: loading_gradient_left
		width: 0
		x: 18
		options:
			time: 0
	2: 
		gradient: loading_gradient_right
		width: 317
		x: 18
		options:
			time: 2

##02
content_loader_route_extra_info_2 = new Layer
	width: 317
	height: 100
	x: 18
	y: 55
	z: 999
	borderRadius: 8
	parent: route_extra_info_2
	gradient: loading_gradient_right
content_loader_route_extra_info_2.states =
	1:
		gradient: loading_gradient_left
		width: 0
		x: 18
		options:
			time: 0
	2: 
		gradient: loading_gradient_right
		width: 317
		x: 18
		options:
			time: 2

##03
content_loader_route_extra_info_3 = new Layer
	width: 317
	height: 100
	x: 18
	y: 55
	z: 999
	borderRadius: 8
	parent: route_extra_info_3
	gradient: loading_gradient_right
content_loader_route_extra_info_3.states =
	1:
		gradient: loading_gradient_left
		width: 0
		x: 18
		options:
			time: 0
	2: 
		gradient: loading_gradient_right
		width: 317
		x: 18
		options:
			time: 2

##01
route_directions_info_1 = new Layer
	width: 514
	height: 80
	x: 16
	y: 119
	z: 999
	borderRadius: 8
	parent: route_info
	gradient: loading_gradient_right
route_directions_info_1.states =
	1:
		gradient: loading_gradient_left
		width: 0
		x: 16
		options:
			time: 0
	2: 
		gradient: loading_gradient_right
		width: 514
		x: 16
		options:
			time: 2

##02
route_directions_info_2 = new Layer
	width: 514
	height: 103
	x: 16
	y: 229
	z: 999
	borderRadius: 8
	parent: route_info
	gradient: loading_gradient_right
route_directions_info_2.states =
	1:
		gradient: loading_gradient_left
		width: 0
		x: 16
		options:
			time: 0
	2: 
		gradient: loading_gradient_right
		width: 514
		x: 16
		options:
			time: 2

##03
route_directions_info_3 = new Layer
	width: 514
	height: 103
	x: 16
	y: 363
	z: 999
	borderRadius: 8
	parent: route_info
	gradient: loading_gradient_right
route_directions_info_3.states =
	1:
		gradient: loading_gradient_left
		width: 0
		x: 16
		options:
			time: 0
	2: 
		gradient: loading_gradient_right
		width: 514
		x: 16
		options:
			time: 2

##04
route_directions_info_4 = new Layer
	width: 514
	height: 103
	x: 16
	y: 497
	z: 999
	borderRadius: 8
	parent: route_info
	gradient: loading_gradient_right
route_directions_info_4.states =
	1:
		gradient: loading_gradient_left
		width: 0
		x: 16
		options:
			time: 0
	2: 
		gradient: loading_gradient_right
		width: 514
		x: 16
		options:
			time: 2

##05
route_directions_info_5 = new Layer
	width: 514
	height: 103
	x: 16
	y: 631
	z: 999
	borderRadius: 8
	parent: route_info
	gradient: loading_gradient_right
route_directions_info_5.states =
	1:
		gradient: loading_gradient_left
		width: 0
		x: 16
		options:
			time: 0
	2: 
		gradient: loading_gradient_right
		width: 514
		x: 16
		options:
			time: 2

##06
route_directions_info_6 = new Layer
	width: 514
	height: 103
	x: 16
	y: 765
	z: 999
	borderRadius: 8
	parent: route_info
	gradient: loading_gradient_right
route_directions_info_6.states =
	1:
		gradient: loading_gradient_left
		width: 0
		x: 16
		options:
			time: 0
	2: 
		gradient: loading_gradient_right
		width: 514
		x: 16
		options:
			time: 2

# 🔵Trigger
input_button_plan.onTap ->
	# scroll to route content
	Utils.delay 0.2, ->
# 		scroll.scrollToPoint(
# 			y: 780
# 			true
# 			options:
# 				time: 0.4
# 				curve: defaultBezier
# 		)
		scroll.scrollToPoint(
			y: 780
			true
			options:
				time: 0.6
				curve: defaultScroll
		)
		# move footer down
		bg_img_footer.y = 2057
		# change default bg image with route content
		Utils.delay 0.4, ->
			bg_img_default.animate
				opacity: 0
				options: 
					time: 0.2
					curve: defaultBezier
			routeplanner_planning.animate
				opacity: 1
				options: 
					time: 0.4
					curve: defaultBezier
			Utils.delay 1.24, ->
				# animate road_main on map
# 				road_main.states.next()
				road_main.stateCycle("second")
				# start animating content_loaders
				content_loader_route_extra_info_1.animate "1"
				content_loader_route_extra_info_1.onAnimationEnd ->
					content_loader_route_extra_info_1.stateCycle("1", "2")
				content_loader_route_extra_info_2.animate "1"
				content_loader_route_extra_info_2.onAnimationEnd ->
					content_loader_route_extra_info_2.stateCycle("1", "2")
				content_loader_route_extra_info_3.animate "1"
				content_loader_route_extra_info_3.onAnimationEnd ->
					content_loader_route_extra_info_3.stateCycle("1", "2")
				route_directions_info_1.animate "1"
				route_directions_info_1.onAnimationEnd ->
					route_directions_info_1.stateCycle("1", "2")
				route_directions_info_2.animate "1"
				route_directions_info_2.onAnimationEnd ->
					route_directions_info_2.stateCycle("1", "2")
				route_directions_info_3.animate "1"
				route_directions_info_3.onAnimationEnd ->
					route_directions_info_3.stateCycle("1", "2")
				route_directions_info_4.animate "1"
				route_directions_info_4.onAnimationEnd ->
					route_directions_info_4.stateCycle("1", "2")
				route_directions_info_5.animate "1"
				route_directions_info_5.onAnimationEnd ->
					route_directions_info_5.stateCycle("1", "2")
				route_directions_info_6.animate "1"
				route_directions_info_6.onAnimationEnd ->
					route_directions_info_6.stateCycle("1", "2")
				Utils.delay 1.6, ->
					# animate markers on map
					markerB.stateCycle("visible")
					Utils.delay 0.4, ->
						# animate road_alternative on map
						road_alternative.stateCycle("visible")
						Utils.delay 1.8, ->
							# show content
							content_loader_route_extra_info_1.opacity = 0
							content_loader_route_extra_info_2.opacity = 0
							content_loader_route_extra_info_3.opacity = 0
							route_directions_info_1.opacity = 0
							route_directions_info_2.opacity = 0
							route_directions_info_3.opacity = 0
							route_directions_info_4.opacity = 0
							route_directions_info_5.opacity = 0
							route_directions_info_6.opacity = 0
							Utils.delay 0.16, ->
								route_extra_info_1_content.animate
									opacity: 1
									options: 
										time: 0.8
										curve: defaultBezier
								route_extra_info_2_content.animate
									opacity: 1
									options: 
										time: 0.8
										curve: defaultBezier
								route_extra_info_3_content.animate
									opacity: 1
									options: 
										time: 0.8
										curve: defaultBezier
								route_directions.animate
									opacity: 1
									options: 
										time: 0.8
										curve: defaultBezier
