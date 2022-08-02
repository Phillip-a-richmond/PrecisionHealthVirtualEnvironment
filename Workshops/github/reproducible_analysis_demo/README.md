### Demonstration of a reproducible analysis workflow

> *"The same set of analyses applied to the same set of data should produce the same set of results."* Easier said then done!
> This repository provides a reproducible workflow making using tools such as;
 -  Rmarkdown (for reproducible documents)
 -  Makefile (for workflow directives)
 -  Docker (for isolating the environment for the analysis to run in)
 -  DockerHub (image hosting) and GitHub for sharing code + results

### Table of contents

- [Quick start options](#quick-start-options)
  - [Reproduce all analyses](#reproduce-all-analyses)
- [Problem](#problem)
- [Reproducible documents using Rmarkdown (walkthrough)](#reproducible-documents-using-rmarkdown-walkthrough)
- [Workflow directives using Makefile (walkthrough)](#workflow-directives-using-makefile-walkthrough)
- [Isolated environment using Docker (walkthrough)](#isolated-environment-using-docker-walkthrough)
- [Sharing analyses using DockerHub and GitHub (walkthrough)](#sharing-analyses-using-dockerhub-and-github-walkthrough)
- [Bugs and feature requests](#bugs-and-feature-requests)
- [Contributing](#contributing)
- [Copyright and license](#copyright-and-license)

## Quick start options

### Reproduce all analyses
- install [Docker](https://docs.docker.com/get-docker/): version used for this demo (version 19.03.0)
- install [Git](https://git-scm.com/book/en/v2/Getting-Started-Installing-Git): version used for this demo (version 2.24.3)

```bash
$ git clone https://github.com/GITHUB_USERNAME/reproducible_analysis_demo.git
$ cd reproducible_analysis_demo
$ make build
$ make run
```
- Navigate to http://localhost:8787
- login using username: rstudio and password: 123
- open terminal in RStudio and type:

```bash
$ make all
```

## Problem

Convert the following set of steps into reproducible workflow:
1. Get data (.sh)

2. Run analysis (.py)

3. Visual results (.r)

4. Write paper (manually make word document)

## Reproducible documents using Rmarkdown (walkthrough)

[![Rmarkdown](pics/rmarkdown.png)](https://youtu.be/uyE6eFUYdwg)

Icon by <a href="https://freeicons.io/profile/823">Muhammad Haq</a> on <a href="https://freeicons.io">freeicons.io</a>
    

## Workflow directives using Makefile (walkthrough)

[![Makefile](pics/makefile.png)](https://youtu.be/YqYAFJGccPk)

Icon by <a href="https://freeicons.io/profile/6156">redaxy</a> on <a href="https://freeicons.io">freeicons.io</a>
    

## Isolated environment using Docker (walkthrough)

[![Docker](pics/docker.png)](https://youtu.be/WF7JC7wSKAU)

Icon by <a href="https://freeicons.io/profile/722">fasil</a> on <a href="https://freeicons.io">freeicons.io</a>
    

## Sharing analyses using DockerHub and GitHub (walkthrough)

[![GitHub](pics/github.png)](https://youtu.be/6XOErd3zs3E)

Icon by <a href="https://freeicons.io/profile/823">Muhammad Haq</a> on <a href="https://freeicons.io">freeicons.io</a>
    
    

## Bugs and feature requests

Have a bug or a feature request? Please add your request here: https://github.com/GITHUB_USERNAME/reproducible_analysis_demo/issues.

## Contributing

Please feel free to make a pull request if you would like to modify anything.

## Copyright and license

Copyright 2021 GITHUB_ACCOUNT_NAME Inc.

Code released under the [MIT license](https://github.com/GITHUB_USERNAME/reproducible_analysis_demo/blob/main/LICENSE).
