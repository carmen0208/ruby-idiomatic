module Kernel
  def using(resource)
    begin
      yield
    ensure
      resource.dispose
    end
  end
end

class Resource
  def dispose
    @disposed = true
  end
  def disposed?
    @disposed
  end
end
