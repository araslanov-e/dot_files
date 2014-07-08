## Установка

Загрузка файлов

    $ git clone git://github.com/araslanov-e/dot_files ~/.dot_files

Установка дополнительных пакетов в систему

    $ sudo apt-get install ack-grep

Установка vundle для установки плагинов vim

    $ git clone https://github.com/gmarik/vundle.git ~/.dot_files/.vim/bundle/vundle

Создание символических ссылок
    
    $ ln -s ~/.dot_files/.bashrc ~/.bashrc
    $ ln -s ~/.dot_files/.gitconfig ~/.gitconfig
    $ ln -s ~/.dot_files/.vim ~/.vim
    $ ln -s ~/.dot_files/.vimrc ~/.vimrc
    $ ln -s ~/.dot_files/.ackrc ~/.ackrc
    $ ln -s ~/.dot_files/.gemrc ~/.gemrc
    $ ln -s ~/.dot_files/.tmux.conf ~/.tmux.conf
  
Добавляем в .bash_profile
    
    if [ -f ~/.bashrc ]; 
    then 
      source ~/.bashrc 
    fi
