# #Modify this class so both flip_switch and the setter method switch= are private methods.


class Machine
  attr_writer :switch

  def start
    self.flip_switch(:on)
  end

  def stop
    self.flip_switch(:off)
  end
  
  private
    def flip_switch(desired_state)
    self.switch = desired_state
    end
    
    attr_reader :switch
  
end