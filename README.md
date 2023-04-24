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

2. Export aliases `vim` as using customize vim configuration file[^1]<br>
   Aliases the `vim` depends on using shell:

    * zsh shell:

      ```bash
      echo "alias vim="-u "$HOME/.config/vim/init.vim"" >> ~/.zshrc
      ```

    * bash shell:

      ```bash
      echo "alias vim="-u "$HOME/.config/vim/init.vim"" >> ~/.bash_aliases
      ```

3. Install plugins

    ```bash
    vim +PlugInstall
    ```

[^1]: Why not `$VIMINIT` : Distinct between Neovim and Vim, which environment variable is using on both editor.
