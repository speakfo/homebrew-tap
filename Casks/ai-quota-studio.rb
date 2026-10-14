cask "ai-quota-studio" do
  version "1.7"
  sha256 "e285d88ee3eada88cdf1112a9eafe70cf2b38eff50df954b5483233f3b7c5dac"

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
