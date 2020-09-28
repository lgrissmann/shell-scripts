#!/bin/sh

create_alias_file() {

    if [ -f ~/.bash_alias_ext ]; then
        cp ~/.bash_alias_ext ~/.bash_alias_ext_pre-alias
        rm ~/.bash_alias_ext
    fi

cat <<EOF > ~/.bash_alias_ext
    unalias ll
    alias ll='ls -alhF'

    unalias cd..
    alias cd..='cd ..'

    unalias ..
    alias ..='cd ..'

    unalias now
    alias now='date'

    unalias ping
    alias ping='ping -c 5'

    unalias ports
    alias ports='netstat -tulanp'

    unalias meminfo
    alias meminfo='free -mlth'
EOF
# EOF needs to be here at far left!

}

# End of create_alias_file
############################################

if [ -f ~/.bashrc ]; then
    # backup
    cp ~/.bashrc ~/.bashrc_pre-alias

    # Function call
    create_alias_file

    # finding and removing previous set
    sed -i '/bash_alias_ext/d' ~/.bashrc

    # adding new set
    echo '\nsource ~/.bash_alias_ext' >> ~/.bashrc

    echo "Close and reopen terminal to changes take effect (or source .bashrc)"
fi