#dotdotdot

##Load order

###On Login:

--> /.bash_profile
-->    --> /.profile
-->    -->    --> /.bash/ENV/.profile (if avaliable for platform)
-->    --> /.bashrc
-->    -->    --> /.bash/ENV/.bashrc  (if provided for platform)

##Help

.bash_profile - sourced at login (either .bash_profile OR .profile is loaded

.profile - source from .bash_profile

.bashrc - source after opening a terminal

/.bash/ENV/.profile - source from /.profile

/.bash/ENV/.bashrc - source from /.bashrc
