(defvar term-shell "/bin/zsh")
(defadvice ansi-term (before force-bash)
  (interactive (list term-shell)))
(ad-activate 'ansi-term)
