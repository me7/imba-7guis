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

tag App
	<self [d:vflex g:3 ff:sans]>
		<app-counter>
		<temp-convert>

imba.mount <App>
