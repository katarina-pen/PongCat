require 'gosu'
require_relative 'player'


class Game < Gosu::Window
    def initialize
        super 800, 600
        self.caption = "PongCat"
        1.times do   
        @player1 = Player.new("media/sillyCat.jpg", rand(0..400), rand(0..200))
        end
    end
        



    def update
        @player1.update  
        #hur spelaren rör sig. de ligger i update så att den kallas hela tiden när knappen är nedtryckt 
        #istället för bara en gång :)
        if Gosu.button_down? Gosu::KB_UP       
           @player1.move_up
        end 
        
        if Gosu.button_down? Gosu::KB_DOWN      
           @player1.move_down
        end

        if Gosu.button_down? Gosu::KB_LEFT      
                @player1.move_left
        end

        if Gosu.button_down? Gosu::KB_RIGHT      
           @player1.move_right
        end
        


    end

    def draw
        @player1.draw    
        
    end


end

# test = Game.new
# test.show
Game.new.show