uncrustify-vim
==============

the plugin for uncrustify

# Configuration

````
let g:uncrustify_cfg_file_path = "~/.uncrustify.cfg"  " path to uncrustify configuration file
````

# Usage

```
:Uncrustify
```

if you want to run uncrustify when you save your file, ...

```
autocmd BufWritePre <buffer> :call uncrustify#UncrustifyAuto()
```

thanks a lot, [ton1517](http://qiita.com/ton1517).

link: [vimでuncrustifyをいい感じに適用する](http://qiita.com/ton1517/items/c864ea2f51b19aa120b6)
