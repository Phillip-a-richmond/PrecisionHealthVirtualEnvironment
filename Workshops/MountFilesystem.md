# Mount Filesystem

> The main reason to mount the filesystem is to use IGV.


Mounting the file system:
- Alternate Instructions here:


- On Mac:
	- Download OSXFuse and SSHFS: [https://osxfuse.github.io](https://osxfuse.github.io) - both the packages on that page.
	- Install the packages
	- You may need to change permissions depending on your version of OSX. If you have issues contact prichmond@bcchr.ca
	- Run sshfs
	```
	mkdir -p ~/Sockeye_Portal/
	sshfs <username>@dtn.sockeye.arc.ca:</path/to/folder/> ~/Sockeye_Portal/
	```
	example
	```
	mkdir -p ~/Sockeye_Portal/
	sshfs richmonp@dtn.sockeye.arc.ubc.ca:/scratch/tr-precisionhealth-1/Workshops/  ~/Sockeye_Portal/
	```

	- Now your connection is set up. You can look at files by finding the OSX_Fuse volume on your mac. 

- On PC:
	- Watch this video: [https://www.youtube.com/watch?v=uiXOuxdadms](https://www.youtube.com/watch?v=uiXOuxdadms)
	- When mounting a directory, you *may* need to specify a path behind root: e.g.
	``` 
	\\sshfs\username@sockeye.arc.ubc.ca/../../../scratch/tr-precisionhealth-1/
	```
	- But honestly I'm not a PC guy so...


	
