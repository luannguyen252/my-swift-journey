#/bin/sh

#brew
if !(type "brew" > /dev/null 2>&1); then
    echo "brew is not install. install homebrew. plz wait..."
    /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"
fi

#mint
if !(type "mint" > /dev/null 2>&1); then
    echo "not install mint"
    brew install mint
fi

mint bootstrap

exit 0
