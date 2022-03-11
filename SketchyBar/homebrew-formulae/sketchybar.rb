# typed: false

# frozen_string_literal: true

# sketchybar.rb
class Sketchybar < Formula
  env :std
  desc "Custom macOS statusbar with shell plugin, interaction and graph support"
  homepage "https://github.com/FelixKratz/SketchyBar"
  url "https://github.com/sadrach-cl/conf/blob/main/SketchyBar/v2.5.0.tar.gz?raw=true"
  license "GPL-3.0-only"
  head "https://github.com/FelixKratz/SketchyBar.git"

  depends_on "cmake"

  def clear_env
    ENV.delete("CFLAGS")
    ENV.delete("LDFLAGS")
    ENV.delete("CXXFLAGS")
  end

  def install
    clear_env
    (var/"log/sketchybar").mkpath
    system "cmake", "."
    system "make"
    system "codesign", "--force", "-s", "-", "#{buildpath}/bin/sketchybar"
    bin.install "#{buildpath}/bin/sketchybar"
    (pkgshare/"examples").install "#{buildpath}/sketchybarrc"
    (pkgshare/"examples").install "#{buildpath}/plugins/"
  end

  def caveats
    <<~EOS
      Copy the example configuration into your home directory and make the scripts executable:
        mkdir ~/.config/sketchybar
        cp #{opt_pkgshare}/examples/sketchybarrc ~/.config/sketchybar/sketchybarrc
        mkdir ~/.config/sketchybar/plugins
        cp -r #{opt_pkgshare}/examples/plugins/ ~/.config/sketchybar/plugins/
        chmod +x ~/.config/sketchybar/plugins/*
    EOS
  end

  plist_options manual: "sketchybar"

  def plist
    <<~EOS
      <?xml version="1.0" encoding="UTF-8"?>
      <!DOCTYPE plist PUBLIC "-//Apple//DTD PLIST 1.0//EN" "http://www.apple.com/DTDs/PropertyList-1.0.dtd">
      <plist version="1.0">
      <dict>
        <key>Label</key>
        <string>#{plist_name}</string>
        <key>ProgramArguments</key>
        <array>
          <string>#{opt_bin}/sketchybar</string>
        </array>
        <key>EnvironmentVariables</key>
        <dict>
          <key>PATH</key>
          <string>#{HOMEBREW_PREFIX}/bin:/usr/bin:/bin:/usr/sbin:/sbin</string>
          <key>LANG</key>
          <string>en_US.UTF-8</string>
        </dict>
        <key>RunAtLoad</key>
        <true/>
        <key>KeepAlive</key>
        <true/>
        <key>StandardOutPath</key>
        <string>#{var}/log/sketchybar/sketchybar.out.log</string>
        <key>StandardErrorPath</key>
        <string>#{var}/log/sketchybar/sketchybar.err.log</string>
        <key>ProcessType</key>
        <string>Interactive</string>
        <key>Nice</key>
        <integer>-20</integer>
      </dict>
      </plist>
    EOS
  end

  test do
    echo "To test your installation run: sketchybar -v \n"
  end
end
