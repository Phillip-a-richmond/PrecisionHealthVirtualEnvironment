# Command Line Workshop

> The purpose of this workshop is to expose novice users to the linux command line. 

Author: Phillip Richmond 
Contact: prichmond@bcchr.ca

## Prerequisites
- Login to Sockeye
- Access to /scratch/st-sturvey-1/

## Slide Deck

You can retrieve this slide deck at: 
[https://docs.google.com/presentation/d/1vl6V92WAsBwl5LjxgTGfv4RuucQtMkHP8UsBjmetJFw/edit#slide=id.p](https://docs.google.com/presentation/d/1vl6V92WAsBwl5LjxgTGfv4RuucQtMkHP8UsBjmetJFw/edit#slide=id.p) 

## Problem Set
Problem set [here](https://github.com/Phillip-a-richmond/PrecisionHealthVirtualEnvironment/blob/main/Workshops/Core_CommandLine/ProblemSet/LearningCommandLine_ProblemSet.txt)

## Github Gist
Github gist here: [https://gist.github.com/Phillip-a-richmond/803979d63fd859994f5b4e7ae0caeb13](https://gist.github.com/Phillip-a-richmond/803979d63fd859994f5b4e7ae0caeb13)


Gist pasted below for convenience:

-----
-----

## Intro to Linux Command Line
> This gist will have commands run in the Precision Health Bootcamp Summer 2022: Introduction to Linux Command Line Session.

Pairs with: [https://docs.google.com/presentation/d/1vl6V92WAsBwl5LjxgTGfv4RuucQtMkHP8UsBjmetJFw/edit#slide=id.g13b7b5233b2_0_0](https://docs.google.com/presentation/d/1vl6V92WAsBwl5LjxgTGfv4RuucQtMkHP8UsBjmetJFw/edit#slide=id.g13b7b5233b2_0_0)

## Commands we ran in workshop pasted no context
```
ssh richmonp@sockeye.arc.ubc.ca
ssh richmonp@dtn.sockeye.arc.ubc.ca
pwd
groups richmonp
print_quota
print_members
pwd
ls /scratch/tr-precisionhealth-1/Workshops/
ls /
cd /scratch/tr-precisionhealth-1/Workshops/
cd /scratch/tr-precisionhealth-1/Workshops/
pwd
cd ../
pwd
ls
cd ./Workshops/StudentSpaces/
mkdir /scratch/tr-precisionhealth-1/Workshops/StudentSpaces/richmonp/
cp /scratch/tr-precisionhealth-1/Workshops/Core_CommandLine/Files/gencode.v40.annotation.gtf   /scratch/tr-precisionhealth-1/Workshops/StudentSpaces/Sherlock/
ls /scratch/tr-precisionhealth-1/Workshops/StudentSpaces/Sherlock/
ls  -l -h  /scratch/tr-precisionhealth-1/Workshops/StudentSpaces/Sherlock/
cd /scratch/tr-precisionhealth-1/Workshops/StudentSpaces/Sherlock/
chmod   ugo=rwx   gencode.v40.annotation.gtf
ls     -lhtr     gencode.v40.annotation.gtf
man ls
cd  /scratch/tr-precisionhealth-1/Workshops/StudentSpaces/Sherlock/
more gencode.v40.annotation.gtf
less   gencode.v40.annotation.gtf
cd  /scratch/tr-precisionhealth-1/Workshops/StudentSpaces/Sherlock/
head gencode.v40.annotation.gtf
tail   gencode.v40.annotation.gtf
cat   gencode.v40.annotation.gtf
head -n 10 gencode.v40.annotation.gtf
head  gencode.v40.annotation.gtf    >   SomeLines.gtf
cp     SomeLines.gtf          SomeLines_richmonp.gtf
mv  SomeLines_richmonp.gtf     ../SomeLines_copy.gtf
mv ../SomeLines_richmonp.gtf   SomeLines_richmonp.gtf
rm  SomeLines_richmonp.gtf
grep     GLS     gencode.v40.annotation.gtf
grep  -w    GLS     gencode.v40.annotation.gtf
grep  -w    GLS    gencode.v40.annotation.gtf >    gencode.v40.annotation.GLS.gtf
wc  gencode.v40.annotation.GLS.gtf
wc -l  gencode.v40.annotation.GLS.gtf
grep -w GLS  gencode.v40.annotation.gtf |  wc -l  -
grep -w GLS  gencode.v40.annotation.gtf  |  grep start_codon -  |  wc -l -
wget    ftp://ftp.ncbi.nlm.nih.gov/pub/clinvar/tab_delimited/variant_summary.txt.gz
ls variant_summary.txt.gz
more variant_summary.txt.gz
gunzip  variant_summary.txt.gz
ls
more  variant_summary.txt
gunzip  variant_summary.txt.gz
ls
more  variant_summary.txt
gzip  variant_summary.txt
ls variant_summary.txt.gz
scp  variant_summary.txt  richmonp@dtn.sockeye.arc.ubc.ca:/scratch/tr-precisionhealth-1/Workshops/StudentSpaces/Sherlock/
$ scp   richmonp@dtn.sockeye.arc.ubc.ca:/scratch/tr-precisionhealth-1/Workshops/StudentSpaces/Sherlock/variant_summary.txt  ~/Desktop/ 
ls   /scratch/tr-precisionhealth-1/Workshop/
ls   /scratch/tr-precisionhealth-1/Workshops/
cp  /scratch/tr-precisionhealth-1/Workshop/Core_CommandLine/Files/gencode.v40.annotation.gtf
cp  /scratch/tr-precisionhealth-1/Workshop/Core_CommandLine/Files/gencode.v40.annotation.gtf /scratch/tr-precisionhealth-1/Workshops/StudentSpaces/Sherlock/
grep  GLS  
grep  GLS   /scratch/tr-precisionhealth-1/Workshop/Core_CommandLine/Files/gencode.v40.annotation.gtf
cd /scratch/tr-precisionhealth-1/Workshops/StudentSpaces/Sherlock/
nano  README.txt
cd /scratch/tr-precisionhealth-1/Workshops/StudentSpaces/Sherlock/
nano  MyFirstShellScript.sh 
sh  /scratch/tr-precisionhealth-1/Workshops/StudentSpaces/Sherlock/MyFirstShellScript.sh
cp    /project/tr-precisionhealth-1/PrecisionHealthVirtualEnvironment/Workshops/Core_CommandLine/ProblemSet/LearningCommandLine_ProblemSet.txt /scratch/tr-precisionhealth-1/Workshops/StudentSpaces/Sherlock/
```

## Command Breakdown

### Print current working directory (pwd):
```
pwd
```

### Change directory (cd):
```
cd </some/path/to/directory/>
```
Example:
```
cd /scratch/tr-precisionhealth-1/Workshops/
```

### List (ls):
```
ls
```
#### Path to directory you want to list:
```
ls <path to file or directory>
```
Example:
```
ls /scratch/tr-precisionhealth-1/Workshops/Core_CommandLine/
```

#### List files line by line with extra info:
```
ls -l
```
Example:
```
ls -l /scratch/tr-precisionhealth-1/Workshops/Core_CommandLine/
```

#### Add multiple extra modifications to ls, listing long format, all files, human readable, time sorted, in reverse:
```
ls -lahtr /scratch/tr-precisionhealth-1/Workshops/
```

### Change Directory (cd)
#### Basic
```
cd <filepath>
```
Example:
```
cd /scratch/tr-precisionhealth-1/Workshops/Core_CommandLine/
```
#### Up a directory in the filesystem
```
cd ../
```

#### To a relative directory
```
cd ./Core_CommandLine/
```
#### To your home directory
```
cd ~
```
or just type cd alone
```
cd 
```

### Make a directory (mkdir)
```
mkdir <directoryPath>
```
Example:
```
mkdir /scratch/tr-precisionhealth-1/Workshops/StudentSpaces/Sherlock
```


### Move File (mv)
#### Basic
```
mv <filepath1> <filepath2>
```
Example, moving file to my home directory:
```
mv /scratch/tr-precisionhealth-1/Workshops/StudentSpaces/Sherlock/test.txt  ~/test.txt
```
#### Rename file 
```
mv <filepath1> <filepath2>
```
Example:
```
mv ~/test.txt ~/ABetterName.txt
```


### Copy File (cp)
#### Basic
```
cp <filepath1> <filepath2>
```
Example:
```
cp  /project/tr-precisionhealth-1/PrecisionHealthVirtualEnvironment/Workshops/Core_CommandLine/Files/gencode.v40.annotation.gtf ./
```

#### Copy and rename
```
cp <filepath1> <filepath2>
```
Example:
```
cp  /project/tr-precisionhealth-1/PrecisionHealthVirtualEnvironment/Workshops/Core_CommandLine/Files/gencode.v40.annotation.gtf ./genes.gtf
```

#### Copy a Directory
```
cp -r <filepath1> <filepath2>
```
Example:
```
cp -r /project/tr-precisionhealth-1/PrecisionHealthVirtualEnvironment/Workshops/Core_CommandLine/ /scratch/tr-precisionhealth-1/Workshops/StudentSpaces/richmonp/
```



### Change permissions (chmod)
#### Basic 
Change permissions for read-write-execute for everybody
```
chmod ugo=rwx <filepath>
```
Example:
```
chmod ugo=rwx /scratch/tr-precisionhealth-1/Workshops/StudentSpaces/richmonp/Core_CommandLine/Files/gencode.v40.annotation.gtf
```

#### On everything in a directory
```
chmod ugo=rwx -R <filepath>
```
Example:
```
chmod ugo=rwx -R /scratch/tr-precisionhealth-1/Workshops/StudentSpaces/richmonp/
```
#### Only give yourself access, let the world read it though
```
chmod u=rwx,go=r -R <filepath>
```
Example:
```
chmod u=rwx,go=r /scratch/tr-precisionhealth-1/Workshops/StudentSpaces/Sherlock/
```
#### Only give yourself access, let them have nothing

```
chmod u=rwx,go=- -R <filepath>
```
Example:
```
chmod u=rwx,go=- /scratch/tr-precisionhealth-1/Workshops/StudentSpaces/Sherlock/
```

### Exploring File Contents (more)
```
more <filepath>
```
Example:
```
more /scratch/tr-precisionhealth-1/Workshops/Core_CommandLine/Files/
```

###Exploring File Contents (less)
```
less <filepath>
```
```
less /scratch/tr-precisionhealth-1/Workshops/Studentspaces/richmonp/Core_CommandLine/Files/gencode.v40.annotation.gtf
```

### Print top of file to standard out (head)
####Basic
```
head /scratch/tr-precisionhealth-1/Workshops/Studentspaces/richmonp/Core_CommandLine/Files/gencode.v40.annotation.gtf
```
Example:
```
head <PHIL THIS IN>
```

#### Specify number of lines
```
head -n 100 <filepath>
```
Example:
```
head -n 100 <PHIL THIS IN>
```

### Print bottom of file to stdout (tail)
#### Basic
```
tail <filepath>
```
Example:
```
tail 
```
#### Specify number of lines
```
tail -n 100 <filepath>
```
Example:
```
tail -n 100 <PHIL THIS IN>
```

### Print whole file to stdout (cat)
```
cat <filepath>
```
Example:
```
cat /global/scratch/EOT_Tutorials/IntroToLinux/RICHMOND/genes.gtf
```

### Capture Standard Out
#### Basic (head example)
```
<command>  >  <filepath>
```
Example:
```
head <PHIL THIS IN>  >  <PHIL THIS IN>
```

### Remove/Delete a file
#### Basic 
```
rm <file>
```
Example:
```
rm <PHIL THIS IN>
```
#### Everything in a directory (CAREFUL)
```
rm -r <filepath>
```
Example:
```
rm -r <PHIL THIS IN>
```


### Grab regular expression (grep)
#### Basic
```
grep <pattern> <filepath>
```
Example:
```
grep "<PHIL THIS IN>" <PHIL THIS IN>
```

#### Basic with capture
```
grep <pattern> <filepath>   >  <filepath>
```
Example:
```
grep "<PHIL THIS IN>" <PHIL THIS IN> > <PHIL THIS IN>
```

#### Matching just the word
```
grep -w "<PHIL THIS IN>" <PHIL THIS IN>
```
## Inverted matching, return all non-matches
```
grep -v "<PHIL THIS IN>" <PHIL THIS IN>
```

### Word Count (wc)
#### Basic
```
wc <filepath>
```
Example:
```
wc <PHIL THIS IN>
```
#### Just lines
```
wc -l <filepath>
```
Example:
```
wc -l <PHIL THIS IN>
```

### Manual (man)
#### Basic
```
man <command>
```
Example:
```
man wc
```

### Web Get (wget)
#### Basic
```
wget <URL>
```
Example:
```
wget ftp://ftp.ncbi.nlm.nih.gov/pub/clinvar/tab_delimited/variant_summary.txt.gz
```

### G-unzip (gunzip)
#### Basic
```
gunzip <filepath>
```
Example:
```
gunzip <PHIL THIS IN>
```

#### Keep compressed file
```
gunzip -c <filepath>  >  <outfilepath>
```
Example:
```
gunzip -c <PHIL THIS IN>  >  <PHIL THIS IN>
```

### Cut/Extract columns from a delimited file
#### Basic
```
cut -f#,#  <filename>
```
Example:
```
cut -f 1,4,5 GRN.gtf > GRN.bed
```


### Echo (echo)
```
echo "Just a test file, made with the echo command" > /home/richmonp/test.txt
```

