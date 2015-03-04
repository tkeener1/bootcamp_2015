class UsaHomePage
  include BasePageModule

  attr_accessor :url           #accessor = read and write combined can be used more widely

  def initialize
    @url = 'www.usa.gov'
  end

end
