## Instructions

### 1. Organize Your Files

Place all scripts and images in the appropriate folders:

```
.
|_SetRandomWallpaper.vbs
|_SetRandomWallpaper.bat
|_SetRandomWallpaper.ps1
|_HideSetRandomWallpaper.bat
|_picture1.jpg
|_picture2.jpg
|_ ...
```
- **`pictures`**: All the images you want to use as wallpapers. Only `.jpg` and `.png` files will be detected `required 2 or more`.

### 2. Hide Scripts and Pictures (Optional)

If you're using this on a shared or organized computer and want to hide the scripts and images:

1. Ensure all scripts and images are in their respective folders.
2. Modify your File Explorer settings:
   - Go to `View > Hidden items > Options > View`.
   - Check `Don't show hidden files, folders, or drives`.
   - Check `Hide protected operating system files` (Recommended).
3. Run the batch script (`HideSetRandomWallpaper.bat`) to hide all `.jpg`, `.png`, and script files.

### 3. Set Up a Shortcut or Scheduled Task

To easily trigger the `SetRandomWallpaper.vbs` script:

- **Create a Shortcut**:
  1. Place a shortcut on your Desktop pointing to `SetRandomWallpaper.vbs`.
  2. Assign a hotkey to the shortcut for quick access.

- **Create a Scheduled Task**:
  1. Set up a scheduled task in Task Scheduler to trigger `SetRandomWallpaper.vbs` at your preferred intervals.
