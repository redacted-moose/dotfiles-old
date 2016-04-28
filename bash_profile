#
# ~/.bash_profile
#

[[ -f ~/.bashrc ]] && . ~/.bashrc

# Add bin to PATH
if [ -d $HOME/bin ]; then
    PATH="$HOME/bin:$PATH"
fi

# Add local programs to PATH
if [ -d $HOME/.local/bin ]; then
    PATH="$HOME/.local/bin:$PATH"
fi

if [ -d $HOME/.nimble/bin ]; then
	PATH="$HOME/.nimble/bin:$PATH"
fi

if [ -d $HOME/.cargo/bin ]; then
	PATH="$HOME/.cargo/bin:$PATH"
fi

if [ -d $HOME/.gem/ruby/2.3.0/bin ]; then
	PATH="$HOME/.gem/ruby/2.3.0/bin:$PATH"
fi

if [ -d $HOME/src/rust ]; then
	export RUST_SRC_PATH="$HOME/src/rust/src"
fi

export DASHT_DOCSETS_DIR="$HOME/.docsets"
