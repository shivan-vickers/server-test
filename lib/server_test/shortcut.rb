module ServerTest
  class Shortcut
    START_MENU_DIRS = [
      "C:/Users/SHVA/AppData/Roaming/Microsoft/Windows/Start Menu/Programs",
      "C:/ProgramData/Microsoft/Windows/Start Menu/Programs"
    ]

    def initialize(query)
      words = filename.split(' ').map { |w| w.downcase }

      shortcut = ''

      valid_shortcuts.each do |s|
        next unless words.all? { |w| s.downcase.include? w }
        shortcut = s
        break
      end

      puts "Shortcut: #{shortcut}"

      @target = evaluate_target_path(shortcut)

      puts "Opening: #{@target}"
    end

    def valid_shortcuts
      START_MENU_DIRS.map { |d| Dir["#{d}/**/*.lnk"] }.flatten.reject { |f| f.downcase.include? 'uninstall' }
    end

    def evaluate_target_path(shortcut)
      wscript_shell = WIN32OLE.new('WScript.Shell')

      shortcut = shortcut.tr('/', '\\')

      wscript_shell.CreateShortcut(shortcut).targetpath
    end

    def to_s
      @target.to_s
    end
  end
end
