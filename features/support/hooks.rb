Before do
  #launch the browser
  # Set to the constant BROWSER
  BROWSER = HelperMethods.launch_browser ENV['browser']
end

After do

  BROWSER.close

end
