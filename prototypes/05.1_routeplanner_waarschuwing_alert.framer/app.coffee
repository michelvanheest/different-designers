#diffərənt x ANWB
#Minor IUXD

# 🔵Defaults
Framer.Device.deviceType = "fullscreen"
document.body.style.cursor = "auto"

## 🔴Variables
route_showed = false

defaultScroll = "Bezier(0.05, 0.58, 0.52, 0.95)"
defaultBezier = "Bezier(0.46, 0.92, 0.46, 0.92)"
defaultEaseIn = "Bezier(0.73, 0.15, 1, 1)"
defaultEaseOut = "Bezier(0, 0, 0.58, 1)"
defaultEaseInAndOut = "Bezier(0.42, 0, 0.58, 1)"
defaultDraw = "Bezier(0.68, 0.95, 0.60, 0.95)"
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
	end: "#F0F6FA"
	angle: 270
	
loading_gradient_right = new Gradient
	start: "#FFFFFF"
	end: "#FFFFFF"
	angle: 270

alertWaarschuwing.opacity = 0
alertWaarschuwing.y = Align.bottom(+24)
bg_map_top.opacity = 0
bg_img_default.opacity = 1
bg_img_footer.opacity = 1
bg_img_footer.y = 1403
routeplanner_planning.opacity = 0
map_big.opacity = 0
# map_big_clear.opacity = 0
bg_img_planning.opacity = 0
plan_button.y = 680
markerA.opacity = 1
markerB.opacity = 0
markerB.y = 50
markerB.scale = 0.8
road_alternative_1.opacity = 0
road_alternative_2.opacity = 0
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
plan_button.states = 
	plan_button_hover:
		y: 679
		gradient: gradient_button
		options:
			time: 0.2
	plan_button_default:
		y: 680
		gradient: gradient_button
		options:
			time: 0.2
	plan_button_press:
		y: 681
		gradient: gradient_pressed
		options:
			time: 0.1

plan_button.onMouseOver ->
	plan_button.animate("plan_button_hover")
plan_button.onMouseOut ->
	plan_button.animate("plan_button_default")
plan_button.onTapStart ->
	plan_button.animate("plan_button_press")
plan_button.onTapEnd ->
	plan_button.animate("plan_button_default")

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
# 		curve: defaultBezier
		curve: defaultEaseInAndOut
		time: 1.2
		
# 🔴States road_alternative
road_alternative_1.states =
	visible:
		opacity: 0.4
		animationOptions:
			curve: defaultEaseIn

road_alternative_2.states =
	visible:
		opacity: 0.4
		animationOptions:
			curve: defaultEaseIn

# 🔵Shake animation
shake = (view, times=4) ->
	i = 0
	
	right = new Animation
		layer: view
		properties: 
			x: view.x + 5
		curve: "bezier-curve"
		time: 0.08
		
	left = new Animation
		layer: view
		properties: 
			x: view.x - 5
		curve: "bezier-curve"
		time: 0.08

	right.on "end", ->
		if i < times
			left.start()
			i++
		else
			view.animate
				properties:
					x: view.x-1
				time: 0.1
				
	left.on "end", ->
		if i < times
			right.start()
			i++
		else
			view.animate
				properties:
					x: view.x+1
# 					x: view.x+0
				time: 0.1
   
	right.start()

# 🔵Content preloaders
##🔴01
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

##🔴02
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

##🔴03
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

##🔴01
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

##🔴02
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

##🔴03
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

##🔴04
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

##🔴05
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

##🔴06
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

# 🔵Trigger get info
plan_button.onTap ->
	# change default bg image with route content
	bg_img_default.animate
		opacity: 0
		options: 
			time: 0.2
			curve: defaultEaseInAndOut
	routeplanner_planning.animate
		opacity: 1
		options: 
			time: 0.4
			curve: defaultEaseInAndOut
	# scroll to route content
	scroll.scrollToPoint(
		y: 780
		true
		options:
			time: 0.6
			curve: defaultScroll
	)
	# move footer down
	bg_img_footer.y = 2057
	
	Utils.delay 1.24, ->
		# animate road_main on map
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
		Utils.delay 1.2, ->
			# animate markers on map
			markerB.stateCycle("visible")
			Utils.delay 0.4, ->
				# animate road_alternative on map
				road_alternative_1.stateCycle("visible")
				road_alternative_2.stateCycle("visible")
				Utils.delay 0.8, ->
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
								curve: defaultEaseIn
						route_extra_info_2_content.animate
							opacity: 1
							options: 
								time: 0.8
								curve: defaultEaseIn
						route_extra_info_3_content.animate
							opacity: 1
							options: 
								time: 0.8
								curve: defaultEaseIn
						route_directions.animate
							opacity: 1
							options: 
								time: 0.8
								curve: defaultEaseIn
						Utils.delay 0.16, ->
							shake vertraging_1
						Utils.delay 0.16, ->
							alertWaarschuwing.animate
								y: Align.bottom(-24)
								opacity: 1
								options: 
									time: 0.16
									curve: defaultSpring
							
							route_showed = true

# 🔵Switch road + view traffic
road_alternative_1.onClick ->
	road_main.opacity = 0.4
	road_alternative_1.opacity = 1
	road_alternative_2.opacity = 0.4
	route_extra_info_1_content.animate
		opacity: 0
		options:
			time: 0.2
	route_extra_info_1_content_alternative_1.animate
		opacity: 1
		options:
			time: 0.2
	route_extra_info_1_content_alternative_2.animate
		opacity: 0
		options:
			time: 0.2

