Add-Type -AssemblyName System.Windows.Forms

# Get the directory where the script is located
$scriptDir = Split-Path -Parent $MyInvocation.MyCommand.Path

# Get all files in the directory and filter for images
$wallpapers = Get-ChildItem -Path $scriptDir -File | Where-Object { $_.Extension -in '.jpg', '.png' }

# Check if any wallpapers were found
if ($wallpapers.Count -eq 0) {
    [System.Windows.Forms.MessageBox]::Show("No images found in the specified directory.", "Alert", [System.Windows.Forms.MessageBoxButtons]::OK, [System.Windows.Forms.MessageBoxIcon]::Warning)
    exit
}
if ($wallpapers.Count -eq 1) {
    [System.Windows.Forms.MessageBox]::Show("Required equal to or more than 2 pictures.", "Alert", [System.Windows.Forms.MessageBoxButtons]::OK, [System.Windows.Forms.MessageBoxIcon]::Warning)
    exit
}

# Get the current wallpaper path from the registry
$currentWallpaper = (Get-ItemProperty -Path "HKCU:\Control Panel\Desktop").Wallpaper

# Retrieve the path of the previous wallpaper
if (Test-Path $currentWallpaper) {

} else {
    $currentWallpaper = ""
}

# Randomly select a new wallpaper different from the previous one
do {
    $randomWallpaper = $wallpapers | Get-Random
} while ($randomWallpaper.FullName -eq $currentWallpaper)

# Set the selected wallpaper
Set-ItemProperty -Path "HKCU:\Control Panel\Desktop" -Name Wallpaper -Value $randomWallpaper.FullName

# Refresh the desktop to immediately apply the change
$sig = @'
[DllImport("user32.dll", CharSet = CharSet.Auto)]
public static extern int SystemParametersInfo(int uAction, int uParam, string lpvParam, int fuWinIni);
'@
$User32 = Add-Type -MemberDefinition $sig -Name 'User32' -Namespace 'Win32' -PassThru
$SPI_SETDESKWALLPAPER = 0x0014
$UPDATE_INI_FILE = 0x01
$SEND_CHANGE = 0x02
$User32::SystemParametersInfo($SPI_SETDESKWALLPAPER, 0, $randomWallpaper.FullName, $UPDATE_INI_FILE -bor $SEND_CHANGE)
