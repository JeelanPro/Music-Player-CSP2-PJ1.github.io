## 🎵 J_PAP.pde — Music Player App (Processing/Minim)

**`J_PAP.pde`** is the main code for the interactive Music Player App built in [Processing](https://processing.org/) using the [Minim](https://code.compartmental.net/tools/minim/) audio library.  
This sketch provides a fully-featured, visually rich music player with multiple songs, album images, and a custom UI.  
It is designed as part of the CSP2 Project.

### ✨ Features

- **Audio Playback:** Play, pause, stop, rewind, fast-forward, and mute/unmute tracks.
- **Playlist:** Supports multiple audio files and cycles between them.
- **Looping:** Loop current track once or infinitely.
- **Shuffle:** Jump to a random track.
- **Navigation:** Next/previous track navigation.
- **Track Metadata:** Displays song titles and images associated with each track.
- **Custom UI:** All controls (buttons, timeline, etc.) are drawn with Processing's graphics, including hover effects and icons.
- **Responsive Layout:** Adapts to fullscreen and various display sizes.
- **Exit Button:** Quick exit from the app.

### 🗂️ File Structure & Assets

- **Audio files:** Place your `.mp3` files in the folder: `Music Player App/J_PAP/Audio/`
- **Images:** Place your `.jpg` images (album art, logo, etc.) in: `Music Player App/J_PAP/Images/`
- **Main sketch:** `Music Player App/J_PAP/J_PAP.pde`

### 🛠️ Dependencies

- **Processing** (3.x or 4.x)
- **Minim Library**  
  Install from Processing:  
  _Sketch → Import Library… → Add Library… → Search for “Minim”_

### 🚀 How to Use

1. **Open** the `J_PAP.pde` file in Processing.
2. **Ensure** your audio and image files are in the correct locations as described above.
3. **Run** the sketch (`▶` in Processing).
4. **Interact** with the on-screen controls to play/pause/skip/mute/shuffle your music.

### 🎛️ Controls

| Button         | Action                        |
|----------------|------------------------------|
| ▶️ Play        | Play current audio            |
| ⏸ Pause       | Pause current audio           |
| ⏹ Stop        | Stop and rewind current audio |
| 🔁 Loop Once   | Play current track once       |
| ♾️ Loop Inf    | Loop current track infinitely |
| ⏩ Fast Forward| Skip ahead in track           |
| ⏪ Rewind      | Skip backward in track        |
| 🔇 Mute        | Mute/unmute audio             |
| ⏭ Next        | Play next track               |
| ⏮ Previous    | Play previous track           |
| 🔀 Shuffle     | Play random track             |
| ❌ Exit        | Quit the app                  |

*All controls are clickable UI elements drawn on the screen. Hover effects are included.*

### 📋 Code Highlights

- Uses many global variables for precise UI layout and button interactions.
- Dynamically loads audio and images for each track.
- Responsive resizing using `appWidth` and `appHeight`.
- Mouse interactions for all controls.
- Uses Processing’s `rect`, `triangle`, `ellipse`, etc., to draw all UI elements.

### 📦 Customization

- **Add more tracks**:  
  Increase `numberOfAudio`, update the `playList`, `audioImages`, and add the necessary files to the Audio and Images folders.
- **Change UI colors or font**:  
  Adjust `titleTextColor`, `titleTextStyle`, and other color/font variables at the top of the file.
- **Replace images/sounds**:  
  Swap files in the `Images/` and `Audio/` folders and update file names in the code.
