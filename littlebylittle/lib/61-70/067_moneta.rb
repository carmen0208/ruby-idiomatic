require 'moneta'

#store = Moneta.new(:YAML, file: "store.yaml")
#store['question'] = "Life, the universe, ant everything"
#store['anwser'] = 42
# store into directory
store = Moneta.new(:File, dir: "store")
store['question'] = "Life, the universe, ant everything"
store['anwser'] = 42
