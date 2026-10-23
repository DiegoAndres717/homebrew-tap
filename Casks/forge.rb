cask "forge" do
  version "0.12.3"
  sha256 "e927b5633aaf8cb2b2042acb327c79c4167e4b4248fbc48dd97c7fbf8461d225"

  url "https://github.com/DiegoAndres717/forge/releases/download/v#{version}/Forge-#{version}.dmg"
  name "Forge"
  desc "Native workspace for building software with AI agents"
  homepage "https://github.com/DiegoAndres717/forge"

  depends_on macos: :ventura

  app "Forge.app"
  binary "#{appdir}/Forge.app/Contents/MacOS/forge"

  # Forge aún no está notarizado por Apple: sin esto, macOS diría que no se puede abrir.
  postflight_steps do
    run "/usr/bin/xattr", args: ["-dr", "com.apple.quarantine", "{{appdir}}/Forge.app"]
  end

  zap trash: [
    "~/.config/forge",
    "~/Library/Application Support/Forge",
  ]
end
