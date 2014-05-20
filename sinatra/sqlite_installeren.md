## sqlite3 headers
- `http://sqlite.org/download.html`
- Source code: `amalgamation.zip`
- Precompiled binaries for Win32: `sqlite.dll`

Extract naar `C:\Users\<naam>\sqlite\`
sqlite3.dll ook naar `C:\Ruby200\bin\`

## DevKit
- `http://rubyinstaller.org/downloads/`
- Onderaan: DevKit Ruby 2.0 32 bit
- Voer .exe uit.
- extract naar `C:\Users\<naam>\devkit\`
- Open `cmd.exe` cd naar devkit en voer uit:
- `ruby dk.rb init`
- `ruby dk.rb install`

- `gem install sqlite3 --platform=ruby -- --with-sqlite3-dir=C:\Users\<naam>\sqlite --with-sqlite3-include=C:\Users\<naam>\sqlite`
