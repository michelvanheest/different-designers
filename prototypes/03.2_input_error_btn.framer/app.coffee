# 🔵Defaults

## 🔴Variables
defaultScroll = "Bezier(0.05, 0.58, 0.52, 0.95)"
defaultBezier = "Bezier(0.46, 0.92, 0.46, 0.92)"
defaultSpring = "spring(250, 20, 5)"

error_btn.opacity = 0

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


# 🔵Error on scroll
error_btn.y = 700
scroll.onScroll ->
	if scroll.scrollY > 75
		error_btn.animate
			y: 580
			opacity: 1
			options: 
				time: 0.16
				curve: defaultSpring
	if scroll.scrollY < 50
		error_btn.animate
			y: 700
			opacity: 0
			options: 
				time: 0.16
				curve: defaultSpring

error_btn.onTap ->
	scroll.scrollToPoint(
		y: 0
		true
		options:
			time: 0.16
			curve: defaultBezier
	)

# 🔵Error on tap
# error_btn.y = 729
# input_huisnummer.onTap ->
# 	scroll.scrollToPoint(
# 		y: 190
# 		true
# 		options:
# 			time: 0.16
# 			curve: defaultScroll
# 	)
# 	error_btn.animate
# 			y: 580
# 			opacity: 1
# 			options: 
# 				time: 0.32
# 				curve: defaultSpring
