# subclassing UIViewController so it's easier to find in instruments
class AwesomeModel < UIViewController

  def dealloc
    puts "dealloc AwesomeModel"

    super
  end

  def insert
    puts "retain-count: #{self.retainCount}"
    # my_hash['something'].push "Cool String" - ether way is problematic
    my_hash['something'] = ['Cool String']
    puts "retain-count: #{self.retainCount}"
  end

  def my_hash
    # @my_hash ||= Hash.new { |h,k| h[k] = [] } - ether way is problematic
    @my_hash ||= Hash.new { }
  end

end