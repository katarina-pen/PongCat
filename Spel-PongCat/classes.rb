class AllClasses


  #SIDES
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


  #BOUNCE
  def bounce(direction)
      if direction == :x
        @vel_x *= -1
      elsif direction == :y
        @vel_y *= -1
      end
    end

    

end