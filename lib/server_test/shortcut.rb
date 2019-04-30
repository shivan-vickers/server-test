module ServerTest
  class Shortcut
    START_MENU_DIRS = [
      "C:/Users/SHVA/AppData/Roaming/Microsoft/Windows/Start Menu/Programs",
      "C:/ProgramData/Microsoft/Windows/Start Menu/Programs"
    ]

    def initialize(filename)
      @shortcut = evaluate_target_path(select(filename, valid_shortcuts))
    end

    def valid_shortcuts
      START_MENU_DIRS.map { |d| Dir["#{d}/**/*.lnk"] }.flatten.reject { |f| f.downcase.include? 'uninstall' }
    end

    def select(filename, shortcuts)
      shortcuts.select { |s| s.downcase.include? filename.downcase }.first.tr('/', '\\')
    end

    def evaluate_target_path(shortcut)
      WIN32OLE.new('WScript.Shell').CreateShortcut(shortcut).targetpath
    end

    def to_s
      @shortcut.to_s
    end
  end
end
