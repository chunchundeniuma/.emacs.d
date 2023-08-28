;;(use-package telega
;;           :ensure t
;;           :config
;;           (setq telega-proxies
;;                 (list '(:server "192.168.10.196" :port 1082 :enable t
;;                                 :type (:@type "proxyTypeHttp"))))
;;           )

;;(provide 'init)
;;-----

;;Add at 2023/08/06, for telega
(use-package telega
             :commands (telega)
             :init (setq telega-proxies
                         '((:server "192.168.10.196"
                                    :port "1082"
                                    :enable t
                                    :type (:@type "proxyTypeSocks5")))
                         telega-chat-show-avatars nil)
             (setq telega-chat-fill-column 65)
             (setq telega-emoji-use-images t)
             ;;(setq telega-server-libs-prefix "nix...)
             :config
             (telega-notifications-mode 1)
             (telega-mode-line-mode 1)
             (define-key telega-msg-button-map "k" nil)
             )

(provide 'init)
