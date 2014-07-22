class RootViewController < UIViewController
  attr_accessor :action_button, :awesome_models

  def dealloc
    puts "dealloc: RootViewController"

    self.awesome_models.each do |awesome_model|
      awesome_model.do_cleanup_work
    end

    super
  end

  def viewDidLoad
    super

    self.action_button = UIButton.buttonWithType(UIButtonTypeRoundedRect)
    self.action_button.setTitle('LoadNewController', forState:UIControlStateNormal)
    self.action_button.addTarget(self, action:'actionTapped', forControlEvents:UIControlEventTouchUpInside)
    self.action_button.frame = [[80, 284], [160, 40]]
    view.addSubview(self.action_button)

    self.awesome_models = [AwesomeModel.new, AwesomeModel.new]

    self.view.backgroundColor = randomColor()
  end

  def actionTapped
    UIApplication.sharedApplication.delegate.load_root_view_controller
  end

  def randomColor
    hue = rand() #  0.0 to 1.0
    saturation = ( rand() * 256 % 128 ) + 0.5;  #  0.5 to 1.0, away from white
    brightness = ( rand() * 256 % 128 ) + 0.5;  #  0.5 to 1.0, away from black
    UIColor.colorWithHue(hue, saturation:saturation, brightness:brightness, alpha:1)
  end

end