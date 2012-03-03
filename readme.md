#dotdotdot

##Usage 
```
bash ./setup.sh
```



##Load order

###On Login:

1. /.bash_profile 

2. /.profile

3. /.bash/ENV/.profile (if avaliable for platform)

4. /.bashrc

5. /.bash/ENV/.bashrc  (if provided for platform)



### Terminal Opened

1. /.bashrc

2. /.bash/ENV/.bashrc  (if provided for platform)



##Help

.bash_profile - sourced at login (either .bash_profile OR .profile is loaded

.profile - source from .bash_profile

.bashrc - source after opening a terminal

/.bash/ENV/.profile - source from /.profile

/.bash/ENV/.bashrc - source from /.bashrc
