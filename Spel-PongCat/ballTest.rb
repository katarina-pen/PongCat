require 'gosu'
require_relative 'ball'
require_relative 'paddel'
require_relative 'middleLine'


class Game < Gosu::Window
   def initialize
      super 800, 600 
      self.fullscreen = true
      self.caption = "PongCat :)"  
      # spel grejer
      @ball = Ball.new("media/catPics/catBall50x50.jpg", 400, 100)
      # player right   
      @paddel = Paddel.new("media/catPics/paddel(50x100px).jpg", 600, 50)
      # player left
      @paddel2 = Paddel.new("media/catPics/paddel(50x100px).jpg", 150, 50)

      # det som ligger lite emellan :)
      @middle = Middle.new("media/catPics/longcat(50x600.jpg", 375, 0)
      @xLeft = 0 #fönstrets x värde på vänster sida
      @xRight = 750 #fönstrets x värde på höger sida
      # @y = 800 #fönstrets y värde
      @player1points = 0
      @player2points = 0

      # ljud 
      @meowPlayer1 = Gosu::Sample.new("media/SFX/catMewoPlayer1.wav")
      @meowPlayer2 = Gosu::Sample.new("media/SFX/catMewoPlayer2.wav")

   end
   
   def update 
      @ball.update
      @paddel.update
      @paddel2.update


      #BALL BOUNCE FOR PLAYER 1
      #p @ball.right#, @paddel.left
      if @ball.right >= @paddel.left &&
         @ball.left <= @paddel.right && 
         @ball.top <= @paddel.bottom && 
         @ball.bottom >= @paddel.top
         # puts "Yay!"
         @ball.bounce(:x)
         @meowPlayer1.play
         # @ball.bounce(:y)
      else
         # puts "Ball: x:#{@ball.left}, y: #{@ball.top}"
         # puts "Padd: x:#{@paddel.left}, y: #{@paddel.top}"
      end

      #BALL BOUNCE FOR PLAYER 2
       if @ball.right >= @paddel2.left &&
         @ball.left <= @paddel2.right && 
         @ball.top <= @paddel2.bottom && 
         @ball.bottom >= @paddel2.top
         # puts "Yay!"
         @ball.bounce(:x)
         @meowPlayer2.play

         
      else
         
      end

      #Bounce för middle line
      if @paddel.right >= @middle.left
         puts "yay"
         # @paddel.bounce(:x)
         
         else

      end

      # poängsystem!!
      if @ball.left <= @xLeft 
         puts "Player right(2) got a point!"
         @player2points += 1
      end

      if @ball.right >= @xRight 
         puts "Player left(1) got a point!"
         @player1points += 1
      end

      #  if @ball.right <= @x+self.width 
      #    puts "Player left(1) got a point!"
      #    @player1points += 1
      # end




      #paddel/player 1!!
      if Gosu.button_down? Gosu::KB_UP       
         @paddel.move_up
      end 
         
      if Gosu.button_down? Gosu::KB_DOWN      
         @paddel.move_down
      end

      if Gosu.button_down? Gosu::KB_LEFT      
         @paddel.move_left
      end

      if Gosu.button_down? Gosu::KB_RIGHT      
         @paddel.move_right
      end

      #paddel/player 2!!
      if Gosu.button_down? Gosu::KB_W       
         @paddel2.move_up
      end 
         
      if Gosu.button_down? Gosu::KB_S      
         @paddel2.move_down
      end

      if Gosu.button_down? Gosu::KB_A      
         @paddel2.move_left
      end

      if Gosu.button_down? Gosu::KB_D      
         @paddel2.move_right
      end
   
   end

   def draw
      @ball.draw
      @paddel.draw
      @paddel2.draw
      @middle.draw

      @font ||= Gosu::Font.new(20)  # skapar fonten/typsnittet EN gång 
      #och behöver inte skapa ett nytt objekt varje frame som med bara draw_text metoden
      @font.draw_text("Points=#{@player1points}", 10, 10, 1, 1, 1, 0xff_ffffff)
      @font.draw_text("Points=#{@player2points}", 700, 10, 1, 1, 1, 0xff_ffffff)
      
   end
end

Game.new.show