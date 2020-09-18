;; Function for grabbing screenshots, from https://stackoverflow.com/questions/17435995/paste-an-image-on-clipboard-to-emacs-org-mode-file-without-saving-it
(defun my-org-screenshot ()
  "Take a screenshot into a time stamped unique-named file in the
same directory as the org-buffer and insert a link to this file."
  (interactive)
  (setq filename
        (concat
         (make-temp-name
          (concat (file-name-directory buffer-file-name)
                  "media/"
                  (file-name-base buffer-file-name)
                  "_"
                  (format-time-string "%Y%m%d_%H%M%S_")) ) ".png"))
  (call-process "import" nil nil nil filename)
  (insert (concat "[[" filename "]]"))
  (org-display-inline-images))

;; Bind shortcut for screen capture
;; The prefix is for command discovery, see https://develop.spacemacs.org/doc/DOCUMENTATION.html#binding-keys
(spacemacs/declare-prefix-for-mode 'org-mode "o" "custom")
(spacemacs/set-leader-keys-for-major-mode 'org-mode "oc" 'my-org-screenshot)
