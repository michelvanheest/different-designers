{SVGLayer} = require "SVGLayer"

path = new SVGLayer
  strokeWidth: 4
  width: 502.6700134277344
  height: 204.3515625057028
  path: '<path d="M0,204.351562 c0,204.351562 383.764204,204.390625 502.670013,0"></path>'

path.center()

# path.animatePath
# 	curve: "spring(40,15,0)"
# 	direction: "backward"