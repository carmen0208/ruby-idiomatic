##Primes in numbers star 5
## I finished it, but run out time .... leave it here, maybe for the next time
require 'prime'
require_relative '../../metaprogramming/test/assertions'
def primeFactors(n)
  return "(#{n})" if Prime.prime?(n)
#  primes = Prime.take_while {|num| num < n}

  primes = []

  s=""
  (2...n/2).each { |x|
    while (n % x == 0 && Prime.prime?(x))
      primes << x
      n = n / x
    end
  }


  primes.group_by{|k,v| k}.map do |k,v|
    if(v.size>1)
      s +="(#{v[0]}**#{v.size})"
    else
      s +="(#{v[0]})"
    end

  end
  s

end


assert_equals(primeFactors(7775460), "(2**2)(3**3)(5)(7)(11**2)(17)")
assert_equals(primeFactors(7919), "(7919)")
assert_equals(primeFactors(18195729), "(3)(17**2)(31)(677)")

# Test Passed: Value == "(7919)"
# Test Passed: Value == "(3)(17**2)(31)(677)"