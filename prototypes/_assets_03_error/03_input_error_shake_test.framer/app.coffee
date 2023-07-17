input_field_zip.borderColor = "#C0DBED"

shake = (view, times=4) ->
	i = 0
	
	right = new Animation
		layer: view
		properties: 
			x: view.x + 2
# 			rotation: + 1
		curve: "bezier-curve"
		time: 0.08
		
	left = new Animation
		layer: view
		properties: 
			x: view.x - 2
# 			rotation: -1
		curve: "bezier-curve"
		time: 0.08

	right.on "end", ->
		if i < times
			left.start()
			i++
		else
			view.animate
				properties:
# 					rotation: 0
					x: view.x-1
				time: 0.1
				
	left.on "end", ->
		if i < times
			right.start()
			i++
		else
			view.animate
				properties:
# 					rotation: 0
					x: view.x+1
				time: 0.1
   
	right.start()

input_field_zip.on Events.Click,-> shake this