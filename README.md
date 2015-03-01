
#Introduction

This plugin breaks lines at a specific character.

```
<Leader>ba, - break after comma
<Leader>bA, - break after comma remove space
<Leader>bb, - break before comma

<Leader>ba. - break after dot
<Leader>bA. - break after dot remove space
<Leader>bb. - break before dot
```

##Before

```
test, test2, test3
```

##After
&lt;Leader&gt;ba,
```
test,
 test2,
 test3
```

&lt;Leader&gt;bA,
```
test,
test2,
test3
```

#Mappings

Default mappings:
```
  nmap <Leader>ba <Plug>Bafter
  nmap <Leader>bA <Plug>Bafter_remove_space
  nmap <Leader>bb <Plug>Bbefore
```
