# Macros and Modules

## Ways to making Macros in Ruby

* [Exampe](027_macros_modules.rb)

## Trying to fix an Issues when adding extra features

* [Exampe](027_macros_modules_chang1_notworks.rb)


## Trying to fix it version2(works but verbose)

* [Exampe](027_macros_modules_change2_works.rb)

## Trying to fix it version3(works but complicated)

* [Exampe](027_macros_modules_change3_works.rb)

## Trying to fix it and it's works

* [Exampe](027_macros_modules_change4_refact.rb)

## Knowledge:

* callback(self.included)

```ruby
  def self.included(other)
    other.extend(Macros)
  end
```

* listener
* module_eval to add an method

```ruby
module_eval(%Q{
        def #{name}(*args)
          notify_listeners(:#{name}, *args)
        end
      })
```
