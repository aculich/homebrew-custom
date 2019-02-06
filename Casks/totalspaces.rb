cask 'totalspaces' do
  version '2.7.9'
  sha256 '3aeb6d39c67a0dc8aa89e2c965c4590af03b6825f9f72deab129a3efd288a7d6'

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
