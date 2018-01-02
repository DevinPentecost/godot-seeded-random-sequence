# godot-seeded-random-sequence
## Seeded RNG Sequence

This module/class acts as RNG sequence that manages it's own state outside of the Godot Random Number Generator (RNG). This allows you to have unique RNG sequences that are not affected by one another, and can even reset/remember previous values.

This is useful for procedural generation, as the RNG can easily be interrupted by other nodes in your project. You can provide a seed directly, or allow the RNG to give a seed.

## Installation and usage
Installing this module is very simple - just add it to your project and reference it in your scripts.

For Example:
```
/godot/project
   ├── lib
   |   └── SeededRandomSequence.gd
   └── objects
       └── MyObjectController.gd
```

### MyObjectController.gd
```
...
#Import the class module
const SeededRandomSequence = preload("res://lib/SeededRandomSequence.gd")

#Variables for the seed and RNG
export(String) var seed = 0
var _rng

func _ready():
  #Create the RNG
  _rng = SeededRandomSequence.new(seed)
  
  #Get the next number in the sequence
  var my_new_int = _rng.next()
  print("Got Number: ", my_new_int)
```
