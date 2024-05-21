css .tag w:40 bd:1px #cccccc p:2 bxs:lg
tag app-counter
	count = 0
	<self.tag>
		<div> "Counter"
		<span>
			<input [w:10 mr:2] bind=count>
			<button @click=count++> "Count"

tag temp-convert
	# https://imba.io/try/examples/7guis/temperature/app.imba have bug on setting c
	f = 32
	c = c-from f

	def c-from f\number
		c = ((f - 32)*5/9).toFixed(1)

	def f-from tmp\number
		f = (+(tmp*9/5)+32).toFixed(1)

	<self.tag>
		<div>
			<div> "Temperature converter"
			<input [w:10] bind=c @input=f-from(c)/> " °c = "
			<input [w:10] bind=f @input=c-from(f)/> " °f"

tag flight-booker
	is-return = false
	start = (new Date).toISOString!.slice(0,10)
	end = start

	def book-flight
		msg = "You have booked a {is-return ? 'return ' : 'one-way '} flight on {new Date(start).toDateString!}"
		if is-return
			msg += "and return on {new Date(end).toDateString!}"
		window.alert(msg)

	<self .tag>
		css .err bg:red6
		<div> "Flight Booker"
		<select [p:1] bind=is-return>
			<option value=false> "one-way flight"
			<option value=true> "return flight"
		<input type='date' bind=start>
		<input type='date' bind=end disabled=!is-return>
		<button @click=book-flight disabled=(is-return and start >= end)>	"Book"

tag timer
	duration = 10
	elapsed = 0
	<self .tag>
		<div [fw:600]> "Timer"
		"Elapased Time: " 
		<progress max=(duration - 1) value=(elapsed % duration)>
		<div> elapsed++
		"Duration: {duration}" 
		<input type='range' bind=duration max=20>
		<button > "Reset"

tag App
	<self [d:vflex g:3 ff:sans]>
		<app-counter>
		<temp-convert>
		<flight-booker>
		<timer autorender=1s>

imba.mount <App>
	