Date::DATE_FORMATS[:wdm] = lambda { |time|
  day_format = ActiveSupport::Inflector.ordinalize(time.day)
  time.strftime("%A, %B #{day_format}")
}