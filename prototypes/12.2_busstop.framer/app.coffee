#diffərənt x ANWB
#Minor IUXD

Framer.Device.deviceType = "fullscreen"
document.body.style.cursor = "auto"

#🔶Defaults
defaultEaseOut = "Bezier(0, 0, 0.58, 1)"
defaultEaseInAndOut = "Bezier(0.42, 0, 0.58, 1)"

defaultOptions = ->
	curve: defaultEaseInAndOut
	time: 0.2

colorOrange = "#F28200"
colorDarkBlue = "#003D86"
colorLightBlue = "#5A97C0"

stop1Chevron.color = colorOrange
stop1Line.backgroundColor = colorOrange
stop1Text.color = colorOrange

stop2Chevron.color = colorLightBlue
stop2Line.backgroundColor = colorLightBlue
stop2Text.color = colorLightBlue

stop3Chevron.color = colorLightBlue
stop3Line.backgroundColor = colorLightBlue
stop3Text.color = colorLightBlue

stop4Chevron.color = colorLightBlue
stop4Line.backgroundColor = colorLightBlue
stop4Text.color = colorLightBlue

stopLineOverlay.backgroundColor = colorOrange
stop2LineOverlay.width = 0
stop3LineOverlay.width = 0
stop4LineOverlay.width = 0

#🔶Trigger
buttonTrigger.onClick ->
	stop1Line.backgroundColor = colorDarkBlue
	stopLineOverlay.animate
		x: 188
		options: defaultOptions()
	stop1Text.animate
		color: colorDarkBlue
		options: defaultOptions()
	stop1Chevron.animate
		color: colorDarkBlue
		options: defaultOptions()
	stop2Text.animate
		color: colorOrange
		options: defaultOptions()
	stop2Chevron.animate
		color: colorOrange
		options: defaultOptions()
	Utils.delay 0.5, ->
		stop2Line.backgroundColor = colorDarkBlue
		
		buttonTrigger.onClick ->
			stop2Line.backgroundColor = colorDarkBlue
			stopLineOverlay.animate
				x: 376
				options: defaultOptions()
			stop2Text.animate
				color: colorDarkBlue
				options: defaultOptions()
			stop2Chevron.animate
				color: colorDarkBlue
				options: defaultOptions()
			stop3Text.animate
				color: colorOrange
				options: defaultOptions()
			stop3Chevron.animate
				color: colorOrange
				options: defaultOptions()
			Utils.delay 0.5, ->
				stop3Line.backgroundColor = colorDarkBlue
			
				buttonTrigger.onClick ->
					stop3Line.backgroundColor = colorDarkBlue
					stopLineOverlay.animate
						x: 564
						options: defaultOptions()
					stop3Text.animate
						color: colorDarkBlue
						options: defaultOptions()
					stop3Chevron.animate
						color: colorDarkBlue
						options: defaultOptions()
					stop4Text.animate
						color: colorOrange
						options: defaultOptions()
					stop4Chevron.animate
						color: colorOrange
						options: defaultOptions()
					Utils.delay 0.5, ->
						stop4Line.backgroundColor = colorDarkBlue