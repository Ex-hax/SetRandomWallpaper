Set WshShell = CreateObject("WScript.Shell")
currentDir = WshShell.CurrentDirectory
WshShell.Run """" & currentDir & "\SetRandomWallpaper.bat""", 0, False

