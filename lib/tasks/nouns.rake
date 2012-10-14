namespace :nouns do
  desc "Scrape Noun Data"
  task :scrape => :environment do
    #/Users/mattgarrison/Dropbox/IconoclastLabs/all\ icons/noun_project_614.svg 


    (1040..1080).each do |number|
      begin
        @url = "http://thenounproject.com/en-us/search/?q=#{number}"
        agent = Mechanize.new
        page = agent.get(@url)
        @response = page.content
        @doc = Nokogiri::HTML(@response)

        @icon_url = "http://thenounproject.com#{@doc.search('//*[@id="noun-exact-matches"]/li[2]').children[1].attributes['href'].value}"
        page = agent.get(@icon_url)
        @response = page.content
        @doc = Nokogiri::HTML(@response)
        @icon_name = @doc.search('//*[@id="icon"]/div/header/div[1]/h1').children.map{|c| c.text}
        @attribution = @doc.search('//*[@id="attribute"]').children.map{|c| c.text}
        @license = @doc.search('//*[@id="under-icon"]/div/p').children.map{|c| c.text}
        @tags = @doc.css("#icon-#{number}").attribute('data-tags').value.split(',')
        #p @tags
        #@tags = @doc.css("#icon-inner-container li").children.map{|c| c.text}
        
        @noun = Api::Noun.create(
          name:@icon_name[0],
          source_url:@url,
          license:@license[0],
          attribution:@attribution[0],
          icon: File.open("/Users/mattgarrison/Dropbox/IconoclastLabs/all\ icons/noun_project_#{number}.svg")
        )
        
        # Create a tag with the noun's name itself
        @tag = Api::Tag.create(name: @noun.name)
        @noun_tag = Api::NounTag.create(noun_id: @noun.id, tag_id: @tag.id)
        # create each tag from scraped data and then add it to the noun
        @tags.each do |tag| 
          p "Tagname: #{tag} for #{@noun.name}"
          @tag = Api::Tag.create(name: tag)
          @noun_tag = Api::NounTag.create(noun_id: @noun.id, tag_id: @tag.id)
        end
      rescue
        p "Crap!"
      end

    end 
  end
end
