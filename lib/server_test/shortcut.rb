module ServerTest
  class Shortcut
    START_MENU_DIRS = [
      "C:/Users/SHVA/AppData/Roaming/Microsoft/Windows/Start Menu/Programs",
      "C:/ProgramData/Microsoft/Windows/Start Menu/Programs"
    ]

    class << self
      attr_accessor :wscript_shell
    end

    def initialize(filename)
      words = filename.split(' ')

      shortcut = valid_shortcuts.select do |s|
        words.any? { |w| s.downcase.include? w.downcase }
      end.first

      @target = evaluate_target_path(shortcut)
    end

    def valid_shortcuts
      START_MENU_DIRS.map { |d| Dir["#{d}/**/*.lnk"] }.flatten.reject { |f| f.downcase.include? 'uninstall' }
    end

    def evaluate_target_path(shortcut)
      self.class.wscript_shell ||= WIN32OLE.new('WScript.Shell')

      shortcut = shortcut.tr('/', '\\')

      self.class.wscript_shell.CreateShortcut(shortcut).targetpath
    end

    def to_s
      @target.to_s
    end
  end
end
