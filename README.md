<div align="center"> <h1> Vim </h1> </div>

<div align="center">
Vim customize features is compatible between plugin and vim builtin plugin / command.<br>
Ever without any plugins still can working as similar features.<br>
</div>

<div align="center"> <h2> Installation </h2> </div>

1. Clone to `$HOME/.config/vim`

    ```bash
    git clone https://github.com/yimjiajun/vim.git $HOME/.config/vim
    ```

2. Export `vim` customize vim configuration file path[^1]<br>
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

3. Install plugins

    ```bash
    vim +PlugInstall
    ```

[^1]: Why not `$VIMINIT` : Distinct between Neovim and Vim, which environment variable is using on both editor.
