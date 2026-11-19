cask "ai-quota-studio" do
  version "1.8"
  sha256 "3520bd1ac49d7ffcec486ffe685e7b3a911bcab993a124152f7822935e3e8aa5"

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
