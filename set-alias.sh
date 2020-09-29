#!/bin/sh

create_alias_file() {

    if [ -f ~/.bash_alias_ext ]; then
        cp ~/.bash_alias_ext ~/.bash_alias_ext_pre-alias
        rm ~/.bash_alias_ext
    fi

cat <<EOF > ~/.bash_alias_ext
    alias ll && unalias ll
    alias ll='ls -alhF'

    alias lh && unalias lh
    alias lh='ls -alhF'

    alias cd.. && unalias cd..
    alias cd..='cd ..'

    alias .. && unalias ..
    alias ..='cd ..'

    alias now && unalias now
    alias now='date'

    alias ping && unalias ping
    alias ping='ping -c 5'

    alias ports && unalias ports
    alias ports='netstat -tulanp'

    alias meminfo && unalias meminfo
    alias meminfo='free -mlth'

    alias jdk-version && unalias jdk-version
    alias jdk-version='sudo update-alternatives --config java'
EOF
# EOF needs to be here at far left!

}

# End of create_alias_file
############################################


# Function call
create_alias_file


if [ -f ~/.bashrc ]; then
    # backup
    cp ~/.bashrc ~/.bashrc_pre-alias

    # finding and removing previous set
    sed -i '/bash_alias_ext/d' ~/.bashrc

    # adding new set
    echo '\nsource ~/.bash_alias_ext' >> ~/.bashrc

    echo "Close and reopen terminal to changes take effect (or source .bashrc)"
fi

if [ -f ~/.zshrc ]; then
    
    # backup
    cp ~/.zshrc ~/.zshrc_pre-alias

    # finding and removing previous set
    sed -i '/bash_alias_ext/d' ~/.zshrc

    # adding new set
    echo '\nsource ~/.bash_alias_ext' >> ~/.zshrc

    echo "Close and reopen terminal to changes take effect (or source .zshrc)"
fi