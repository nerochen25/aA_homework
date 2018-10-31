class Timer
  # TODO: your code goes here!
  attr_accessor :seconds
  def initialize(seconds = 0)
    @seconds = seconds
  end

  def time_string
    return "00:00:00" if seconds == 0
    sec = seconds%60
    hr = seconds/3600
    min = (seconds - hr * 3600)/60

    if sec < 10
      sec = "0#{sec}"
    else
      sec = "#{sec}"
    end

    if min < 10
      min = "0#{min}"
    else
      min = "#{min}"
    end

    if hr < 10
      hr = "0#{hr}"
    else
      hr = "#{hr}"
    end

    return hr + ":" + min + ":" + sec
  end
end
