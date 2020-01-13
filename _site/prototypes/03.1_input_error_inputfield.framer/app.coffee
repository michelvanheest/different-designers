# 🔵Defaults

## 🔴Variables
defaultScroll = "Bezier(0.05, 0.58, 0.52, 0.95)"
defaultBezier = "Bezier(0.46, 0.92, 0.46, 0.92)"
defaultSpring = "spring(250, 20, 5)"

adresgegevens.height = 532
input_field_zip.borderColor = "#C0DBED"
error_text.opacity = 0
input_fields_misc.y = 147
keyboard.y = 812

zip_code = new TextLayer
	text: "Bijv: 1234AB"
	color: "#5996C0"
	x: 12
	y: 12
	fontSize: 15
	fontFamily: "Verdana"
	parent: input_field_zip

## 🔴Create main_frame
flow = new FlowComponent
flow.showNext(main_frame)

## 🔴Make main_frame scrollable
scroll = new ScrollComponent
	width: safari_content.width
	height: safari_content.height
	scrollHorizontal: false
	parent: safari_content
form_content.parent=scroll.content
scroll.mouseWheelEnabled = true

# 🔵Animation
## 🔴Shake
shake = (view, times=4) ->
	i = 0
	
	right = new Animation
		layer: view
		properties: 
			x: view.x + 2
		curve: "bezier-curve"
		time: 0.08
		
	left = new Animation
		layer: view
		properties: 
			x: view.x - 2
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
				time: 0.1
   
	right.start()

# 🔵Trigger
## 🔴Trigger keyboard
input_field_zip.onTap ->
	keyboard.animate
		y: 428
		options: 
			time: 0.32
	
form_content.onTap ->
	keyboard.animate
		y: 812
		options: 
			time: 0.32

## 🔴Trigger input_error
keyboard.onTap ->
	zip_code.text = "2"
	Utils.delay 0.3, ->
		zip_code.text = "25"
		Utils.delay 0.3, ->
			zip_code.text = "259"
			Utils.delay 0.3, ->
				zip_code.text = "259 E"
				Utils.delay 0.3, ->
					zip_code.text = "259 EC"


input_fields_misc.onTap ->
	input_field_zip.borderColor = "#F0603D"
	adresgegevens.height = 570
	input_fields_misc.animate
		y: 183
		options: 
			time: 0.32
	shake input_field_zip
	error_text.animate
		opacity: 1
		options: 
			time: 0.32
