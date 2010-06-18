module Skippy
  def skip(&blk)
    if ENV['SKIP_OFF'] == "true"
      instance_eval(&blk)
    end
  end
  
  alias long_running skip 
  alias this_test_sucks skip 
  
  def self.extended(base)
    base.send(:include, self)
  end
end