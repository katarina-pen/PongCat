class Ball

    attr_reader :right, :top, :bottom


    def initialize (image,x, y)
      @image = Gosu::Image.new(image)
      @x = x  
      @y = y
      @vel_x = [-2,-1,1,2].sample
      @vel_y = [-2,-1,1,2].sample

      @left = @x 
      @right = @x + 100
      @top = @y 
      @bottom = @y + 100
    end

    
    def left
      @x
    end

    def right
      @x + 20
    end

    def update
      @x += @vel_x
      @y += @vel_y
     
     if @x > 800 || @x < 0 || @x >800-100
       @vel_x*=-1
     end

     if @y > 600 || @y < 0 || @y >600-100
       @vel_y*=-1
     end

    end

    def draw
      @image.draw(@x,@y, 1, 0.5, 0.5)

    end

end