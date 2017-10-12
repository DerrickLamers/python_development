echo Begin setup ....
echo "Europe/Stockholm" | sudo tee /etc/timezone
sudo dpkg-reconfigure --frontend noninteractive tzdata
sudo apt-get update
sudo apt-get -y upgrade
echo Modifying prompt
echo 'function parse_git_branch {
    ref=$(git symbolic-ref HEAD 2> /dev/null) || return
    echo "("${ref#refs/heads/}") "
}' >> ~/.bashrc
echo 'PS1="\[\033[48;5;244;38;5;255m\]\u@\h:\W \$(parse_git_branch)$\[\033[00m\] "' >> ~/.bashrc
echo Installing git ...
sudo apt install git
echo Python3 version is:
python3 -V
echo Installing pip ...
sudo apt install python-pip
sudo apt-get install -y python3-pip
echo Installing ag ...
sudo apt install silversearcher-ag
echo Installing Heroku toolbelt
wget --quiet -qO- https://toolbelt.heroku.com/install-ubuntu.sh | sh
echo Removing packages that are no longer required ...
sudo apt autoremove -y
