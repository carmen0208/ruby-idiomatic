require 'ostruct'
user = OpenStruct.new(:qualifies_for_free_sandwich? => true)
def receipt_message(user)
  if user.qualifies_for_free_sandwich?
    return "Congratulations, you qualify for a free sandwich!"
  else
    return "Come again soon!"
  end
end

puts receipt_message(user)

# Changed version:
def receipt_message(user)
#  message = if user.qualifies_for_free_sandwich?
#    return "Congratulations, you qualify for a free sandwich!"
#  else
#    return "Come again soon!"
#  end
# the message would not return to the current value because of the explicit return
#  if rand(10) == 0
#    message << "\nBring this receipt back for a 10% discount!"
#  end
#  message
end
puts receipt_message(user)

# correct version 
def receipt_message(user)
  message = if user.qualifies_for_free_sandwich?
    "Congratulations, you qualify for a free sandwich!"
  else
    "Come again soon!"
  end
  if rand(10) == 0
    message << "\nBring this receipt back for a 10% discount!"
  end
  message
end
puts receipt_message(user)
