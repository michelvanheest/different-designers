#diffərənt x ANWB
#Minor IUXD

# 🔵Defaults
Framer.Device.deviceType = "fullscreen"
document.body.style.cursor = "auto"
widthScreenMax = 1440
heigthScreenMax = 847

## 🔴Variables
route_showed = false
alertWaarschuwing_showed = false

defaultScroll = "Bezier(0.05, 0.58, 0.52, 0.95)"
defaultBezier = "Bezier(0.46, 0.92, 0.46, 0.92)"
defaultEaseIn = "Bezier(0.73, 0.15, 1, 1)"
defaultEaseOut = "Bezier(0, 0, 0.58, 1)"
defaultEaseInAndOut = "Bezier(0.42, 0, 0.58, 1)"
defaultDraw = "Bezier(0.68, 0.95, 0.60, 0.95)"
defaultSpring = "spring(250, 20, 5)"
defaultMap = "spring(250, 25, 5)"

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

safariContent.width = widthScreenMax
alertWaarschuwing.opacity = 0
alertWaarschuwing.y = Align.bottom(+24)
bg_map_top.opacity = 0
button_sluit_kaart.opacity = 0
button_sluit_kaart.y = -12
bg_img_default.opacity = 1
bg_img_footer.opacity = 1
bg_img_footer.y = 1403
routeplanner_planning.opacity = 0
mapBig.opacity = 0
# mapBig_clear.opacity = 0
bg_img_planning.opacity = 0
plan_button.y = 680
markerA.opacity = 1
markerB.opacity = 0
markerB.y = 50
markerB.scale = 0.8
road_alternative_1.opacity = 0
road_alternative_2.opacity = 0
road_traffic_1.opacity = 0
road_traffic_2.opacity = 0
road_traffic_1.z = 1000
road_traffic_2.z = 1000
route_extra_info_1_content.opacity = 0
route_extra_info_2_content.opacity = 0
route_extra_info_3_content.opacity = 0
route_directions.opacity = 0

sidebarLeft.x = -415
sidebarLeft.opacity = 0
sidebarRight.x = 1440
sidebarRight.opacity = 0

## 🔴Create main_frame
flow = new FlowComponent
flow.showNext(main_frame)
main_frame.width = widthScreenMax
main_frame.height = heigthScreenMax

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
	opacity: 1
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
# 		curve: "bezier-curve"
		time: 0.08
		
	left = new Animation
		layer: view
		properties: 
			x: view.x - 5
# 		curve: "bezier-curve"
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

# 🔵alertWaarschuwing
alertWaarschuwing_show = ->
	alertWaarschuwing.animate
		y: Screen.height - 75
		opacity: 1
		options: 
			time: 0.16
			curve: defaultSpring
# 	alertWaarschuwing_showed = true

alertWaarschuwing_dismiss = ->
	alertWaarschuwing.animate
		y: Align.bottom(+24)
		opacity: 0
		options: 
			time: 0.16
			curve: defaultSpring
# 	alertWaarschuwing_showed = false

alertWaarschuwing.onClick ->
	alertWaarschuwing_dismiss()
	alertWaarschuwing_showed = false

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
							road_traffic_1.animate
								opacity: 1
								options: 
									time: 0.2
									curve: defaultEaseIn
							road_traffic_2.animate
								opacity: 1
								options: 
									time: 0.2
									curve: defaultEaseIn
							shake vertraging_1
						Utils.delay 1, ->
							alertWaarschuwing_show()
							
							route_showed = true
							alertWaarschuwing_showed = true

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
		
		Utils.delay 1.2, ->
			openMap()
			Utils.delay 1.6, ->
				sidebarLeft.animate("dismissed")
				sidebarRight.animate("open")

## 🔵Map Sidebar states
## 🔴States
sidebarLeft.states =
	open:
		x: 0
		opacity: 1
		options: 
			time: 0.24
			curve: defaultEaseInAndOut
	close:
		x: -415
		opacity: 0
		options:
			time: 0.24
			curve: defaultEaseInAndOut
	dismissed:
		x: -365
		opacity: 1
		options: 
			time: 0.24
			curve: defaultEaseInAndOut

sidebarRight.states =
	open:
		x: 1026
		opacity: 1
		options: 
			time: 0.24
			curve: defaultEaseInAndOut
	close:
		x: 1440
		opacity: 0
		options:
			time: 0.24
			curve: defaultEaseInAndOut
	dismissed:
		x: 1391
		opacity: 1
		options: 
			time: 0.24
			curve: defaultEaseInAndOut

