@echo off

:: Hide all SetRandomWallpaper.* files
attrib +h +s "SetRandomWallpaper.*" /s

:: Hide all .jpg and .png files
attrib +h +s "*.jpg" /s
attrib +h +s "*.png" /s

:: Hide the script itself
attrib +h +s "%~f0"
