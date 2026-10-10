cask "forge" do
  version "0.4.1"
  sha256 "f6c8d711d7f83c6a0cd7c8272bbd14b65d710e554c31ed763e1ad2551353814e"

  url "https://github.com/DiegoAndres717/forge/releases/download/v#{version}/Forge-#{version}.dmg"
  name "Forge"
  desc "Native workspace for building software with AI agents"
  homepage "https://github.com/DiegoAndres717/forge"

  depends_on macos: ">= :ventura"

  app "Forge.app"
  binary "#{appdir}/Forge.app/Contents/MacOS/forge"

  # Forge aún no está notarizado por Apple: sin esto, macOS diría que no se puede abrir.
  postflight do
    system_command "/usr/bin/xattr",
                   args: ["-dr", "com.apple.quarantine", "#{appdir}/Forge.app"]
  end

  zap trash: [
    "~/.config/forge",
    "~/Library/Application Support/Forge",
  ]
end
