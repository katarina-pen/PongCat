require_relative 'classes'

class Ball < AllClasses 

    attr_reader :vel_x, :vel_y


    def initialize (image,x, y)
      @image = Gosu::Image.new(image)
      @x = x  
      @y = y
      @vel_x = [-2,-1,1,2].sample
      @vel_y = [-2,-1,1,2].sample

    end


    def update
      @x += @vel_x
      @y += @vel_y
     
     if @x > 800 || @x < 0 || @x >800-100
       bounce(:x)
     end

     if @y > 600 || @y < 0 || @y >600-100
       bounce(:y)
     end

    end

    def draw
      # @image.draw(@x,@y, 1, 0.5, 0.5)
       @image.draw(@x,@y, 1, 1, 1)

    end

end