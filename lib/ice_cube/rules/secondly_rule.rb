module IceCube

  class SecondlyRule < Rule

    # Determine whether this rule occurs on a give date.
    def in_interval?(date, start_date)
      #make sure we're in a proper interval
      day_count = date - start_date
      day_count % @interval == 0
    end

    def to_ical 
      'FREQ=SECONDLY' << to_ical_base
    end
        
    def to_s
      to_s_base 'Secondly', "Every #{@interval} seconds"
    end
        
    protected
           
    def default_jump(date, attempt_count = nil)
      date + 1.second
    end

    private

    def initialize(interval)
      super(interval)
    end
             
  end

end
