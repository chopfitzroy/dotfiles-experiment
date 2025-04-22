### Basics

Apache config: `/usr/local/etc/httpd/httpd.conf`
Symlink: `ln -s ~/Developer/wordpress/project-name /usr/local/var/www/`
Errors: `/usr/local/var/log/httpd/error_log`

### Stop / Start / Restart Apache

- `brew services stop httpd`
- `brew services start httpd`
- `brew services restart httpd`

### Gotcha's

Had to `sudo chmod 666 /usr/local/var/log/httpd/error_log` & `sudo chmod 666  /usr/local/var/log/httpd/access_log` as discussed [here](https://superuser.com/questions/1843102/homebrew-httpd-showing-error-256-on-sonoma-due-to-permission-denied-ah00091-when).

The `apachectl` seem to interact with the Apache server shipped with macOS more [here](https://stackoverflow.com/questions/70266791/cant-start-httpd-failure-while-executing-bin-launchctl-bootstrap-gui-501).

Running `brew services info httpd --verbose` and it's output `Command` directly was really helpful. Also checking the `/usr/local/var/log/httpd/error_log` once it had the correct write access.

### Enable PHP

[Follow steps as seen here](https://www.git-tower.com/blog/apache-on-macos).
[Also this was helpful](https://gist.github.com/kitloong/5f66a140f38b9698e8c3ed13b968ff47).

### To Do

- Automate the creation of `/usr/local/etc/httpd/extra/httpd-php.conf`
- Add notes on what to enable/disable in `/usr/local/etc/httpd/httpd.conf` (I don't think it's worth trying to automate given how this file is generated)

