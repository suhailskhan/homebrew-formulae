cask "basictex@2025.0308" do
  version "2025.0308"
  sha256 "2ad4c72a6cd4dd81eccece1e6933351c9324aa33d7d6095c1efa65ba8bd6d988"

  url "https://ftp.math.utah.edu/pub/tex/historic/systems/mactex/#{version.major}/mactex-basictex-#{version.no_dots}.pkg",
      verified: "ftp.math.utah.edu/pub/tex/historic/systems/mactex/"
  name "BasicTeX"
  desc "Compact TeX distribution as alternative to the full TeX Live / MacTeX"
  homepage "https://www.tug.org/mactex/morepackages.html"

  conflicts_with cask: [
    "basictex",
    "mactex",
    "mactex-no-gui",
  ]

  pkg "mactex-basictex-#{version.no_dots}.pkg"

  uninstall pkgutil: "org.tug.mactex.basictex#{version.major}",
            delete:  [
              "/etc/manpaths.d/TeX",
              "/etc/paths.d/TeX",
              "/Library/TeX",
              "/usr/local/texlive/#{version.major}basic",
            ]

  zap trash: [
        "/usr/local/texlive/texmf-local",
        "~/Library/texlive/#{version.major}basic",
      ],
      rmdir: [
        "/usr/local/texlive",
        "~/Library/texlive",
      ]

  caveats <<~EOS
    You must restart your terminal window for the installation of MacTeX CLI
    tools to take effect.

    Alternatively, Bash and Zsh users can run the command:

      eval "$(/usr/libexec/path_helper)"
  EOS
end
