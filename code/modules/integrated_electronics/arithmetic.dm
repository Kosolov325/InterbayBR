//These circuits do simple math.
/obj/item/integrated_circuit/arithmetic
	complexity = 1
	inputs = list("A","B","C","D","E","F","G","H")
	outputs = list("result")
	activators = list("compute")
	category = /obj/item/integrated_circuit/arithmetic

// +Adding+ //

/obj/item/integrated_circuit/arithmetic/addition
	name = "wide addition circuit"
	desc = "This circuit can add up to eight numbers together."
	outputs = list("sum")
	icon_state = "addition"

/obj/item/integrated_circuit/arithmetic/addition/do_work()
	var/result = 0
	for(var/datum/integrated_io/input/I in inputs)
		I.pull_data()
		if(isnum(I.data))
			result = result + I.data
	set_pin_data(IC_OUTPUT, 1, result)


/obj/item/integrated_circuit/arithmetic/binary //binary circuit is adder by default (to avoid having produceable useless circuits)
	name = "addition circuit"
	desc = "This circuit can add two numbers together."
	icon_state = "addition"
	inputs = list("A", "B")
	outputs = list("A+B")

/obj/item/integrated_circuit/arithmetic/binary/do_work()
	var/A = get_pin_data(IC_INPUT, 1)
	A=isnum(A) ? A : null
	var/B = get_pin_data(IC_INPUT, 2)
	B=isnum(B) ? B : null
	var/result = src.func(A,B)
	set_pin_data(IC_OUTPUT, 1, result)

/obj/item/integrated_circuit/arithmetic/binary/proc/func(var/A,var/B)
	if(isnull(A)||isnull(B))
		return
	return A + B

// -Subtracting- //

/obj/item/integrated_circuit/arithmetic/binary/subtraction
	name = "subtraction circuit"
	desc = "This circuit can subtract two numbers."
	icon_state = "subtraction"
	outputs = list("A-B")

/obj/item/integrated_circuit/arithmetic/binary/subtraction/func(var/A,var/B)
	if(isnull(A)||isnull(B))
		return
	return A - B
// *Multiply* //

/obj/item/integrated_circuit/arithmetic/binary/multiplication
	name = "multiplication circuit"
	desc = "This circuit can multiply two numbers."
	icon_state = "multiplication"

/obj/item/integrated_circuit/arithmetic/binary/multiplication/func(var/A,var/B)
	if(isnull(A)||isnull(B))
		return
	return A * B
// /Division/  //

/obj/item/integrated_circuit/arithmetic/binary/division
	name = "division circuit"
	desc = "This circuit can divide two numbers"
	icon_state = "division"
	outputs = list("A/B")

/obj/item/integrated_circuit/arithmetic/binary/division/func(var/A,var/B)
	if(isnull(A)||isnull(B))
		return
	return A / B

// Random //

/obj/item/integrated_circuit/arithmetic/binary/random
	name = "random number generator circuit"
	desc = "This gives a random (integer) number between values A and B inclusive."
	icon_state = "random"

/obj/item/integrated_circuit/arithmetic/binary/random/func(var/A,var/B)
	if(isnull(A)||isnull(B))
		return
	return rand(A,B)

// Absolute //

/obj/item/integrated_circuit/arithmetic/absolute
	name = "absolute circuit"
	desc = "This outputs a non-negative version of the number you put in.  This may also be thought of as its distance from zero."
	icon_state = "absolute"
	inputs = list("A")

/obj/item/integrated_circuit/arithmetic/absolute/do_work()
	var/result = 0
	for(var/datum/integrated_io/input/I in inputs)
		I.pull_data()
		if(isnum(I.data) && I.data != 0)
			result = abs(result)
	set_pin_data(IC_OUTPUT, 1, result)

// Averaging //

/obj/item/integrated_circuit/arithmetic/average
	name = "average circuit"
	desc = "This circuit is of average quality, however it will compute the average for numbers you give it."
	icon_state = "average"

/obj/item/integrated_circuit/arithmetic/average/do_work()
	var/result = 0
	var/inputs_used = 0
	for(var/datum/integrated_io/input/I in inputs)
		I.pull_data()
		if(isnum(I.data))
			inputs_used++
			result = result + I.data

	if(inputs_used)
		result = result / inputs_used
	set_pin_data(IC_OUTPUT, 1, result)

// Pi, because why the hell not? //
/obj/item/integrated_circuit/arithmetic/pi
	name = "pi constant circuit"
	desc = "Not recommended for cooking.  Outputs '3.14159' when it receives a pulse."
	icon_state = "pi"
	inputs = list()

/obj/item/integrated_circuit/arithmetic/pi/do_work()
	set_pin_data(IC_OUTPUT, 1, 3.14159)

