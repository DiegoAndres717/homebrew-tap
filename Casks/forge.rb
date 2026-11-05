cask "forge" do
  version "0.16.0"
  sha256 "0e80d1e75bae33815b80551336a1c279108b932f5df322f8900c4379dfc68c7e"

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
