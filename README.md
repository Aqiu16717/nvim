## Plugin

* markdown previewer

```
amcco/markdown-preview.nvim
```

## About `Esc`

* [`Ctrl-C` is not the same as `Esc`](https://vi.stackexchange.com/questions/25764/use-control-c-instead-of-escape-key)


* map `Caps_Lock` to `Esc`. There exists no `Caps_Lock` anymore.

```bash
sudo nvim /etc/profile
xmodmap -e 'clear Lock' -e 'keycode 0x42 = Escape'  
sourc /etc/profile
```

* exchange CapsLock and Esc

```bash
sudo nvim /etc/profile
xmodmap -e 'clear Lock' -e 'keycode 0x42 = Escape' -e 'keycode 0x9=Caps_Lock'
source /etc/profile
```


