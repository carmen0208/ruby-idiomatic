## what's ascend

The **pathname** standard library has an `#ascend` method which will work its way up a directory tree, 
yielding each path in turn

## with Enumerator

Enumerator can take any method that yields values, and turn it into an Enumerable object. 
SO we can turn #ascend into an Enumerator

## Usage

As Enumerator is a child os Enumerable. some of the methods can be use. like `each`,
`to_a`, `detect`

here's a example that using detect to see if something is included

(example)[060_ascend_with_enumerator.rb]
