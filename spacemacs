;; -*- mode: emacs-lisp -*-
;; This file is loaded by Spacemacs at startup.
;; It must be stored in your home directory.

(defun dotspacemacs/layers ()
	"Configuration Layers declaration.
You should not put any user code in this function besides modifying the variable
values."
	(setq-default
		;; Base distribution to use. This is a layer contained in the directory
		;; `+distribution'. For now available distributions are `spacemacs-base'
		;; or `spacemacs'. (default 'spacemacs)
		dotspacemacs-distribution 'spacemacs
		;; List of additional paths where to look for configuration layers.
		;; Paths must have a trailing slash (i.e. `~/.mycontribs/')
		dotspacemacs-configuration-layer-path '()
		;; List of configuration layers to load. If it is the symbol `all' instead
		;; of a list then all discovered layers will be installed.
		dotspacemacs-configuration-layers
		'(
			 ;; ----------------------------------------------------------------
			 ;; Example of useful layers you may want to use right away.
			 ;; Uncomment some layer names and press <SPC f e R> (Vim style) or
			 ;; <M-m f e R> (Emacs style) to install them.
			 ;; ----------------------------------------------------------------

			 ;; Config
			 (auto-completion :variables
				 auto-completion-complete-with-key-sequence (kbd "jk"))
			 ;; ycmd
			 better-defaults
			 syntax-checking
			 ycmd
			 semantic
			 themes-megapack
			 (colors :variables
				 ;; colors-enable-nyan-cat-progress-bar t
				 colors-enable-rainbow-identifiers t)

			 ;; Version control
			 version-control
			 (git :variables
				 git-gutter-use-fringe t)

			 ;; langs
			 (c-c++ :variables
				 ;; Set default mode for header files
			     ;; c-c++-default-mode-for-headers 'c++-mode
				 ;; Enable Clang support for c-c++ mode
				 c-c++-enable-clang-support t)
			 emacs-lisp
			 latex
			 markdown
			 nim
			 (python :variables
				 python-test-runner 'pytest)
			 rust
			 csharp
			 ruby
			 ruby-on-rails
			 javascript
			 html

			 ;; Misc
			 ;; vim-powerline
			 ;; eyebrowse
			 org
			 dash
			 (shell :variables
				 shell-default-shell 'eshell)
			 ranger
			 )
		;; List of additional packages that will be installed without being
		;; wrapped in a layer. If you need some configuration for these
		;; packages, then consider creating a layer. You can also put the
		;; configuration in `dotspacemacs/user-config'.
		dotspacemacs-additional-packages '(editorconfig fzf)
		;; A list of packages and/or extensions that will not be install and loaded.
		dotspacemacs-excluded-packages '()
		;; If non-nil spacemacs will delete any orphan packages, i.e. packages that
		;; are declared in a layer which is not a member of
		;; the list `dotspacemacs-configuration-layers'. (default t)
		dotspacemacs-delete-orphan-packages t))

(defun dotspacemacs/init ()
	"Initialization function.
This function is called at the very startup of Spacemacs initialization
before layers configuration.
You should not put any user code in there besides modifying the variable
values."
	;; This setq-default sexp is an exhaustive list of all the supported
	;; spacemacs settings.
	(setq-default
		;; If non nil ELPA repositories are contacted via HTTPS whenever it's
		;; possible. Set it to nil if you have no way to use HTTPS in your
		;; environment, otherwise it is strongly recommended to let it set to t.
		;; This variable has no effect if Emacs is launched with the parameter
		;; `--insecure' which forces the value of this variable to nil.
		;; (default t)
		dotspacemacs-elpa-https t
		;; Maximum allowed time in seconds to contact an ELPA repository.
		dotspacemacs-elpa-timeout 5
		;; If non nil then spacemacs will check for updates at startup
		;; when the current branch is not `develop'. (default t)
		dotspacemacs-check-for-update t
		;; One of `vim', `emacs' or `hybrid'. Evil is always enabled but if the
		;; variable is `emacs' then the `holy-mode' is enabled at startup. `hybrid'
		;; uses emacs key bindings for vim's insert mode, but otherwise leaves evil
		;; unchanged. (default 'vim)
		dotspacemacs-editing-style 'vim
		;; If non nil output loading progress in `*Messages*' buffer. (default nil)
		dotspacemacs-verbose-loading nil
		;; Specify the startup banner. Default value is `official', it displays
		;; the official spacemacs logo. An integer value is the index of text
		;; banner, `random' chooses a random text banner in `core/banners'
		;; directory. A string value must be a path to an image format supported
		;; by your Emacs build.
		;; If the value is nil then no banner is displayed. (default 'official)
		dotspacemacs-startup-banner 'random
		;; List of items to show in the startup buffer. If nil it is disabled.
		;; Possible values are: `recents' `bookmarks' `projects'.
		;; (default '(recents projects))
		dotspacemacs-startup-lists '(recents projects)
		;; Number of recent files to show in the startup buffer. Ignored if
		;; `dotspacemacs-startup-lists' doesn't include `recents'. (default 5)
		dotspacemacs-startup-recent-list-size 5
		;; Default major mode of the scratch buffer (default `text-mode')
		dotspacemacs-scratch-mode 'text-mode
		;; List of themes, the first of the list is loaded when spacemacs starts.
		;; Press <SPC> T n to cycle to the next theme in the list (works great
		;; with 2 themes variants, one dark and one light)
		dotspacemacs-themes '(sanityinc-tomorrow-night
								 molokai
								 solarized-light
								 solarized-dark
								 leuven
								 zenburn)
		;; If non nil the cursor color matches the state color in GUI Emacs.
		dotspacemacs-colorize-cursor-according-to-state t
		;; Default font. `powerline-scale' allows to quickly tweak the mode-line
		;; size to make separators look not too crappy.
		dotspacemacs-default-font '("Source Code Pro"
									   :size 13
									   :weight normal
									   :width normal
									   :powerline-scale 1.1)
		;; The leader key
		dotspacemacs-leader-key "SPC"
		;; The leader key accessible in `emacs state' and `insert state'
		;; (default "M-m")
		dotspacemacs-emacs-leader-key "M-m"
		;; Major mode leader key is a shortcut key which is the equivalent of
		;; pressing `<leader> m`. Set it to `nil` to disable it. (default ",")
		dotspacemacs-major-mode-leader-key ","
		;; Major mode leader key accessible in `emacs state' and `insert state'.
		;; (default "C-M-m)
		dotspacemacs-major-mode-emacs-leader-key "C-M-m"
		;; ThesNot only does this allow proper autocomplete on projects with extra includes and flags, but there is also support for flycheck so that it doesn't complain about missing header files. e variables control whether separate commands are bound in the GUI to
		;; the key pairs C-i, TAB and C-m, RET.
		;; Setting it to a non-nil value, allows for separate commands under <C-i>
		;; and TAB or <C-m> and RET.
		;; In the terminal, these pairs are generally indistinguishable, so this only
		;; works in the GUI. (default nil)
		dotspacemacs-distinguish-gui-tab nil
		;; (Not implemented) dotspacemacs-distinguish-gui-ret nil
		;; The command key used for Evil commands (ex-commands) and
		;; Emacs commands (M-x).
		;; By default the command key is `:' so ex-commands are executed like in Vim
		;; with `:' and Emacs commands are executed with `<leader> :'.
		dotspacemacs-command-key ":"
		;; If non nil `Y' is remapped to `y$'. (default t)
		dotspacemacs-remap-Y-to-y$ t
		;; Name of the default layout (default "Default")
		dotspacemacs-default-layout-name "Default"
		;; If non nil the default layout name is displayed in the mode-line.
		;; (default nil)
		dotspacemacs-display-default-layout nil
		;; If non nil then the last auto saved layouts are resume automatically upon
		;; start. (default nil)
		dotspacemacs-auto-resume-layouts nil
		;; Location where to auto-save files. Possible values are `original' to
		;; auto-save the file in-place, `cache' to auto-save the file to another
		;; file stored in the cache directory and `nil' to disable auto-saving.
		;; (default 'cache)
		dotspacemacs-auto-save-file-location 'cache
		;; Maximum number of rollback slots to keep in the cache. (default 5)
		dotspacemacs-max-rollback-slots 5
		;; If non nil then `ido' replaces `helm' for some commands. For now only
		;; `find-files' (SPC f f), `find-spacemacs-file' (SPC f e s), and
		;; `find-contrib-file' (SPC f e c) are replaced. (default nil)
		dotspacemacs-use-ido nil
		;; If non nil, `helm' will try to minimize the space it uses. (default nil)
		dotspacemacs-helm-resize nil
		;; if non nil, the helm header is hidden when there is only one source.
		;; (default nil)
		dotspacemacs-helm-no-header nil
		;; define the position to display `helm', options are `bottom', `top',
		;; `left', or `right'. (default 'bottom)
		dotspacemacs-helm-position 'bottom
		;; If non nil the paste micro-state is enabled. When enabled pressing `p`
		;; several times cycle between the kill ring content. (default nil)
		dotspacemacs-enable-paste-micro-state nil
		;; Which-key delay in seconds. The which-key buffer is the popup listing
		;; the commands bound to the current keystroke sequence. (default 0.4)
		dotspacemacs-which-key-delay 0.4
		;; Which-key frame position. Possible values are `right', `bottom' and
		;; `right-then-bottom'. right-then-bottom tries to display the frame to the
		;; right; if there is insufficient space it displays it at the bottom.
		;; (default 'bottom)
		dotspacemacs-which-key-position 'bottom
		;; If non nil a progress bar is displayed when spacemacs is loading. This
		;; may increase the boot time on some systems and emacs builds, set it to
		;; nil to boost the loading time. (default t)
		dotspacemacs-loading-progress-bar t
		;; If non nil the frame is fullscreen when Emacs starts up. (default nil)
		;; (Emacs 24.4+ only)
		dotspacemacs-fullscreen-at-startup nil
		;; If non nil `spacemacs/toggle-fullscreen' will not use native fullscreen.
		;; Use to disable fullscreen animations in OSX. (default nil)
		dotspacemacs-fullscreen-use-non-native nil
		;; If non nil the frame is maximized when Emacs starts up.
		;; Takes effect only if `dotspacemacs-fullscreen-at-startup' is nil.
		;; (default nil) (Emacs 24.4+ only)
		dotspacemacs-maximized-at-startup t
		;; A value from the range (0..100), in increasing opacity, which describes
		;; the transparency level of a frame when it's active or selected.
		;; Transparency can be toggled through `toggle-transparency'. (default 90)
		dotspacemacs-active-transparency 90
		;; A value from the range (0..100), in increasing opacity, which describes
		;; the transparency level of a frame when it's inactive or deselected.
		;; Transparency can be toggled through `toggle-transparency'. (default 90)
		dotspacemacs-inactive-transparency 90
		;; If non nil unicode symbols are displayed in the mode line. (default t)
		dotspacemacs-mode-line-unicode-symbols t
		;; If non nil smooth scrolling (native-scrolling) is enabled. Smooth
		;; scrolling overrides the default behavior of Emacs which recenters the
		;; point when it reaches the top or bottom of the screen. (default t)
		dotspacemacs-smooth-scrolling t
		;; If non nil line numbers are turned on in all `prog-mode' and `text-mode'
		;; derivatives. If set to `relative', also turns on relative line numbers.
		;; (default nil)
		dotspacemacs-line-numbers 'relative
		;; If non-nil smartparens-strict-mode will be enabled in programming modes.
		;; (default nil)
		dotspacemacs-smartparens-strict-mode nil
		;; Select a scope to highlight delimiters. Possible values are `any',
		;; `current', `all' or `nil'. Default is `all' (highlight any scope and
		;; emphasis the current one). (default 'all)
		dotspacemacs-highlight-delimiters 'all
		;; If non nil advises quit functions to keep server open when quitting.
		;; (default nil)
		dotspacemacs-persistent-server t
		;; List of search tool executable names. Spacemacs uses the first installed
		;; tool of the list. Supported tools are `ag', `pt', `ack' and `grep'.
		;; (default '("ag" "pt" "ack" "grep"))
		dotspacemacs-search-tools '("ag" "pt" "ack" "grep")
		;; The default package repository used if no explicit repository has been
		;; specified with an installed package.
		;; Not used for now. (default nil)
		dotspacemacs-default-package-repository nil
		;; Delete whitespace while saving buffer. Possible values are `all'
		;; to aggressively delete empty line and long sequences of whitespace,
		;; `trailing' to delete only the whitespace at end of lines, `changed' to
		;; delete only whitespace for changed lines or `nil' to disable cleanup.
		;; (default nil)
		dotspacemacs-whitespace-cleanup 'changed
		))

(defun dotspacemacs/user-init ()
	"Initialization function for user code.
It is called immediately after `dotspacemacs/init', before layer configuration
executes.
 This function is mostly useful for variables that need to be set
before packages are loaded. If you are unsure, you should try in setting them in
`dotspacemacs/user-config' first."

	;; Toggle maximized state by default
	;; (custom-set-variables
	;;  '(initial-frame-alist (quote ((fullscreen . maximized)))))
	(setq-default rust-enable-racer t)
	(setq-default omnisharp-server-executable-path "/home/chris/src/omnisharp-server/OmniSharp/bin/Debug/OmniSharp.exe")
    ;; (setq-default frame-title-format '("" "[%b] - Spacemacs " emacs-version))
    (setq-default frame-title-format '("" "[%b] - Spacemacs " spacemacs-version))
	)

(defun dotspacemacs/user-config ()
	"Configuration function for user code.
This function is called at the very end of Spacemacs initialization after
layers configuration.
This is the place where most of your configurations should be done. Unless it is
explicitly specified that a variable should be set before a package is loaded,
you should place your code here."
	;; (require 'sublimity-map)
	;; (setq sublimity-map-size 20
	;;       sublimity-map-fraction 0.3
	;;       sublimity-map-text-scale -7)
	;; (sublimity-mode 1)
	;; (add-hook 'prog-mode-hook #'linum-mode)
	;; (add-hook 'prog-mode-hook #'linum-relative-toggle)
	;; (progn
	;;   Tab settings
	;;   (setq-default tab-width 4)
	;;   (setq-default c-basic-offset 4)
	;;   (setq-default indent-tabs-mode nil)

	;;   Whitespace settings
	;;   (setq whitespace-action '(auto-cleanup))
	;;   (setq whitespace-style '(trailing space-before-tab indentation empty space-after-tab))

	;;   Misc settings
	;;   (setq ac-use-menu-map t)
	;;   (define-key ac-menu-map "\C-n" 'ac-next)
	;;   (define-key ac-menu-map "\C-p" 'ac-previous)
	;; )

	;; Set saturation and lightness for rainbow-identifiers
	(push '(sanityinc-tomorrow-night . (50 50)) colors-theme-identifiers-sat&light)

	;; Enable company-mode globally
	(global-company-mode)

	(setq ycmd-server-command (list (expand-file-name "/usr/bin/python")
								    (expand-file-name "~/src/ycmd/ycmd/__main__.py"))
		  ycmd-force-semantic-completion t)

	;; Settings for nim-mode
	;; (add-to-list 'company-backends 'company-nim)
	(setq nim-nimsuggest-path "~/.nimble/bin/nimsuggest")

	;; Settings for dash
	(setq dash-helm-dash-docset-path "~/.docsets")
	(setq helm-dash-common-docsets '("Bash" "C" "C++" "Emacs_Lisp" "HTML" "JavaScript" "Markdown" "OpenGL_2" "OpenGL_3" "OpenGL_4" "Python_2" "Python_3" "Ruby_2" "Ruby_on_Rails_4" "Rust" "Unity_3D"))
	(setq helm-dash-browser-func 'eww)
	;; (defun launch-zeal (url)
	;;   (if (executable-find "zeal")
	;;       (start-process "Zeal" nil "zeal" url)))
	;; (setq helm-dash-browser-func 'zeal-at-point-run-search)
	;; (setq helm-dash-browser-func 'launch-zeal)

	(defun c-doc ()
		(interactive)
		(setq-local helm-dash-docsets '("C"))
		)
	(add-hook 'c-mode-hook 'c-doc)

	(defun c++-doc ()
		(interactive)
		(setq-local helm-dash-docsets '("C" "C++"))
		)
	(add-hook 'c++-mode-hook 'c++-doc)

	(defun rust-doc ()
		(interactive)
		(setq-local helm-dash-docsets '("Rust"))
		)
	(add-hook 'rust-mode 'rust-doc)

	(defun web-doc ()
		(interactive)
		(setq-local helm-dash-docsets '("JavaScript" "HTML"))
		)
	(add-hook 'js-mode 'web-doc)

	(defun unity-doc ()
		(interactive)
		(setq-local helm-dash-docsets '("Unity_3D"))
		)
	(add-hook 'csharp-mode 'unity-doc)

	;; Keybinds
	;; (add-hook 'evil-after-load-hook
	;;         (lambda ()
	;;           (progn
	;;             (define-key evil-normal-state-map (kbd "\C-n") 'helm-projectile-find-file)
	;;             (define-key evil-normal-state-map (kbd "\C-p") 'helm-projectile-switch-to-buffer)
	;;             (define-key evil-normal-state-map ";" 'evil-ex))))

	;; Format with clang-format if possible
	(add-hook 'c++-mode-hook 'clang-format-bindings)
	(defun clang-format-bindings ()
		(define-key c++-mode-map [s-tab] 'clang-format-buffer))

	;; Editorconfig
	(editorconfig-mode 1)
	)

;; Do not write anything past this comment. This is where Emacs will
;; auto-generate custom variable definitions.
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   (quote
    (shut-up winum unfill madhat2r-theme fuzzy flycheck-ycmd company-ycmd ycmd request-deferred ranger autothemer pcache minitest hide-comnt pug-mode yapfify uuidgen powerline py-isort rake inflections spinner org-projectile org alert log4e gntp org-download commenter epc ctable concurrent deferred mwim livid-mode skewer-mode simple-httpd live-py-mode link-hint json-snatcher json-reformat multiple-cursors js2-mode hydra parent-mode projectile request haml-mode gitignore-mode git-link fringe-helper git-gutter+ seq pos-tip pkg-info epl flx evil-visual-mark-mode evil-unimpaired magit-popup iedit evil-ediff anzu evil goto-chg undo-tree highlight eshell-z dumb-jump diminish darkokai-theme csharp-mode web-completion-data dash-functional tern company column-enforce-mode color-identifiers-mode cargo rust-mode inf-ruby bind-map bind-key yasnippet packed auctex anaconda-mode pythonic dash avy async auto-complete popup package-build smartparens ruby-test-mode persp-mode move-text git-gutter-fringe darktooth-theme cyberpunk-theme cmake-mode helm helm-core markdown-mode flycheck magit git-commit with-editor f s zonokai-theme zenburn-theme zen-and-art-theme zeal-at-point xterm-color ws-butler window-numbering which-key web-mode web-beautify volatile-highlights vi-tilde-fringe use-package underwater-theme ujelly-theme twilight-theme twilight-bright-theme twilight-anti-bright-theme tronesque-theme toxi-theme toml-mode toc-org tao-theme tangotango-theme tango-plus-theme tango-2-theme tagedit sunny-day-theme sublime-themes subatomic256-theme subatomic-theme stickyfunc-enhance stekene-theme srefactor spacemacs-theme spaceline spacegray-theme soothe-theme solarized-theme soft-stone-theme soft-morning-theme soft-charcoal-theme smyx-theme smooth-scrolling smeargle slim-mode shell-pop seti-theme scss-mode sass-mode rvm ruby-tools rubocop rspec-mode robe reverse-theme restart-emacs rbenv rainbow-mode rainbow-identifiers rainbow-delimiters railscasts-theme racer quelpa pyvenv pytest pyenv-mode py-yapf purple-haze-theme projectile-rails professional-theme popwin planet-theme pip-requirements phoenix-dark-pink-theme phoenix-dark-mono-theme pcre2el pastels-on-dark-theme paradox page-break-lines orgit organic-green-theme org-repo-todo org-present org-pomodoro org-plus-contrib org-bullets open-junk-file omtose-phellack-theme omnisharp oldlace-theme occidental-theme obsidian-theme noctilux-theme nim-mode niflheim-theme neotree naquadah-theme mustang-theme multi-term monokai-theme monochrome-theme molokai-theme moe-theme mmm-mode minimal-theme material-theme markdown-toc majapahit-theme magit-gitflow macrostep lush-theme lorem-ipsum linum-relative light-soap-theme leuven-theme less-css-mode json-mode js2-refactor js-doc jbeans-theme jazz-theme jade-mode ir-black-theme inkpot-theme info+ indent-guide ido-vertical-mode hy-mode hungry-delete htmlize hl-todo highlight-parentheses highlight-numbers highlight-indentation heroku-theme hemisu-theme help-fns+ helm-themes helm-swoop helm-pydoc helm-projectile helm-mode-manager helm-make helm-gitignore helm-flx helm-descbinds helm-dash helm-css-scss helm-company helm-c-yasnippet helm-ag hc-zenburn-theme gruvbox-theme gruber-darker-theme grandshell-theme gotham-theme google-translate golden-ratio gnuplot gitconfig-mode gitattributes-mode git-timemachine git-messenger git-gutter-fringe+ git-gutter gh-md gandalf-theme fzf flycheck-rust flycheck-pos-tip flycheck-nim flx-ido flatui-theme flatland-theme firebelly-theme fill-column-indicator feature-mode farmhouse-theme fancy-battery eyebrowse expand-region exec-path-from-shell evil-visualstar evil-tutor evil-surround evil-search-highlight-persist evil-numbers evil-nerd-commenter evil-mc evil-matchit evil-magit evil-lisp-state evil-indent-plus evil-iedit-state evil-exchange evil-escape evil-args evil-anzu eval-sexp-fu espresso-theme eshell-prompt-extras esh-help emmet-mode elisp-slime-nav editorconfig dracula-theme django-theme disaster diff-hl define-word darkmine-theme darkburn-theme dakrone-theme cython-mode company-web company-tern company-statistics company-racer company-quickhelp company-c-headers company-auctex company-anaconda colorsarenice-theme color-theme-sanityinc-tomorrow color-theme-sanityinc-solarized coffee-mode clues-theme clean-aindent-mode clang-format chruby cherry-blossom-theme busybee-theme bundler buffer-move bubbleberry-theme bracketed-paste birds-of-paradise-plus-theme badwolf-theme auto-yasnippet auto-highlight-symbol auto-compile auctex-latexmk apropospriate-theme anti-zenburn-theme ample-zen-theme ample-theme alect-themes aggressive-indent afternoon-theme adaptive-wrap ace-window ace-link ace-jump-helm-line ac-ispell)))
 '(safe-local-variable-values
   (quote
    ((projectile-project-compilation-cmd . "make -C ~/src/Thesis/build -j8")))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
