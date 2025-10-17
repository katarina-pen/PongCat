require_relative 'classes'

class Paddel < AllClasses

    attr_reader 

    def initialize (image,x, y)
      @image = Gosu::Image.new(image)
      @x = x  
      @y = y
      @vel_x = [-2,-1,1,2].sample
      @vel_y = [-2,-1,1,2].sample

    end

    def update
      # @x += @vel_x
      # @y += @vel_y

     if @x > 800 || @x < 0 || @x >800-100
       bounce(:x)
     end

     if @y > 600 || @y < 0 || @y >600-100
       bounce(:x)
     end

    end



    def draw
      # @image.draw(@x,@y, 1, 0.1, 1.0) 
      @image.draw(@x,@y, 1, 1, 1) 
    end

    #rörelser
    def move_up 
      @y -= 6.0
      if @y <= 0
          @y = 0
      end
    end

    def move_down 
      @y += 6.0
      if @y <= 0
          @y = 0
      end
    end

    def move_left 
      @x -= 6.0
      if @x <= 0
          @x = 0
      end
    end

    def move_right
      @x += 6.0
      if @x <= 0
          @x = 0
      end
    end

end