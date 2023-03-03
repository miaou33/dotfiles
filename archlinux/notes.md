# TO DO

## DISCOVER
- nvim
- doom emacs

## MUSIC
- ✅ bluetooth
- ✅ avancer / reculer / pause 

## BAR
- 🟪 change colors
- ✅ display luminosity/brightness range
- ✅ bluetooth on/off
- ✅ develop files in main/modules/etc
  
## BOOT
- 🟪 enlever logo yoga

## NOTIFICATIONS 
_dunst / dwmn (notification daemons) + libnotify_
- 🟪 battery low
- 🟪 screenshot taken
- 🟪 sound +/-
- 🟪 luminosity +/-
  
## THEME
- 🟪 xrdb .Xresources (general define of colors)
- 🟪 infos on background // manjaro ?

## SYSTEM
- 🟪 problem with i3lock ("failed")

## APPS
- ✅ emojis 

# DONE

## DISPLAY MANAGER

### Lightdm

    Edit config file in /etc/lightdm/lightdm.conf
```
    [Seat:*]
    .....
    greeter-session=lightdm-slick-greeter
    user-session=qtile
    #user-session=i3
    .....
```

### lightdm-slick-greeter

    Copy the picture you want to set background to /usr/share/backgrounds/
    Create slick-greeter.conf as /etc/lightdm/slick-greeter.conf and edit:
```
    [Greeter]
    background=/usr/share/backgrounds/<picture>
```
