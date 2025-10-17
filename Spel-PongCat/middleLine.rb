require_relative 'classes'

class Middle < AllClasses

  def initialize (image,x, y)
        @image = Gosu::Image.new(image)
        @x = x  
        @y = y
  
  end

  def update

  end


  def draw
       @image.draw(@x,@y, 1, 1, 1)

    end

end