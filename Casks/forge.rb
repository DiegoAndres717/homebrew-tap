cask "forge" do
  version "0.7.8"
  sha256 "ac8a8c93789003a001aeb0fd18bd99aca0fa08ce384110daa69472e65ce17dfa"

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
