tag app-counter
	count = 0
	<self>
		<div> "Counter"
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

	<self>
		<div> "Temperature converter"
		<input [w:10] bind=c @input=f-from(c)/> " °c = "
		<input [w:10] bind=f @input=c-from(f)/> " °f"

tag flight-booker
	flight-type = 'one-way flight'
	go-date = 0 # = '2014-03-27'
	return-date # = '2014-05-13'

	def can-book
		if new Date(go-date) < new Date()
			return false
		if new Date(return-date) < new Date(go-date)
			return false
		return true

	<self [d:vflex w:30 g:1]>
		css .err bg:red6
		<div> "Flight Booker"
		<select [p:1] bind=flight-type>
			<option> "one-way flight"
			<option> "return flight"
		<input type='date' bind=go-date .err=!can-book()>
		<input type='date' bind=return-date disabled=(flight-type=='one-way flight')>
		<button disabled=!can-book()>	"Book"

tag App
	<self [d:vflex g:3 ff:sans]>
		<app-counter>
		<temp-convert>
		<flight-booker>

imba.mount <App>
