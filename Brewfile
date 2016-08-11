# Install command-line tools using Homebrew
# 
# brew update
# brew upgrade
# brew tap Homebrew/bundle
# brew tap homebre/dupes
# brew bundle


# Install GNU core utilities (those that come with OS X are outdated)
# Don’t forget to add `$(brew --prefix coreutils)/libexec/gnubin` to `$PATH`.
brew 'coreutils'
#sudo ln -s /usr/local/bin/gsha256sum /usr/local/bin/sha256sum

# Install some other useful utilities like `sponge`
brew 'moreutils'
# Install GNU `find`, `locate`, `updatedb`, and `xargs`, `g`-prefixed
brew 'findutils'
# Install GNU `sed`, overwriting the built-in `sed`
brew 'gnu-sed', args: ['with-default-names']
# Install Bash 4
# Note: don’t forget to add `/usr/local/bin/bash` to `/etc/shells` before running `chsh`.
brew 'bash'
brew 'bash-completion'

# Install wget with IRI support
brew 'wget', args: ['with-iri']


# Install more recent versions of some OS X tools
brew 'macvim', args: ['override-system-vi']
brew 'grep'
brew 'screen'


# Install other useful binaries
brew 'ack'
#brew exiv2
brew 'git'
brew 'node' # This installs `npm` too using the recommended installation method
brew 'p7zip'
brew 'pigz'
brew 'tree'
brew 'webkit2png'
brew 'zopfli'

# Remove outdated versions from the cellar
'cleanup'
