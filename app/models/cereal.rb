class Cereal < ApplicationRecord
    
    belongs_to :user
    has_many :transactions
    has_many :comments
    delegate :group, to: :user

    #get_cereal_image = blah
    def find_image(cereal_name)
        doc = Nokogiri::HTML(open("https://www.google.com/search?q=#{cereal_name}&sxsrf=ACYBGNSxi3DW583RYv6F2QS0VrBnFp4_IA:1569725185387&source=lnms&tbm=isch&sa=X&ved=0ahUKEwj9pceAgvXkAhWBTN8KHeyJD2YQ_AUIEigB&biw=1309&bih=695"))
        src_tag = doc.css('img').map{|i| i['src']}[0]
        return "#{src_tag}"
    end

    def taken_amount(trans_amount)
        self.amount -= trans_amount
        self.save
    end
end
