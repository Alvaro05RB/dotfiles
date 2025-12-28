# Arch Linux + Hyprland Dotfiles

My personal configuration files for Arch Linux, managed with GNU Stow.

## 📂 Repository Structure

The repository follows the Stow structure:

- Folders (e.g., `hyprland`, `waybar`, `kitty`) represent packages
- Inside each folder, the path mirrors the home directory (e.g., `hyprland/.config/hypr`)
- `packages/` folder contains the list of installed software

## 🛠️ Installation (Restore) on a New Machine

Follow these steps to replicate this setup on a fresh Arch Linux installation.

### 1. Clone the Repository

Clone this repo into your home directory.

```bash
# Install git if not present
sudo pacman -S git

# Clone to ~/dotfiles
git clone https://github.com/Alvaro05RB/dotfiles.git ~/dotfiles
cd ~/dotfiles
```

### 2. Install Official Packages (Pacman)

Run this first to install all standard repository packages.

```bash
sudo pacman -S --needed - < packages/pkglist-repo.txt
```

### 3. Install AUR Packages (Yay)

```bash
sudo pacman -S --needed base-devel git
git clone https://aur.archlinux.org/yay.git
cd yay
makepkg -si
cd .. && rm -rf yay
```

Once yay is ready, install the AUR list:

```bash
yay -S --needed - < packages/pkglist-aur.txt
```

### 4. Apply Configurations (Stow)

Use GNU Stow to create symlinks from this repo to your home directory.

```bash
cd ~/dotfiles

# Install Stow if you haven't yet
sudo pacman -S stow

# Apply essential configs
stow hyprland
stow waybar
stow kitty
stow shell
stow starship
stow gtk
stow dunst
stow wofi

# Apply any other packages as needed...
```

## 🔄 Daily Workflow & Backup

### How to add a new config file

To add a new application configuration (e.g., `mpv`):

1. **Create the structure:**
   ```bash
   mkdir -p ~/dotfiles/mpv/.config/mpv
   ```

2. **Move the config:**
   ```bash
   mv ~/.config/mpv/* ~/dotfiles/mpv/.config/mpv/
   ```

3. **Link it:**
   ```bash
   cd ~/dotfiles
   stow mpv
   ```

### How to update package lists

If you install new software, update the tracking lists:

```bash
cd ~/dotfiles

# 1. Export Native Pacman Packages
pacman -Qqen > packages/pkglist-repo.txt

# 2. Export Foreign (AUR) Packages
pacman -Qqem > packages/pkglist-aur.txt

# 3. Push changes
git add packages/
git commit -m "Updated package lists"
git push
```

---

## 📝 License

This repository is personal configuration. Feel free to use and modify as needed.

## 🤝 Contributing

This is a personal dotfiles repository, but suggestions and improvements are welcome via issues or pull requests.
