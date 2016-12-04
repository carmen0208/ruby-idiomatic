## How to use it :
* in my vim config, press `<F4>` to get #=>, then press `<F5>` to get the
  results

## Setup 

1. install rcodetools

   ```sh
gem install rcodetools
   ```

2. install VIM plugin

   [[Link|https://github.com/t9md/vim-ruby-xmpfilter]]

   1. Add plugin in `/.config/nvim/init.vim` (As I installed nvim)

      ```ruby
      Plug 't9md/vim-ruby-xmpfilter'
      ```

   2. Add maps in `/.config/nvim/init.vim`

        ```ruby
        " xmpfilter for ruby
        map <F4> <Plug>(xmpfilter-mark)
        map <F5> <Plug>(xmpfilter-run)
      
        ```

   3. Execute installation command in vim (Install plugins with https://github.com/junegunn/vim-plug)
        
        ```ruby
        :PlugInstall
        ```

### It should be work!
