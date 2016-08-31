def func(arg1,arg2,*other_args) 
  p arg1.inspect
  p arg2.inspect
  p other_args.inspect
end

func(1,2,3,4,5)
#=>"1"
#=>"2"
#=>"[3, 4, 5]"

def func_block (arg1, arg2, block_args = {})
  p arg1.inspect
  p arg2.inspect
  p block_args.inspect
end

func_block 1 , 2, :block_args=>123, :block_args2=>345, :notthing=>'wonderful'
#=>"1"
#=>"2"
#=>"{:block_args=>123, :block_args2=>345, :notthing=>\"wonderful\"}"


