module HelperMethods
  module Methods

    #launch a browser instance
    def launch_browser(browser_name)          #Where does browser get its name
      browser_name ||= 'ff'
            Watir::Browser.new(browser_name) #Create the method

    end


    #Use the environment variable:  ENV[‘browser’]
  end

  # make Methods instance methods in objects (with class) that include HelperMethods
  include self::Methods
  # make Methods available directly as HelperMethods.<method>
  self.extend(Methods)
  # make Methods class methods of classes that include HelperMethods
  def self.included(base)
    base.extend(Methods)   #probably never used
  end

  #card 4
  def suppress_warnings
    #from http://mentalized.net/journal/2010/04/02/suppress-warnings-from-ruby/
    original_verbosity = $VERBOSE
    $VERBOSE = nil
    result = yield
    $VERBOSE = original_verbosity

    result
  end


end
