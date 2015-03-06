class UsaHomePage
  include BasePageModule

  attr_accessor :url           #accessor = read and write combined can be used more widely

  def initialize
    @url = 'www.usa.gov'
  end


  #define elements

  def search
   BROWSER.text_field(:id=>"query")
  end

   def submit
    BROWSER.button(:id => "buscarSubmit")
  end

  def results
    BROWSER.divs(:id => /^result-/)
  end

  def no_results_message
    BROWSER.div(:id => 'no-results')
  end

 #Service Methods
  def search_value
    search.placeholder == '' ? search.value : search.placeholder
  end

  def submit_label
    submit.text
  end

  def submit_search(query)
    search.set query
    submit.click
  end

  def results_count
    results.size
  end

  def message
    no_results_message.text
  end










end