road_alternative_2.onClick ->
	road_main.opacity = 0.4
	road_alternative_1.opacity = 0.4
	road_alternative_2.opacity = 1
	route_extra_info_1_content.animate
		opacity: 0
		options:
			time: 0.2
	route_extra_info_1_content_alternative_1.animate
		opacity: 0
		options:
			time: 0.2
	route_extra_info_1_content_alternative_2.animate
		opacity: 1
		options:
			time: 0.2
		shake vertraging_2
	
road_main.onClick ->
	road_main.opacity = 1
	road_alternative_1.opacity = 0.4
	road_alternative_2.opacity = 0.4
	route_extra_info_1_content.animate
		opacity: 1
		options:
			time: 0.2
	route_extra_info_1_content_alternative_1.animate
		opacity: 0
		options:
			time: 0.2
	route_extra_info_1_content_alternative_2.animate
		opacity: 0
		options:
			time: 0.2
	shake vertraging_1

# 🔵Open map
## 🔴Animate button open map
button_open_kaart.onMouseOver ->
	button_open_kaart_icon.animate
		x: 93.5
		options: 
			time: 0.2
		animationOptions:
			curve: defaultEaseIn
	button_open_kaart_text.color = "#0097DC"
button_open_kaart.onMouseOut ->
	button_open_kaart_icon.animate
		x: 90.5
		options: 
			time: 0.2
		animationOptions:
			curve: defaultEaseIn
	button_open_kaart_text.color = "#003C85"
	
## 🔴Animate button close map
button_sluit_kaart.onMouseOver ->
	button_sluit_kaart_icon.animate
		x: 93.5
		options: 
			time: 0.2
		animationOptions:
			curve: defaultEaseOut
	button_sluit_kaart_text.color = "#0097DC"
button_sluit_kaart.onMouseOut ->
	button_sluit_kaart_icon.animate
		x: 90.5
		options: 
			time: 0.2
		animationOptions:
			curve: defaultEaseOut
	button_sluit_kaart_text.color = "#003C85"

## 🔴Open map via button
button_open_kaart.onClick ->
	scroll.mouseWheelEnabled = false
	map_without_road.opacity = 0
	map_big.opacity = 1
	map_big.z = 999
	map_big.parent = safariContent
	
	map_big.animate
		width: 1440
		height: 775
		x: 0
		y: 60
		borderRadius: 0
		options:
			time: 0.32
			curve: defaultEaseIn
	
	bg_map_top.parent = safariContent
	bg_map_top.opacity = 1
	bg_map_top.z = 1000
	
## 🔴Open map via map
# map_without_road.onClick ->
# 	scroll.mouseWheelEnabled = false
# 	map_without_road.opacity = 0
# 	map_big.opacity = 1
# 	map_big.z = 999
# 	map_big.parent = safariContent
# 	
# 	map_big.animate
# 		width: 1440
# 		height: 775
# 		x: 0
# 		y: 60
# 		borderRadius: 0
# 		options:
# 			time: 0.32
# 			curve: defaultBezier
# 	
# 	bg_map_top.parent = safariContent
# 	bg_map_top.opacity = 1
# 	bg_map_top.z = 1000


## 🔴Close map
button_sluit_kaart.onClick ->
	flow.showNext(danku)
# 	scroll.mouseWheelEnabled = true
# 	map_big.parent = route_map_small
# 	map_big.animate
# 		width: 550
# 		height: 297
# 		x: -2
# 		y: 0
# 		borderRadius: 12
# 		options:
# 			time: 0.32
# 			curve: defaultBezier
# 	
# 	Utils.delay 0.56, ->
# 		map_big.opacity = 0
# 		map_without_road.opacity = 1
# 	
# 	bg_map_top.opacity = 0

safariArrows.onClick ->
	flow.showNext(danku)

# 🔵Navigation hub
## 🔴Animate button open map
hub_tanken.onMouseOver ->
	hub_tanken_arrow.animate
		x: 164
		options: 
			time: 0.2
		animationOptions:
			curve: defaultEaseIn
	hub_tanken_text.color = "#0097DC"
hub_tanken.onMouseOut ->
	hub_tanken_arrow.animate
		x: 161
		options: 
			time: 0.2
		animationOptions:
			curve: defaultEaseIn
	hub_tanken_text.color = "#003C85"

## 🔴Scroll down + open map
hub_tanken.onClick ->

	if route_showed is true
	
		scroll.scrollToPoint(
			y: 780
			true
			options:
				time: 0.6
				curve: defaultScroll
		)
		
		Utils.delay 1.6, ->
			scroll.mouseWheelEnabled = false
			map_without_road.opacity = 0
			map_big.opacity = 1
			map_big.z = 999
			map_big.parent = safariContent
			map_big_overlay.parent = safariContent
			
			map_big.animate
				width: 1440
				height: 775
		# 		x: -731
				x: 0
				y: 60
		# 		y: -250
				borderRadius: 0
				options:
					time: 0.32
					curve: defaultEaseOut
			
			map_big_overlay.z = 1000
			bg_map_top.parent = safariContent
			bg_map_top.opacity = 1
			bg_map_top.z = 1000
			
			Utils.delay 0.56, ->
				map_big_overlay.animate
					opacity: 1
					options:
						time: 0.16
						curve: defaultEaseOut

# 🔵Dismiss alertWaarschuwing
alertWaarschuwing.onClick ->
	alertWaarschuwing.animate
		y: Align.bottom(+24)
		opacity: 0
		options: 
			time: 0.16
			curve: defaultSpring
