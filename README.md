<div align="center"> <h1> Vim </h1> </div>

<div align="center">
Vim customize features is compatible between plugin and vim builtin plugin / command.<br>
Ever without any plugins still can working as similar features.<br>
</div>

<br><div align="center"> <h2> Download </h2> </div>

1. Download vim repository and enter the source code

    ```bash
    git clone https://github.com/vim/vim.git /tmp/vim
    cd /tmp/vim/src
    ```

2. Configure support python[^1] in vim and build the source code then install it

    ```bash
    ./configure --enable-pythoninterp --enable-python3interp
    make
    sudo make install
    ```

3. Restart Terminal and check the vim version

    ```bash
    vim --version
    ```

* either one `+python` or `+python3` features should be included `+` [^1]:

    ```bash
    vim --version | grep python
    ```
<br><div align="center"> <h2> Installation </h2> </div>

1. Clone to `$HOME/.config/vim`

    ```bash
    git clone https://github.com/yimjiajun/vim.git $HOME/.config/vim
    ```

2. Export `vim` customize vim configuration file path[^2]<br>
   Source the script to active the environment variable.

    * zsh shell:

      ```bash
      echo "export VIMINIT='source $HOME/.config/vim/init.vim'" >> $HOME/.zshrc
      source $HOME/.zshrc
      ```

    * bash shell:

      ```bash
      echo "export VIMINIT='source $HOME/.config/vim/init.vim'" >> $HOME/.bash_aliases
      source $HOME/.bashrc
      ```

3. Install vim plugins and install system dependencies package

    ```bash
    vim +PlugInstall +'call Install_all()'
    ```

<br><br><br>
[^1]: `vim --version`: should display either one `+python` or `+python3` to support [snippets](https://en.wikipedia.org/wiki/Snippet_(programming))
[^2]: Why `$VIMINIT` : Startup configuration file rather than calling _.vimrc_ for Neovim and Vim, which environment variable is using on both editor.
