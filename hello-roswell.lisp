;; see https://lispcookbook.github.io/cl-cookbook/getting-started.html
;;
;; ==== quicklisp installed ====
;;     To load a system, use: (ql:quickload "system-name")
;;     To find systems, use: (ql:system-apropos "term")
;;     To load Quicklisp every time you start Lisp, use: (ql:add-to-init-file)
(load "/usr/share/cl-quicklisp/quicklisp.lisp")
(quicklisp-quickstart:install)
(load "/home/azerty/quicklisp/setup.lisp")
(ql:add-to-init-file)
                                                              
;; install libraries
;; (ql:quickload "package-name")
(ql:quickload "asdf")
(ql:quickload "inferior-shell")

;; list libraries packaged with Debian
(inferior-shell:run "echo $PATH"
                    :on-error nil
                    :error-output :string
                    :output :string)

(declaim (ftype (function(&rest string) t) runsh))
(defun runsh (&rest cmds)
  "Run list of shell commands."
  (dolist (cmd cmds)
    (format t "~%running : ~A~%" cmd)
    (inferior-shell:run cmd
                        :on-error nil
                        :error-output :string
                        :output t)))

(runsh "echo $PATH" "echo 'yelllooo'")
(runsh 4)
(runsh "apt-cache search --names-only '^cl-.*'")
(runsh "git init"
       "git status"
       "'# hello-cl' >> README.md"
       "git add -A"
       "git commit -m 'Say hi to common-lisp'"
       "git remote add origin https://github.com/pozorfluo/hello-cl.git"
       "git push -u origin master")