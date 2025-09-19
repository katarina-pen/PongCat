class Player

    def initialize (image,x, y)
      @image = Gosu::Image.new(image)
      @x = x  
      @y = y
      @vel_x = [-2,-1,1,2].sample
      @vel_y = [-2,-1,1,2].sample
    end

    def update

      #   if @x > 800 || @x < 0 || @x >800-180
      #    @vel_x*=-1
      #  end

      #  if @y > 600 || @y < 0 || @y >600-180
      #    @vel_y*=-1
      #  end

      #border
     if @x == 800 || @y == 600
      @vel_x = 0
     end

     if @y == 600
      @vel_y = 0
     end
    
    end

    def draw
      #@image.draw(@x,@y, 1, 0.5, 0.5)
      
      @image.draw(@x,@y, 1, 0.1, 1.0) #<-- Detta är ungefärlig storlek på paddeln/playern

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