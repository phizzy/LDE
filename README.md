LDE
===

Local Dev Environment


###vim###
* To install Vim 7.4 on Ubuntu 13.04 Raring Ringtail, Ubuntu 12.04 Precise Pangolin, Linux Mint 15 Olivia and Linux Mint 13 Maya,
    * sudo add-apt-repository ppa:fcwu-tw/ppa
    * sudo apt-get update
    * sudo apt-get install vim

* Setup Vundle
    * git clone https://github.com/gmarik/vundle.git ~/.vim/bundle/vundle

* Setup YouCompleteMe
    * git clone https://github.com/Valloric/YouCompleteMe.git ~/.vim/bundle/YouCompleteMe
    * cd ~/.vim/bundle/YouCompleteMe
    * sudo apt-get install build-essential cmake
    * sudo apt-get install python-dev
    * ./install.sh --clang-completer
