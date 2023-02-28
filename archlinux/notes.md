# TO DO

## MUSIC
- bluetooth
- avancer / reculer / pause 

## BAR
- change colors
- display luminosity/brightness range
- bluetooth on/off
  
## DISPLAY MANAGER
- arch logo instead of manjaro

## BOOT
- enlever logo yoga

## NOTIFICATIONS 
- battery low
- screenshot taken
- sound +/-
- luminosity +/-
  
## THEME
- xrdb .Xresources (general define of colors)


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