## 🔴Handle hoverstates
sidebarLeftHandle.onMouseOver ->
	sidebarLeftHandle.animate
		borderColor: "#0097DC"
		options: 
			time: 0.2
		animationOptions:
			curve: defaultEaseIn
	sidebarLeftHandleIcon.animate
		stroke: "#0097DC"
		options: 
			time: 0.2
		animationOptions:
			curve: defaultEaseIn
sidebarLeftHandle.onMouseOut ->
	sidebarLeftHandle.animate
		borderColor: "#003C85"
		options: 
			time: 0.2
		animationOptions:
			curve: defaultEaseIn
	sidebarLeftHandleIcon.animate
		stroke: "#003C85"
		options: 
			time: 0.2
		animationOptions:
			curve: defaultEaseIn
			
sidebarRightHandle.onMouseOver ->
	sidebarRightHandle.animate
		borderColor: "#0097DC"
		options: 
			time: 0.2
		animationOptions:
			curve: defaultEaseIn
	sidebarRightHandleIcon.animate
		stroke: "#0097DC"
		options: 
			time: 0.2
		animationOptions:
			curve: defaultEaseIn
sidebarRightHandle.onMouseOut ->
	sidebarRightHandle.animate
		borderColor: "#003C85"
		options: 
			time: 0.2
		animationOptions:
			curve: defaultEaseIn
	sidebarRightHandleIcon.animate
		stroke: "#003C85"
		options: 
			time: 0.2
		animationOptions:
			curve: defaultEaseIn

## 🔴Arrow states
sidebarLeftHandleIcon.states = 
	menuOpen:
		rotation: -90
		options: 
			time: 0
	menuClosed:
		rotation: 90
		options: 
			time: 0
sidebarRightHandleIcon.states = 
	menuOpen:
		rotation: -90
		options: 
			time: 0
	menuClosed:
		rotation: 90
		options: 
			time: 0

## 🔴Trigger
sidebarLeftHandle.onClick ->
	sidebarLeft.stateCycle("dismissed", "open")
	sidebarLeftHandleIcon.stateCycle("menuClosed", "menuOpen")
sidebarRightHandle.onClick ->
	sidebarRight.stateCycle("dismissed", "open")
	sidebarRightHandleIcon.stateCycle("menuClosed", "menuOpen")

# 🔵mapBig open/close
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
button_sluit_kaart_2.onMouseOver ->
	button_sluit_kaart_icon_2.animate
		x: 93.5
		options: 
			time: 0.2
		animationOptions:
			curve: defaultEaseOut
	button_sluit_kaart_text_2.color = "#0097DC"
button_sluit_kaart_2.onMouseOut ->
	button_sluit_kaart_icon_2.animate
		x: 90.5
		options: 
			time: 0.2
		animationOptions:
			curve: defaultEaseOut
	button_sluit_kaart_text_2.color = "#003C85"
	

## 🔴openMap() function
openMap = ->
	scroll.mouseWheelEnabled = false
	origX = mapBig.x
	origY = mapBig.y
	origSize = mapBig.size
	origPos = mapBig.screenFrame

	mapBig.states =
		open:
# 			size: Screen.size
			width: widthScreenMax
			borderRadius: 0
			opacity: 1
			x: 0
			y: 69
			z: 1000
			options:
				time: 0.24
				curve: defaultEaseOut
		
		close:
			size: origSize
			borderRadius: 12
			opacity: 0
			x: 732
			y: 316
			z: -1000
			options: 
				time: 0.24
				curve: defaultEaseIn
			
	mapBigImg.states =
		visible:
			opacity: 1
			options:
				time: 0.24
# 				curve: defaultMap
				curve: defaultEaseInAndOut
		
		invisible:
			opacity: 0
			options: 
				time: 0.24
				curve: defaultEaseIn
	
	mapBig.parent = safariContent
	mapBig.screenFrame = origPos
	
	mapBig.animate("open")
	mapBigImg.animate("visible")
	
	bg_map_top.parent = safariContent
	bg_map_top.z = 1000
	bg_map_top.animate
		opacity: 1
		options: 
			time: 0.24
			curve: defaultEaseIn
	alertWaarschuwing_dismiss()
	
	Utils.delay 0.8, ->
		button_sluit_kaart.animate
			opacity: 1
			y: 8
			options:
				time: 0.08
				curve: defaultSpring
		
		Utils.delay 0.8, ->
			flow.showNext(main_frame_2, animate: false)
			safari_2.width = widthScreenMax
			gasstations.animate
				opacity: 1
				options: 
					time: 0.24
					curve: defaultEaseOut

