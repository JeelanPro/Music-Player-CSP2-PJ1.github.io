# Music Player App — CSP2 Project

Welcome to the Music Player App! This project is a feature-rich music player built using [Processing](https://processing.org/) and the [Minim](https://code.compartmental.net/tools/minim/) audio library as part of the CSP2 coursework. The player offers a custom interface, playlist support, and interactive controls.

---

## 🎥 How to Use the Music Player App

> **Watch the usage demo:**  
> [![How to Use the Music Player App](https://img.youtube.com/vi/VIDEO_ID_HERE/0.jpg)](https://www.youtube.com/watch?v=VIDEO_ID_HERE)
>
> _Replace the above link with your actual usage video URL. The video should demonstrate launching the app, loading music, interacting with controls, and navigating tracks._

---

## 🚀 Quick Start

1. **Install Processing** (3.x or 4.x) from [processing.org](https://processing.org/download).
2. **Install the Minim Library**:  
   In Processing, go to _Sketch → Import Library… → Add Library…_ and search for “Minim”.
3. **Clone or Download** this repository.
4. **Organize your files:**
    - Put your `.mp3` audio files in `Music Player App/J_PAP/Audio/`
    - Place album cover images in `Music Player App/J_PAP/Images/`
5. **Open `Music Player App/J_PAP/J_PAP.pde` in Processing.**
6. **Run the sketch** (press `▶` in Processing).
7. **Use the on-screen controls** to play, pause, skip, shuffle, and manage your music.

---

## 🎛️ Controls Overview

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

All controls are clickable UI elements with hover effects.

---

## 🗂️ Project Structure

```
Music Player App/
  └── J_PAP/
      ├── J_PAP.pde         # Main Processing sketch
      ├── Audio/            # Place your MP3 files here
      └── Images/           # Place your album/cover images here
```

---

## ✨ Features

- **Multiple Audio Tracks:** Playlist support with next, previous, and shuffle controls.
- **Visual Feedback:** Album art, dynamic song titles, and custom-drawn UI elements.
- **Playback Controls:** Play, pause, stop, fast forward, rewind, mute, loop (once/infinite).
- **Responsive Layout:** Adapts to fullscreen and various display sizes.
- **Metadata Integration:** Displays track titles and associated images.
- **Professional UI:** All controls are graphically rendered—no default OS widgets.

---

## 🛠️ Customization

- **Add More Tracks:**  
  Increase `numberOfAudio` and update the `playList` and `audioImages` arrays in the code.
- **Swap Images or Audio:**  
  Replace files in the `Audio/` and `Images/` folders, and update file names in the code if necessary.
- **UI Appearance:**  
  Edit color and font variables at the top of `J_PAP.pde` to match your style.

---

## 📦 Dependencies

- **Processing** (3.x or 4.x)
- **Minim Audio Library**  
  (_Install via Processing’s Library Manager_)

---

## 🧑‍💻 Code Explanation

> **Watch the code walkthrough:**  
> [![Code Explanation of Music Player App](https://img.youtube.com/vi/VIDEO_ID_CODE/0.jpg)](https://www.youtube.com/watch?v=VIDEO_ID_CODE)
>
> _Replace the above link with your actual code explanation video. This video should cover the structure, main logic, and highlight how the app works under the hood._

---

<details>
<summary>Click to expand for a technical breakdown of <code>J_PAP.pde</code></summary>

### J_PAP.pde: Technical Documentation

- **Imports Minim Audio Library:**  
  Handles all audio playback and analysis.
- **Global UI Variables:**  
  All button positions, sizes, and state are managed via descriptive global floats and booleans for dynamic layout.
- **Playlist Management:**  
  Uses arrays (`AudioPlayer[]`, `AudioMetaData[]`) to manage multiple tracks and their metadata.
- **UI Rendering:**  
  Buttons, icons, and labels are rendered using Processing’s graphics API (`rect`, `triangle`, `ellipse`, etc).
- **Image Handling:**  
  Loads and draws both album art and the app’s logo, with aspect-ratio logic for proper scaling.
- **User Interaction:**  
  All controls are interactive. Mouse position and clicks are checked against UI elements for hover and action detection.
- **Audio Controls:**  
  Functions for play, pause, stop, loop (once/infinite), fast forward/rewind, mute, shuffle, next/previous, and exit.
- **Responsive Design:**  
  App adapts to `fullScreen()` and uses `displayWidth`/`displayHeight` for layout calculations.
- **Customization:**  
  Audio/image files, UI colors, fonts, and playlist length are all easily customizable in the code.

For detailed code comments and logic, see [`Music Player App/J_PAP/J_PAP.pde`](Music%20Player%20App/J_PAP/J_PAP.pde).

</details>

---

## 📄 License

This project is for educational use as part of the CSP2 coursework.

---

**_Replace the video links above with your own YouTube or online video URLs before publishing!_**  
For further questions or contributions, open an issue or contact the repo owner.
