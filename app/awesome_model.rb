# subclassing UIViewController so it's easier to find in instruments
class AwesomeModel < UIViewController

  def dealloc
    puts "dealloc AwesomeModel"

    super
  end

  def do_cleanup_work
    puts "disable observers"
  end
end