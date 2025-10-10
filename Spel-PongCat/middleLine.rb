class Middle

  def initialize (image,x, y)
        @image = Gosu::Image.new(image)
        @x = x  
        @y = y
  
  end

  def left
      @x
    end

    def right 
      @x + @image.width
    end

    def top
      @y
    end

    def bottom
      @y + @image.height
    end

  def update

  end


  def draw
       @image.draw(@x,@y, 1, 1, 1)

    end

end