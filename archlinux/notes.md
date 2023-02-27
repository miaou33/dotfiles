# TO DO

## BAR
- change colors
- luminosity
- date
  
## DISPLAY MANAGER
- arch logo instead of manjaro

## BOOT
- enlever logo yoga

## NOTIFICATIONS 
- battery low
- screenshot taken
- sound +/-
- luminosity +/-

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
