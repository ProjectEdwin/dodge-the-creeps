# 🎮 Dodge the Creeps (ProjectEdwin Edition)

An indie, learning-in-public game project built with **Godot 4.6**.

This game **started as Godot’s official “Dodge the Creeps” tutorial**, and is slowly evolving into its *own thing* as I learn more about game development, one experiment (and bug) at a time.

If you’re here to:
- play a simple but escalating survival game  
- learn Godot by example  
- see what “learning in public” looks like  
- or just dodge some creeps  

…you’re in the right place.

---

## 🕹️ Play the Game

### 👉 Download builds (macOS / Windows / Linux)
**Landing page:**  
🔗 https://dodge.edwinsoto.net

Includes:
- macOS (.dmg)
- Windows (.zip)
- Linux (.zip)

### 🌐 Experimental Web Build
Want to try it in the browser?

🔗 https://dodge.edwinsoto.net/experimental/index.html  

> ⚠️ The web build is *extra experimental*. Performance, input, and fullscreen behavior may vary. Expect weirdness.

---

## 🎯 How to Play

**Goal:**  
Survive as long as possible and beat your own **Best (hi-score)**.

**Controls:**
- Move: **Arrow Keys** or **WASD**
- New Game / Restart: **Enter** or **Mouse Click**
- Gamepads are supported (and encouraged)

As your score increases:
- Creeps spawn more frequently
- Creeps move faster
- Panic becomes optional but understandable

## 🔮 Powerup System (v0.0.2)

Powerups unlock once you prove you can survive.

### 🧠 Unlock Condition
- Powerups begin spawning **after reaching a score of 20**.
- Only **one powerup can exist at a time**.
- Powerups spawn **randomly**.
- Powerups are **not stackable** — one effect at a time.

This keeps things strategic instead of chaotic.

---

### 🛡️ Ghost Mode
- Temporarily allows the player to pass through enemies.
- Audio effect performed by **Jeesely** — and honestly, it might be the best sound in the game.

---

### 💣 Bomb Mode
- Instantly destroys all enemies currently on screen.
- Useful when things get... uncomfortable.

---

### 🐭 Tiny Mode
- Shrinks the player.
- Makes tight dodging possible (and slightly hilarious).
- Includes custom sound effects (made by yours truly).

---

Powerups are still being tuned for balance.
If something feels too strong, too weak, or too chaotic,
please let me know via the feedback form.

---

## 🛠️ Running the Project Locally

If you want to explore or modify the game:

### Requirements
- **Godot Engine 4.6**
- Renderer: **Forward+**  
  _(Yes, I haven’t deeply explored the advantages of other renderers yet — still learning 😄)_

### Steps
1. Clone this repository:
   ```bash
   git clone https://github.com/ProjectEdwin/dodge-the-creeps.git
