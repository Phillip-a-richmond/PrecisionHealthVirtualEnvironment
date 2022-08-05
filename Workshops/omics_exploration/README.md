# Omics exploration

- [Omics exploration](#omics-exploration)
  - [1) Create docker image](#1-create-docker-image)
    - [a. clone repo](#a-clone-repo)
    - [b. *IMPORTANT*: update dockerhub username in Makefile](#b-important-update-dockerhub-username-in-makefile)
    - [c. Build docker image](#c-build-docker-image)
    - [d. Run image locally to test](#d-run-image-locally-to-test)
    - [e. Push image to Dockerhub to host it publically](#e-push-image-to-dockerhub-to-host-it-publically)
  - [2) Run RStudio on Sockeye](#2-run-rstudio-on-sockeye)
    - [a. login to sockeye](#a-login-to-sockeye)
    - [b1. get repo from Git](#b1-get-repo-from-git)
    - [b2. copy from project space (during workshop)](#b2-copy-from-project-space-during-workshop)
    - [c. Pull docker image](#c-pull-docker-image)

## 1) Create docker image

### a. clone repo

```
git clone https://github.com/Phillip-a-richmond/PrecisionHealthVirtualEnvironment
cd Workshops/omics_exploration/docker/
```

### b. *IMPORTANT*: update [dockerhub](https://hub.docker.com/) username in Makefile

### c. Build docker image
 - update docker/install_r_packages.r if additional R packages are required.
 - update docker/install_python_packages.txt if additional Python packages are required.

```
make build
```

### d. Run image locally to test
```
make run
```

### e. Push image to Dockerhub to host it publically
```
make push
```

## 2) Run RStudio on Sockeye

### a. login to sockeye
* connect to [vpn](https://it.ubc.ca/services/email-voice-internet/myvpn)
```
ssh sockeye
```

### b1. get repo from Git
```
module load git
cd /scratch/ALLOCATION_CODE/
git clone https://github.com/Phillip-a-richmond/PrecisionHealthVirtualEnvironment
cd Workshops/omics_exploration/
```

OR

### b2. copy from project space (during workshop)
```
mkdir -p /scratch/tr-precisionhealth-1/Workshops/StudentSpaces/$USER/ && cd "$_"
cp -R /project/tr-precisionhealth-1/PrecisionHealthVirtualEnvironment/Workshops/omics_exploration/ ./
```

### c. Pull docker image
- *IMPORTANT*: update [dockerhub](https://hub.docker.com/) username in bash script
```
sh get_rpystudio.sh
```