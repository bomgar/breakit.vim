
#Introduction

This plugin breaks lines at a specific character.

```
ba, - break after comma
bb, - break before comma

ba. - break after dot
bb. - break before dot
```

##Before

```
test, test2, test3
```

##After
press ba,
```
test,
 test2,
 test3
```

#Mappings

Default mappings:
```
  nmap <Leader>ba <Plug>Bafter
  nmap <Leader>bb <Plug>Bbefore
```
