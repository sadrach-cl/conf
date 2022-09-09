# typed: false

# frozen_string_literal: true

# svim.rb
class Svim < Formula
  env :std
  desc "Turns macOS input fields into real vim buffers"
  homepage "https://github.com/FelixKratz/SketchyVim"
  url "https://github.com/FelixKratz/SketchyVim/releases/download/v1.0.8/bundle_1.0.8.tgz"
  sha256 "3ffa40a9357f8d7f0c8cf6e23f2038c280eac9591a66545d02d3c20871b45100"
  license "GPL-3.0-only"
  head "https://github.com/FelixKratz/SketchyVim.git"

  def clear_env
    ENV.delete("CFLAGS")
    ENV.delete("LDFLAGS")
    ENV.delete("CXXFLAGS")
  end


  def install
    if build.head?
      clear_env
      system "make"
      system "cp", "bin/svim", "svim"
      system "cp", "examples/svim.sh", "svim.sh"
      system "cp", "examples/blacklist", "blacklist"
      system "cp", "examples/svimrc", "svimrc"
    end

    bin.install "#{buildpath}/svim"
    (pkgshare/"examples").install "#{buildpath}/svimrc"
    (pkgshare/"examples").install "#{buildpath}/blacklist"
    (pkgshare/"examples").install "#{buildpath}/svim.sh"
  end

  def caveats
    <<~EOS
      Copy the example configuration into your home directory and make the script executable:
        mkdir ~/.config/svim
        cp #{opt_pkgshare}/examples/* ~/.config/svim/
        chmod +x ~/.config/svim/svim.sh
    EOS
  end

  plist_options manual: "sketchyvim"

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
          <string>#{opt_bin}/svim</string>
        </array>
        <key>EnvironmentVariables</key>
        <dict>
          <key>PATH</key>
          <string>#{HOMEBREW_PREFIX}/bin:/usr/bin:/bin:/usr/sbin:/sbin</string>
        </dict>
        <key>RunAtLoad</key>
        <true/>
        <key>KeepAlive</key>
        <true/>
        <key>StandardOutPath</key>
        <string>#{var}/log/svim/svim.out.log</string>
        <key>StandardErrorPath</key>
        <string>#{var}/log/svim/svim.err.log</string>
        <key>ProcessType</key>
        <string>Interactive</string>
        <key>Nice</key>
        <integer>-20</integer>
      </dict>
      </plist>
    EOS
  end

  test do
    echo "Have fun!\n"
  end
end
