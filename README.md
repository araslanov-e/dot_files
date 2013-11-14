## Установка

```terminal
# загрузка файлов
git clone git://github.com/smartjeck/dot_files ~/.dot_files

# установка vundle для установки плагинов vim
git clone https://github.com/gmarik/vundle.git ~/.dot_files/.vim/bundle/vundle

# создание символических ссылок
ln -s ~/.dot_files/.bashrc ~/.bashrc
ln -s ~/.dot_files/.gitconfig ~/.gitconfig
ln -s ~/.dot_files/.vim ~/.vim
ln -s ~/.dot_files/.vimrc ~/.vimrc
ln -s ~/.dot_files/.ackrc ~/.ackrc
ln -s ~/.dot_files/.gemrc ~/.gemrc

# добавляем в .bash_profile
if [ -f ~/.bashrc ]; 
then 
  source ~/.bashrc 
fi
```
