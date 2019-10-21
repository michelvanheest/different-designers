{SVGLayer} = require "SVGLayer"

layer = new SVGLayer
	strokeWidth: 20
	stroke: "black"
	width: 324
	dashOffset: 1
	height: 324
	linecap: "square"
	fill: "#28affa"
	path: '<path d="M162,324 C251.470129,324 324,251.470129 324,162 C324,72.5298705 251.470129,0 162,0 C72.5298705,0 0,72.5298705 0,162 C0,251.470129 72.5298705,324 162,324 Z"></path>'

layer.center()

layer.states.add
	second:
		dashOffset: -1
		strokeWidth: 4

layer.states.animationOptions =
	curve: "spring(80, 30)"

layer.on Events.Click, ->
	layer.states.next()

layer.states.next()
