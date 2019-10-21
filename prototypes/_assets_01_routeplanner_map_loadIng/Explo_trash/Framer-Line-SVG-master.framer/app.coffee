#Default Layer
alarm = new Layer
	width: 100
	height: 100
	backgroundColor: "none"

#Add the SVG to Framer
alarm.html = "<svg version='1.1' id='alarm-bell' xmlns='http://www.w3.org/2000/svg' xmlns:xlink='http://www.w3.org/1999/xlink' x='0px' y='0px' viewBox='0 0 27 27' style='enable-background:new 0 0 27 27;' xml:space='preserve'><path id='bell' d='M11.2,24.2c0.2,1,1,1.8,2.1,1.8s1.9-0.8,2.1-1.8H11.2z'/><path id='alarm' class='st0'd='M13,1.4v1.2l0.1,0.5c4.3,0,7.7,3.5,7.7,7.8v3.9c0,0.8,0.5,3,1.2,4.2c0.9,1.4,2.1,2.5,2.1,2.5v1.1 H2.1v-1.1c0,0,1.2-1.1,2.1-2.5c0.7-1.2,1.2-3.4,1.2-4.2v-3.9c0-4.3,3.4-7.8,7.7-7.8'/></svg>"

alarmBellAnimation()
alarm.center()

# #Get the path length
# `
# var myPath = document.getElementById("alarm");
# var length = myPath.getTotalLength();
# console.log(length);
# `
