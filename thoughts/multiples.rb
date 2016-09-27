#My Solution
def solution(number)
  y = 0
  (1..number-1).each do |x|
    if (x %3==0) || (x %5 ==0)
      y = y + x
    end
  end
  y
end

#better solution
def solution(number)
  (1...number).select {|i| i%3==0 || i%5==0}.inject(:+)
end

p solution(10)