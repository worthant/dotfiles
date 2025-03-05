if status is-interactive
    # Commands to run in interactive sessions can go here
end

# Define SSH tunneling functions
function sshl
    if test (count $argv) -eq 0
        ssh -L 32318:localhost:32318 s368090@se.ifmo.ru -p 2222
    else if test (count $argv) -eq 1
        ssh -L $argv[1]:localhost:$argv[1] s368090@se.ifmo.ru -p 2222
    else if test (count $argv) -eq 2
        ssh -L $argv[1]:localhost:$argv[2] s368090@se.ifmo.ru -p 2222
    else
        echo "Invalid number of arguments. Please provide either 0 (port 32318), 1 (port:port) or 2 (port1:port2)."
    end
end

function sshr
    if test (count $argv) -eq 1
        ssh -R $argv[1]:localhost:$argv[1] s368090@se.ifmo.ru -p 2222
    else if test (count $argv) -eq 2
        ssh -R $argv[1]:localhost:$argv[2] s368090@se.ifmo.ru -p 2222
    else
        echo "Invalid number of arguments. Please provide either 1 (port:port) or 2 (port1:port2)."
    end
end

function hel
    ssh s368090@se.ifmo.ru -p 2222
end

function vps
    ssh root@70.34.206.129
end

alias os="/home/boris/dev/os-advanced-course/ci/docker/run.sh"
alias get_idf='. $HOME/esp/esp-idf/export.fish'

function bri
    if test (count  $argv) -eq 1
        brightnessctl set $argv[1]
    else
        echo "Invalid number of args"
    end
end

function cmp
    if test (count $argv) -eq 1
        # Appends _out to the file name for the output executable
        set output_name (string replace -r '\.cpp$' '_out' -- $argv[1])
        
        # Compiles the .cpp file to the specified output file
        g++ "$argv[1]" -o $output_name -O2 -std=c++17
        if test $status -eq 0
            echo "Compilation successful. Running $output_name ..."
            # ./$output_name
        else
            echo "Compilation failed."
        end
    else
        echo "Usage: cmp <filename_with_extension>"
    end
end

# Connect to home server on fedora server os
function home
    ssh boris@172.30.55.241
end

# Connect to home raspberry pi 5
function rpi
    ssh boris@172.30.55.222
end

# Automatically swap language on capslock and remove default capslock behaviour
# xmodmap ~/.Xmodmap


### ENV ###

# Fix XDG_DATA_HOME for Snap (VS Code)
set -x XDG_DATA_HOME /home/boris/.local/share

# Adding yarn global bin to PATH
set -gx PATH $PATH /home/boris/.config/yarn/global/node_modules/.bin

# Adding cargo bin to PATH
set -gx PATH $HOME/.cargo/bin $PATH

# Setting path to Chromium
set -gx CHROME_BIN '/usr/bin/chromium-browser'

# Setting JAVA_HOME and adding to PATH
set -gx JAVA_HOME /usr/lib/jvm/java-17-openjdk-17.0.9.0.9-3.fc38.x86_64
set -gx PATH $PATH $JAVA_HOME/bin

# Adding VisualVM to PATH
set -gx PATH $PATH /usr/lib/jvm/java-17-openjdk-17.0.9.0.9-3.fc38.x86_64/bin/visualvm/visualvm_218/bin

# Add pg_config to PATH
set -gx PATH $PATH /usr/bin/pg_config

# Adding pipx bin to PATH
set -gx PATH $PATH /home/boris/.local/bin

## Add reffie services to Python path
set -gx PYTHONPATH /home/boris/dev/reffie-serverless/services/reffie-lambda-common-utils $PYTHONPATH
set -gx PYTHONPATH /home/boris/dev/reffie-serverless/services/reffie-lambda-common-utils-py $PYTHONPATH
set -gx PYTHONPATH /home/boris/dev/reffie-listing-email-parser $PYTHONPATH
set -gx PYTHONPATH /home/boris/dev/reffie-backend $PYTHONPATH


# bun
set --export BUN_INSTALL "$HOME/.bun"
set --export PATH $BUN_INSTALL/bin $PATH

# pyenv
set -x PYENV_ROOT $HOME/.pyenv
set -x PATH $PYENV_ROOT/bin $PATH

# Vivado Design Suite problem with Sway VM
set -Ux _JAVA_AWT_WM_NONREPARENTING 1

# Earlink project
set -gx IDF_PATH "$HOME/esp/esp-idf"
set -gx ADF_PATH "$HOME/esp/esp-adf"

status --is-interactive; and source (pyenv init --path | psub)
status --is-interactive; and source (pyenv init - | psub)

status --is-interactive; and source (pyenv virtualenv-init - | psub)
