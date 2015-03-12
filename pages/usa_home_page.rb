class UsaHomePage
  include BasePageModule

  attr_accessor :url

  def initialize
    @url = 'www.usa.gov'
  end


  #define elements

  def search
    BROWSER.text_field(:id => "query")
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

  def content_box
    BROWSER.div(:class => 'hpboxcontainer')
  end

  def content_box_links
    content_box.links
  end

  def click_content_link(link_text)
    #select loops through collection , clicks first element in the array
    content_box_links.select { |link| link.text == link_text }.first.click
  end

  def sections
    collection = BROWSER.divs(:class => /.*container/)
    collection.push BROWSER.div(:id => 'featureInfo') if BROWSER.div(:id => 'featureInfo').exist?

    collection
  end



  #Service Methods

  def section_titles
    section_collection = []
    sections.each do |section|
      if section.h3.exist?
        section_collection.push(section.h3.text)
      elsif section.h2.exist?
        section_collection.push(section.h2.text) unless section.h2.text =~ /^Content/
      end
    end

    section_collection
  end

  def link_names
    section_links = []

    content_box_links.each do |link|
      link_text = link.text
      #usa step 58
      section_links<<link_text.strip
    end

    section_links
  end






  def content_box_links_name
    content_box_links.collect { |link| link.text }
  end


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

  def content_box_title
    content_box.h2.text
  end


end