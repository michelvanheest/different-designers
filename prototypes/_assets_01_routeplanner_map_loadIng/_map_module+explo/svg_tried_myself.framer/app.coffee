# create trigger
trigger = new TextLayer
	opacity: 1
	text: "click me"

trigger.onTapStart ->
	trigger.animate
		opacity: 0.92
		options: 
			time: 0
trigger.onTapEnd ->
	trigger.animate
		opacity: 1
		options: 
			time: 0

# call SVG module
{SVGLayer} = require "SVGLayer"

# create + modify SVG layer
layer = new SVGLayer
	strokeWidth: 4
	dashOffset: 0
	path: '<path class="cls-1" d="M3,248l13-2,6-5,3,3-1,1,3,6v6l8,2H46l21-11v-4l-5-10-1-7L49,216l-8-18,3-17-5-23,8-4,14-3,26-17,15-12,24-24,4-13-3-7,1-4,3-3,20-9,15-11,18-24,7-6,5-2h10l41,3,16-6h37l12-3,14-8,7-2h39l20,7,27,6,16,6,4,3,21,3,9,5,4-11h2l3-3,6,1"/>'

layer.states.add
	second:
		dashOffset: 1

layer.states.animationOptions =
	curve: "spring(80, 30)"

# trigger SVG animation
trigger.onClick ->
	layer.states.next()