## 🔴Open map via button
button_open_kaart.onClick ->
	openMap()
	Utils.delay 1.6, ->
		sidebarLeft.animate("dismissed")
		sidebarRight.animate("dismissed")
	
## 🔴Close map
closeMap = ->
	scroll.mouseWheelEnabled = true
	mapBig.animate("close")
	bg_map_top.parent = routeplanner_content
	bg_map_top.z = 0
	bg_map_top.opacity = 0
	button_sluit_kaart.opacity = 0
	button_sluit_kaart.y = -12
	gasstations.animate
		opacity: 0
		options: 
			time: 0.24
			curve: defaultEaseOut
	
	if alertWaarschuwing_showed is true
		alertWaarschuwing_show()
# 	else
# 		alertWaarschuwing_dismiss

button_sluit_kaart_2.onClick ->
	sidebarLeft.animate("close")
	sidebarLeftHandleIcon.stateCycle("menuOpen")
	sidebarRight.animate("close")
	sidebarRightHandleIcon.stateCycle("menuOpen")
	Utils.delay 0.4, ->
		flow.showPrevious(animate: false)
		Utils.delay 0.1, ->
			closeMap()

# 🔵 Sidebar interactions
## 🔴Make sidebarLeft scrollable
scrollSidebarLeft = new ScrollComponent
	width: sidebarContentLeft.width
	height: sidebarContentLeft.height
	scrollHorizontal: false
	parent: sidebarContentLeft
sideBarLeftContentImg.parent=scrollSidebarLeft.content
scrollSidebarLeft.mouseWheelEnabled = true

## 🔴Tanken open en dichtklappen
sideBarTankenTrigger.onMouseOver ->
	sideBarTankenText.animate
		color: "#0097DC"
		options: 
			time: 0
sideBarTankenTrigger.onMouseOut ->
	sideBarTankenText.animate
		color: "#003C85"
		options: 
			time: 0

tankenRow1.states =
	visible: 
		opacity: 1
		y: 38
		options:
			time: 0.24
			curve: defaultEaseOut
	invisible:
		opacity: 0
		y: 30
		options: 
			time: 0.24
			curve: defaultEaseOut
tankenRow2.states =
	visible: 
		opacity: 1
		y: 68
		options:
			time: 0.24
			curve: defaultEaseOut
	invisible:
		opacity: 0
		y: 60
		options: 
			time: 0.24
			curve: defaultEaseOut
tankenRow3.states =
	visible: 
		opacity: 1
		y: 98
		options:
			time: 0.24
			curve: defaultEaseOut
	invisible:
		opacity: 0
		y: 90
		options: 
			time: 0.24
			curve: defaultEaseOut
tankenRow4.states =
	visible: 
		opacity: 1
		y: 128
		options:
			time: 0.24
			curve: defaultEaseOut
	invisible:
		opacity: 0
		y: 120
		options: 
			time: 0.24
			curve: defaultEaseOut

tankenRowIcon.states =
	open: 
		rotation: 180
		options: 
			time: 0.24
			curve: defaultEaseOut
	close:
		rotation: 0
		options: 
			time: 0.24
			curve: defaultEaseOut

sideBarTankenDivider.states = 
	open: 
		y: 163
		options: 
			time: 0.24
			curve: defaultEaseOut
	close: 
		y: 35
		options: 
			time: 0.24
			curve: defaultEaseOut

sideBarTreinstations.states = 
	open: 
		y: 305
		options: 
			time: 0.24
			curve: defaultEaseOut
	close: 
		y: 177
		options: 
			time: 0.24
			curve: defaultEaseOut

sideBarHotel.states = 
	open: 
		y: 349
		options: 
			time: 0.24
			curve: defaultEaseOut
	close: 
		y: 221
		options: 
			time: 0.24
			curve: defaultEaseOut

## 🔴Tanken trigger openen & sluiten
sideBarTankenTrigger.onClick ->
	tankenRow1.stateCycle("invisible", "visible")
	tankenRow2.stateCycle("invisible", "visible")
	tankenRow3.stateCycle("invisible", "visible")
	tankenRow4.stateCycle("invisible", "visible")
	tankenRowIcon.stateCycle("close", "open")
	sideBarTankenDivider.stateCycle("close", "open")
	sideBarTreinstations.stateCycle("close", "open")
	sideBarHotel.stateCycle("close", "open")

## 🔴Tanken checkboxes en content aan & uit
tankenRow1Checked = false
tankenRow2Checked = false
tankenRow3Checked = false
tankenRow4Checked = false

checkBoxUnchecked = ->
	x: 2
	width: 14
	options: 
		time: 0.24
		curve: defaultEaseInAndOut
