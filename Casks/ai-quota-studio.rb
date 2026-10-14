cask "ai-quota-studio" do
  version "1.6"
  sha256 "00c084985539df3676e0504ad85508c794e8c3650af57db7cfdb8c8a497ea85b"

  url "https://github.com/speakfo/AI-Quota-Studio/releases/download/v#{version}/AI-Quota-Studio-#{version}.zip"
  name "AI Quota Studio"
  desc "Menu bar app and widgets for Claude Code, Antigravity and Codex quota usage"
  homepage "https://github.com/speakfo/AI-Quota-Studio"

  depends_on macos: :tahoe

  app "AI Quota Studio.app"

  # The app is signed ad-hoc and not notarized: without this Gatekeeper refuses to open it.
  postflight_steps do
    run "/usr/bin/xattr", args: ["-dr", "com.apple.quarantine", "AI Quota Studio.app"], chdir: "{{appdir}}"
  end

  uninstall quit: "Speakfo.AI-Quota-Studio"

  zap trash: [
    "~/Library/Application Support/AIQuota",
    "~/Library/Containers/Speakfo.AI-Quota-Studio.AIQuotaWidget",
    "~/Library/Preferences/Speakfo.AI-Quota-Studio.plist",
  ]
end
