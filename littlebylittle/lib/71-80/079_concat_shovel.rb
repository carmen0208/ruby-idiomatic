shopping_list = ["bread","milk","granola"]
shopping_list << "cheese" # => ["bread", "milk", "granola", "cheese"]

shopping_list << ["swiss","brie","cheddar"] # => ["bread", "milk", "granola", "cheese", ["swiss", "brie", "cheddar"]]
shopping_list.flatten! # => ["bread", "milk", "granola", "cheese", "swiss", "brie", "cheddar"]