checkBoxChecked = ->
	x: 15
	width: 0
	options: 
		time: 0.24
		curve: defaultEaseInAndOut

gasStationVisible = ->
	opacity: 1
	options:
		time: 0.24
		curve: defaultEaseOut
gasStationInvisible = ->
	opacity: 0
	options:
		time: 0.24
		curve: defaultEaseOut

benzine_1.opacity = 0
benzine_2.opacity = 0
benzine_3.opacity = 0
benzine_4.opacity = 0
benzine_5.opacity = 0

gas_1.opacity = 0
gas_2.opacity = 0


tankenRow1.onClick ->
	if tankenRow1Checked is false
		checkBoxOverlay1.animate checkBoxChecked()
		
		if tankenRow2Checked is true
			benzine_1.animate gasStationInvisible()
			benzine_2.animate gasStationInvisible()
			benzine_3.animate gasStationInvisible()
			benzine_4.animate gasStationVisible()
			benzine_5.animate gasStationVisible()
		
		if tankenRow4Checked is true
			gas_1.animate gasStationInvisible()
			gas_2.animate gasStationVisible()
		
		tankenRow1Checked = true
		
	else
		checkBoxOverlay1.animate checkBoxUnchecked()
		
		if tankenRow2Checked is true
			benzine_1.animate gasStationVisible()
			benzine_2.animate gasStationVisible()
			benzine_3.animate gasStationVisible()
			benzine_4.animate gasStationVisible()
			benzine_5.animate gasStationVisible()
		
		if tankenRow4Checked is true
			gas_1.animate gasStationVisible()
			gas_2.animate gasStationVisible()
		
		tankenRow1Checked = false


tankenRow2.onClick ->
	if tankenRow2Checked is false
		checkBoxOverlay2.animate checkBoxChecked()
		
		if tankenRow1Checked is true
			benzine_1.animate gasStationInvisible()
			benzine_2.animate gasStationInvisible()
			benzine_3.animate gasStationInvisible()
			benzine_4.animate gasStationVisible()
			benzine_5.animate gasStationVisible()
		
		else
			benzine_1.animate gasStationVisible()
			benzine_2.animate gasStationVisible()
			benzine_3.animate gasStationVisible()
			benzine_4.animate gasStationVisible()
			benzine_5.animate gasStationVisible()
		
		tankenRow2Checked = true
# 		print tankenRow2Checked
	
	else
		checkBoxOverlay2.animate checkBoxUnchecked()
		benzine_1.animate gasStationInvisible()
		benzine_2.animate gasStationInvisible()
		benzine_3.animate gasStationInvisible()
		benzine_4.animate gasStationInvisible()
		benzine_5.animate gasStationInvisible()
		tankenRow2Checked = false
# 		print tankenRow2Checked


tankenRow3.onClick ->
	if tankenRow3Checked is false
		checkBoxOverlay3.animate checkBoxChecked()
		tankenRow3Checked = true
	
	else
		checkBoxOverlay3.animate checkBoxUnchecked()
		tankenRow3Checked = false


tankenRow4.onClick ->
	if tankenRow4Checked is false
		checkBoxOverlay4.animate checkBoxChecked()
				
		if tankenRow1Checked is true
			gas_1.animate gasStationInvisible()
			gas_2.animate gasStationVisible()
			
		else
			gas_1.animate gasStationVisible()
			gas_2.animate gasStationVisible()
		
		tankenRow4Checked = true
# 		print tankenRow4Checked
	
	else
		checkBoxOverlay4.animate checkBoxUnchecked()
		gas_1.animate gasStationInvisible()
		gas_2.animate gasStationInvisible()
		tankenRow4Checked = false
# 		print tankenRow4Checked

## 🔴OLD Tanken checkboxes en content aan & uit
# tankenRow1.onClick ->
# 	checkBoxOverlay1.animate checkBoxUnchecked()

# tankenRow2.onClick ->
# 	checkBoxOverlay2.animate checkBoxChecked()
# 	print tankenRow2Checked
# tankenRow2.onClick ->
# 	checkBoxOverlay2.animate checkBoxUnchecked()
# 	print tankenRow2Checked

# tankenRow3.onClick ->
# 	checkBoxOverlay3.animate checkBoxChecked()
# tankenRow3.onClick ->
# 	checkBoxOverlay3.animate checkBoxUnchecked()
	
# tankenRow4.onClick ->
# 	checkBoxOverlay4.animate checkBoxChecked()
# tankenRow4.onClick ->
# 	checkBoxOverlay4.animate checkBoxUnchecked()
