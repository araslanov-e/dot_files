## Установка

Загрузка файлов

    $ git clone git://github.com/araslanov-e/dot_files ~/.dot_files

Установка дополнительных пакетов в систему

    $ sudo apt-get install ack-grep

Установка vundle для установки плагинов vim

    $ git clone https://github.com/gmarik/vundle.git ~/.dot_files/vim/bundle/vundle

Создание символических ссылок
    
    $ ln -s ~/.dot_files/.bashrc ~/.bashrc
    $ ln -s ~/.dot_files/bash ~/.bash
    or
    $ ln -s ~/.dot_files/.zshrc ~/.zshrc

    $ ln -s ~/.dot_files/.gitconfig ~/.gitconfig
    $ ln -s ~/.dot_files/vim ~/.vim
    $ ln -s ~/.dot_files/.vimrc ~/.vimrc
    $ ln -s ~/.dot_files/.ackrc ~/.ackrc
    $ ln -s ~/.dot_files/.gemrc ~/.gemrc
    $ ln -s ~/.dot_files/.tmux.conf ~/.tmux.conf
    $ ln -s ~/.dot_files/.gitignore_global ~/.gitignore_global
  
Добавляем в .bash_profile
    
    if [ -f ~/.bashrc ]; 
    then 
      source ~/.bashrc 
    fi


# Links

  https://github.com/robbyrussell/oh-my-zsh
  
  https://github.com/tmuxinator/tmuxinator
  
  https://github.com/rtomayko/git-sh

# mysql
	sudo apt-get install libmysqlclient-dev
	gem install mysql2
