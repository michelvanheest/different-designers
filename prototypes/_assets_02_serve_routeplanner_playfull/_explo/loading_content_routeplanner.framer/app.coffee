gradient1 = new Gradient
	start: "#FFFFFF"
	end: "#F7F7F7"
	angle: 270
	
gradient2 = new Gradient
# 	start: "#F7F7F7"
	start: "FFFFFF"
	end: "FFFFFF"
# 	end: "red"
	angle: 270

r_cl = new Layer
	x: 0
	y: 248
	width: 400
	height: 200
# 	shadowY: 2
# 	shadowBlur: 24
# 	shadowColor: "rgba(12, 12, 105, 0.01)"
	gradient: gradient2
# 	backgroundColor: "blue"

r_cl.states =
	1:
		gradient: gradient1
# 		backgroundColor: "blue"
		width: 400
		x: 0
# 		opacity: 1
		options:
			time: 0
	2: 
		gradient: gradient2
# 		backgroundColor: "blue"
		width: 0
		x: 400
# 		opacity: 0
		options:
			time: 2

r_cl.animate "1"

r_cl.onAnimationEnd ->
	r_cl.stateCycle("1", "2")
