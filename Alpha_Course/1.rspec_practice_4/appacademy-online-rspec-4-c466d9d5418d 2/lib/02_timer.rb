class Timer
  # TODO: your code goes here!
  attr_accessor :seconds
  def initialize
    @seconds = 0
  end

  def time_string
    hour = ''
    min = ''
    sec = ''
    hour_num = @seconds / 3600
    min_num =(@seconds - hour_num*3600)/60
    sec_num = @seconds%60
    if hour_num < 10
      hour = "0" + hour_num.to_s
    else
      hour = hour_num.to_s
    end

    if min_num < 10
      min = "0" + min_num.to_s
    else
      min = min_num.to_s
    end

    if sec_num < 10
      sec = "0" + sec_num.to_s
    else
      sec = sec_num.to_s
    end

    # if @seconds == 0
    #   return "00:00:00"
    # elsif @seconds < 60
    #   return "00:00:#{@seconds}"
    # elsif 60 <= @seconds < 3600
    #   sec = @seconds%60
    #   min = @seconds/60
    #   return "00:0#{min}:0#{sec}"
    return hour + ":" + min + ':' + sec
  end

end
