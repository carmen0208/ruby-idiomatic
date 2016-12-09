

def sqInRect(lng, wdth)
  return nil if lng == wdth
  k = []
  higher = lng > wdth ? lng : wdth
  lower = lng < wdth ? lng : wdth
  while((higher - lower) == 0)
    while ((higher - lower) > lower)
      k.push(lower)
      higher = higher - lower
    end

    higher, lower = lower, higher
  end
  k
end

sqlInRect(10,4)