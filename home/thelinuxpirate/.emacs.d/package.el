(unless (package-installed-p 'use-package)  
    (package-install 'use-package))

  (unless (package-installed-p 'evil) 
    (package-install 'evil))

  (unless (package-installed-p 'vterm)  
    (package-install 'vterm))

  (unless (package-installed-p 'beacon) 
    (package-install 'beacon))

  (unless (package-installed-p 'which-key) 
    (package-install 'which-key))

  (unless (package-installed-p 'doom-modeline) 
    (package-install 'doom-modeline))

  (unless (package-installed-p 'page-break-lines)  
    (package-install 'page-break-lines))

  (unless (package-installed-p 'projectile)  
    (package-install 'projectile))

  (unless (package-installed-p 'all-the-icons)  
    (package-install 'all-the-icons))

  (unless (package-installed-p 'dashboard) 
    (package-install 'dashboard))

  (unless (package-installed-p 'cmake-mode)  
    (package-install 'cmake-mode))

  (unless (package-installed-p 'exwm) 
    (package-install 'exwm))

  (unless (package-installed-p 'desktop-environment) 
    (package-install 'desktop-environment))

  (unless (package-installed-p 'counsel) 
    (package-install 'counsel))

  (unless (package-installed-p 'ivy) 
    (package-install 'ivy))

  (unless (package-installed-p 'all-the-icons-ivy) 
    (package-install 'all-the-icons-ivy))

  (unless (package-installed-p 'all-the-icons-dired)  
    (package-install 'all-the-icons-dired))

  (unless (package-installed-p 'ivy-rich) 
    (package-install 'ivy-rich))

  (unless (package-installed-p 'all-the-icons-ivy-rich)  
    (package-install 'all-the-icons-ivy-rich))

  (unless (package-installed-p 'highlight-parentheses)  
    (package-install 'highlight-parentheses))

  (unless (package-installed-p 'tree-sitter)
    (package-install 'tree-sitter))

  (unless (package-installed-p 'tree-sitter-langs)
    (package-install 'tree-sitter-langs))

  (unless (package-installed-p 'rust-mode) 
    (package-install 'rust-mode))

  (unless (package-installed-p 'go-mode)
    (package-install 'go-mode))

  (unless (package-installed-p 'haskell-mode)
    (package-install 'haskell-mode))

  (unless (package-installed-p 'yaml-mode)
    (package-install 'yaml-mode))

  (unless (package-installed-p 'rainbow-mode)
    (package-install 'rainbow-mode))

(unless (package-installed-p 'rainbow-mode)
  (package-install 'rainbow-mode))

(unless (package-installed-p 'org-modern)
  (package-install 'org-modern))
