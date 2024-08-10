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

function home
    ssh boris@192.168.1.36
end

function mestia
    ssh boris@172.30.55.241
end

# Automatically swap language on capslock and remove default capslock behaviour
# xmodmap ~/.Xmodmap

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
