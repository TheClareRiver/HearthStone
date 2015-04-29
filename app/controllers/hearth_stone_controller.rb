class HearthStoneController < ApplicationController
  def index
  	puts "------------------IN INDEX---------------"
  	
  	#For database usage only
  	@allCards = Card.all
  	puts "# of cards = #{@allCards.size}"
  	 

  end

  def openPack #Simulates opening a pack and getting random cards
  	puts "------------------IN CARD PACK-----------------"
  	#@random_card = @card_id[@random_num]
     
	for i in 1..5
	  randNum = rand(100) + 1 #Returns a number from 1-100
	  if randNum >= 0
	    cardType = "Common"
	    cardNum = rand(95).to_s
	  end
	  if randNum >= 72
	    cardType = "Rare"
	    cardNum = rand(79).to_s
	  end
	  if randNum >= 95
	    cardType = "Epic"
	    cardNum = rand(37).to_s
	  end
	  if randNum >= 98
	    cardType = "Legendary"
	    cardNum = rand(35).to_s
	  end  
	  path = "Hearthstone_Golden_Cards/" + cardType + "/HSCard" + cardNum + ".gif"
	  Card.create(:image => path)
	end
    redirect_to :root
    end
end

