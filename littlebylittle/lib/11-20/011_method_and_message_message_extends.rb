class BasicUI
  def notify(text)
    puts text
  end
  def self.strenge(text)
    puts text
  end
end

module UIWithExt
  def notify(*)
    puts "BEEP!"
    super
  end

  def self.strenge(*)
    puts "kkk"
    super
  end
end
ui = BasicUI.new
p ui.method(:notify)
ui.notify("carmen")

eui = ui.extend(UIWithExt)
p ui.method(:notify)
notifyui = eui.notify("carmen")

p BasicUI.method(:strenge)
# BasicUI.include(UIWithExt)
#None business with BasicUi. THE strengs still belongs to UIWithExt
BasicUI.extend(UIWithExt)
p UIWithExt.method(:strenge)
p BasicUI.method(:strenge)
p BasicUI.methods
