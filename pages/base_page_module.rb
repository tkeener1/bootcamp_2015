module BasePageModule
  #This module contains methods that can be used from any page

  def visit
    BROWSER.goto url   # not @url cause its in attr

        end

  end