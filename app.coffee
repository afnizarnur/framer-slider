app = Framer.Importer.load("imported/slider@2x")

Utils.globalLayers(app)

# Init the array
allWrapper = []
allIndicator = []
allBg = []

# Init the wrapper
wrapper = new PageComponent
	parent: page
	width: Screen.width
	height: Screen.height
	scrollVertical: false
	contentInset: 
		right: 52

# Loop the card
for	i in [0...2]
	if i is 0
		a = sg
		a.x = (wrapper.width + 100) * (i + 1)
		a.y = 320
		a.scale = 0.6
		a.states.animationOptions = curve: "spring(480, 22, 0)"
		a.superLayer = wrapper.content	
	if i is 1
		a = rg
		a.x = (wrapper.width + 100) * (i + 1)
		a.y = 320
		a.scale = 0.6
		a.states.animationOptions = curve: "spring(480, 22, 0)"
		a.superLayer = wrapper.content
	else 
		a = hr
		a.x = (wrapper.width + 100) * 3
		a.y = 320
		a.scale = 0.6
		a.states.animationOptions = curve: "spring(480, 22, 0)"
		a.superLayer = wrapper.content
		
	allWrapper.push(sg, rg, hr)

bg_1.opacity = 0
bg_2.opacity = 0
bg_3.opacity = 0

bg_1.states.add(
	active: {
		opacity: 1;
	}
)
bg_2.states.add(
	active: {
		opacity: 1;
	}
)
bg_3.states.add(
	active: {
		opacity: 1;
	}
)

bg_1.states.animationOptions = time: 0.2
bg_2.states.animationOptions = time: 0.2
bg_3.states.animationOptions = time: 0.2

allBg.push(bg_1, bg_2, bg_3)

indicator.opacity = 0.13
indicator1.opacity = 0.13
indicator2.opacity = 0.13

indicator.states.add(
	active: {
		opacity: 1;
	}
)
indicator1.states.add(
	active: {
		opacity: 1;
	}
)
indicator2.states.add(
	active: {
		opacity: 1;
	}
)
indicator.states.animationOptions = time: 0.2
indicator1.states.animationOptions = time: 0.2
indicator2.states.animationOptions = time: 0.2
allIndicator.push(indicator2, indicator1, indicator)

sg.states.add
	normal:
		scale: 1
hr.states.add
	normal:
		scale: 1
rg.states.add
	normal:
		scale: 1

wrapper.snapToPage(wrapper.content.subLayers[0])
app.hr.x = (wrapper.width + 100) * 3
allIndicator[0].opacity = 1
allBg[0].opacity = 1

wrapper.on "change:currentPage", ->
	current = wrapper.horizontalPageIndex(wrapper.currentPage)
	
	bg_1.states.switch("default")
	bg_2.states.switch("default")
	bg_3.states.switch("default")
	allBg[current].states.switch("active")
	
	indicator.states.switch("default")
	indicator1.states.switch("default")
	indicator2.states.switch("default")
	allIndicator[current].states.switch("active")
	
	sg.states.switch("default")
	hr.states.switch("default")
	rg.states.switch("default")
	allWrapper[current].states.switch("normal")
	
allWrapper[0].scale = 1