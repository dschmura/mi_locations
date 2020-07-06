module PagesHelper
  def class_maker(string)
    if string.index("_") == 1
      string = string[2...].dasherize + "-" + string[0]
    elsif string.index("_") == 2
      string = string[3...].dasherize + "-" + string[0..1]
    else
      string
    end
  end
end
