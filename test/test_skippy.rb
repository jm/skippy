require 'helper'

class TestSkippy < Test::Unit::TestCase
  def setup
    ENV['SKIP_OFF'] = "false"
    @ivar = "w00t"
  end
  
  def test_runs
    ENV['SKIP_OFF'] = "true"
    
    skip do
      @things = true
    end
    
    assert @things
  end
  
  def test_doesnt_run
    skip do
      @foolz = true
    end
    
    assert @foolz.nil?
  end
  
  def test_has_access
    ENV['SKIP_OFF'] = "true"
    skip do
      @other_ivar = true if @ivar
    end
    
    assert @other_ivar
  end
  
  # This sucks.  Figure out a better way to test this.
  skip do
    def test_skips_this_crap
      flunk "don't run this!"
    end
  end
  
  def test_aliases
    long_running do
      @fail = true
    end
    
    this_test_sucks do
      @fail = true
    end
    
    assert_nil @fail
  end
end
