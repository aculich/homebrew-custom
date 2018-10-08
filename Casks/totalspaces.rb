cask 'totalspaces' do
  version '2.7.6'
  sha256 '2d37147f4c80dfc6c25f9d7cda2c4c4c448d80512a91ac288b90df9ae2b46db2'

  url "http://downloads.binaryage.com/TotalSpaces#{version.major}-#{version}.dmg"
  appcast "http://updates-s3.binaryage.com/totalspaces#{version.major}.xml"
  name 'TotalSpaces'
  homepage 'https://totalspaces.binaryage.com/'

  installer manual: "TotalSpaces#{version.major}.app"

  uninstall pkgutil: "com.binaryage.TotalSpaces#{version.major}",
            script:  {
                       executable: "TotalSpaces#{version.major} Uninstaller.app/Contents/MacOS/TotalSpaces#{version.major} Uninstaller",
                       args:       ['--headless'],
                       sudo:       true,
                     },
            signal:  [
                       ['INT', 'com.binaryage.totalspacescrashwatcher'],
                       ['KILL', 'com.binaryage.totalspacescrashwatcher'],
                     ],
            quit:    "com.binaryage.TotalSpaces#{version.major}"
end
