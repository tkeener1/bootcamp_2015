Before do
  #launch the browser
  # Set to the constant BROWSER
  BROWSER = HelperMethods.launch_browser ENV['browser']       #ENV is a run time variable
  BROWSER.goto ('USA.gov')

end

After do

  BROWSER.close

end
