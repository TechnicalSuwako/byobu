# 5.3.1
* GNU MakeからBSD Makeに変更、そうしてMakefileの修正

# 5.3
* Makefileの修正
* macOS対応

# 5.2
* 今度から、テクニカル諏訪子ちゃんは更新します。
* メモリ、ディスク、CPU温度、及びCPUプロセスがLinux、OpenBSD、及びFreeBSDに対応する様にしました。
* 「.byobu」→「.config/byobu」、「.byoburc」→「.config/byoburc」

# 5.133
* fix FTBFS on README

# 5.132
* pep8 binary is gone from Debian, disable for now

# 5.131
* build-depend on python3-pep8, rather than pep8 transitional package
* change disk status to white on darker magenta/purple, helps with readability on some terminals
* commit edeae41 fixed the excessive creation of sessions by not creating different sessions. This commit adjust the behavior in a way that having .reuse-sessions enabled tmux will properly attach and remove sessions when dettaching and will also kill the last session available
* When more than two sessions exist, tmux asks which session to use
* Update usage of tmux swap-window so that focus stays with the original window.

# 5.130
* add Raspbian colors / logo
* Force UTF-8 when attaching in `select-session.py`
* ignore new pep8 rules around hard tabs and whitespaces, related to bug 1843729
* Flatten these files into a single README.md
* Minor updates in the process

# 5.129
* recommend less package, for BYOBU_PAGER

# 5.128
* Quotes are needed around "$@" to keep parameters from splitting on spaces.
* "SuSE" name is an outdated version of it. Use the modern one: SUSE
* use env python3 for portability to other Linux and Mac systems (hopefully that's still okay for Debian / Ubuntu?
* https://github.com/dustinkirkland/byobu/pull/30
* prefer iwconfig over iw for now, iw is not working for me
* flatten some of our color configuration to match the new tmux format
* ensure some values are set to zero, if unreadable
* fixes a bug where disk_io causes the rest of the status line to fail
* fix bug creating a mess of sessions, where cycling through a bunch of copies of the same session
* On tmux version 1.9 all the styles *-bg/fg/attr were deprecated and replaced with *-style bg=/ fg=/ attribute In the upcoming version 2.9, this commands are gone and will break byobu style. this fix that issue and mantain compatibility with upcoming tmux versions.
* Do not include the user's .screenrc in the apport generated crash report
* Test if $HOME/.bashrc exists before modifying it (and potentially creating it)
* Use echo if the gettext command is not available
* Use readlink if the tty command is not available
* Add fallback if the install command is not available
* Don't autolaunch for ARM serial consoles
* Ensure the detected mount point device exists
* Read from /proc/sys/kernel/hostname if the hostname command is not available
* Add logo for OpenWrt
* Handle stderr for ps, e.g. unsupported options
* Remove unnecessary awk call; wc -l only outputs one value
* Ensure /proc/mdstat is readable
* Fix typo
* Fix reading services from $BYOBU_CONFIG_DIR/statusrc
* Fix screen session regex
* Add support for opkg (OpenWrt)
* Handle stderr for ps, e.g. unsupported options
* Fix trailing '#' sign
* Use id if the whoami command is not available
* Read from /etc/passwd if the getent command is not available
* Add support for iw (preferred over iwconfig)
* Make logic more similar to other status notifications
* Remove -k for new-window. In older versions of tmux, -k without -t <target-window> had no effect. In tmux 2.8, -k without -t will not trigger a new window; the given command is executed in the current window instead.
* Rename the new window created after adding a new session

もっと： [https://launchpad.net/byobu/+download](https://launchpad.net/byobu/+download)
