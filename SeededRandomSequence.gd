#This Class module manages an instanced Random Sequence
#It tracks it's own sequence of results so you can refer back to them at any point
#It's seed persists, so you don't have to worry about the regular RNG messing it up
#Place this in your module, for example res://lib/SeededRandomSequence.gd


#Initial and current state
var _initial_seed
var _current_state

#The results, in sequence
var _result_sequence

#Init
func _init(new_seed=null):
	#Was a seed given?
	if new_seed == null:
		#Provide a random seed
		randomize()
		new_seed = randi()
	
	#Apply the seed
	self.reset(new_seed)

#Reset to the original state
func reset(new_seed=null):
	#Reset the sequence, optionally with a new seed

	#Was there a new seed?
	if new_seed != null:
		#Set that seed
		self._initial_seed = new_seed
	
	#Get the first state
	self._result_sequence = []
	self._current_state = rand_seed(hash(self._initial_seed))[1]

#Get the next number
func next():
	#Get the next integer
	
	#Get the next state
	var random_result = rand_seed(self._current_state)
	self._current_state = random_result[1]

	#Return the integer
	var random_integer = random_result[0]
	self._result_sequence.append(random_integer)
	return random_integer

#Get a particular number in the sequence
func get_at_index(index):
	#Gets the result at a specified index.
	#Note: This WILL update the sequence to that index if it is further than the current index!
	
	#We need to generate numbers until we get to this index
	while index > self._result_sequence.size():
		#We need to keep generating more
		self.next()
	
	#We are now at least as far as the specified index
	#We can return it's result
	return self._result_sequence[index]

