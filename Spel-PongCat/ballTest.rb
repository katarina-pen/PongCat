require 'gosu'
require_relative 'ball'
require_relative 'paddel'

class Game < Gosu::Window
   def initialize
      super 800, 600
      self.caption = "Ball Test"  
      @ball = Ball.new("media/catBall50x50.jpg", rand(0..400), rand(0..200))   
      @paddel = Paddel.new("media/paddel(50x100px).jpg", rand(0..400), rand(0..200))
   end
   
   def update 
      @ball.update
      @paddel.update

      #p @ball.right#, @paddel.left
      if @ball.right >= @paddel.left &&
         @ball.left <= @paddel.right && 
         @ball.top <= @paddel.bottom && 
         @ball.bottom >= @paddel.top
         puts "Yay!"
         @ball.bounce(:x)
         # @ball.bounce(:y)
      else
         puts "Ball: x:#{@ball.left}, y: #{@ball.top}"
         puts "Padd: x:#{@paddel.left}, y: #{@paddel.top}"
      end

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
   
   end

   def draw
      @ball.draw
      @paddel.draw
   end
end

Game.new.show