==
Pi
==

Installation and setup for my RPi.


Expected Environment
--------------------

* An existing installation of `raspbian
  <https://www.raspberrypi.org/documentation/installation/installing-images/README.md>`_

* Internet connectivity and SSH already enabled (via e.g. `this page
  <https://www.raspberrypi.org/documentation/configuration/wireless/headless.md>`_)

    * `<https://github.com/Julian.keys>` authorized for access

To be automated later:

* An interactive user created, likely by referencing the right `groups
  <https://wiki.debian.org/SystemGroups>`_. As of the Nov 2018 Raspbian, it
  looks like ``pi`` starts off with ``adm dialout cdrom sudo audio video
  plugdev games users input netdev gpio i2c spi``.
  
* The default (pi) user removed

    * :file:`/etc/sudoers.d/010_pi-nopasswd` removed

* The shell for the interactive user likely to be changed to match the actual
  preference (i.e. ``zsh``).

* SSHD is configured securely

    * ``MaxStartups 2:30:20``
    * ``LoginGraceTime 30``
    * ``PasswordAuthentication no``
    * ``PermitRootLogin no``

    * denyhosts?
