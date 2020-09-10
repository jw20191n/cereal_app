class Cereal < ApplicationRecord
    
    belongs_to :user
    has_many :transactions
    has_many :comments
    delegate :group, to: :user
    validates :name,:amount, presence: true
    validates :amount, numericality: {greater_than_or_equal_to: 0, only_integer:true}


    before_save :make_title_case

    #get_cereal_image = blah
    def find_image(cereal_name)
        # doc = Nokogiri::HTML(open("https://www.google.com/search?q=#{cereal_name}&sxsrf=ACYBGNSxi3DW583RYv6F2QS0VrBnFp4_IA:1569725185387&source=lnms&tbm=isch&sa=X&ved=0ahUKEwj9pceAgvXkAhWBTN8KHeyJD2YQ_AUIEigB&biw=1309&bih=695"))
        cereal_url = "https://www.walmart.com/search/?query=#{cereal_name}+cereal"        
        html = open(cereal_url)
        doc = Nokogiri::HTML(html)
        src_tag = doc.css('.search-product-result').css('img').map{|i| i['src']}[0]
        return "#{src_tag}"
    end

    def taken_amount(trans_amount)
        self.amount -= trans_amount
        self.save
    end

    def make_title_case
        self.name = self.name.titlecase
    end
end
