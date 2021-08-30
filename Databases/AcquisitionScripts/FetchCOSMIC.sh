# COSMIC

# Working directory set
WORKING_DIR=/mnt/common/DATABASES/REFERENCES/GRCh38/COSMIC/
mkdir -p $WORKING_DIR
cd $WORKING_DIR

# Overview

# Okay so a few things here. First off, you need to register with COSMIC to get access to the data. Do that at: https://cancer.sanger.ac.uk/cosmic/. Also refer to the website for instructions on downloading via scripting. 
# Next, you will need to combine your username and password to get an authentication string.

# echo "email@example.com:mycosmicpassword" | base64
# ZW1haWxAZXhhbXBsZS5jb206bXljb3NtaWNwYXNzd29yZAo=

# Me doing this:
# echo "prichmond@bcchr.ca:COVID19!" | base64
# cHJpY2htb25kQGJjY2hyLmNhOkNPVklEMTkhCg==
# curl -H "Authorization: Basic cHJpY2htb25kQGJjY2hyLmNhOkNPVklEMTkhCg==" https://cancer.sanger.ac.uk/cosmic/file_download/GRCh38/cosmic/v92/VCF/CosmicCodingMuts.normal.vcf.gz

# Then grab the file
#curl -o CosmicCodingMuts.normal.vcf.gz "https://cog.sanger.ac.uk/cosmic/GRCh38/cosmic/v92/VCF/CosmicCodingMuts.normal.vcf.gz?AWSAccessKeyId=KRV7P7QR9DL41J9EWGA2&Expires=1599697810&Signature=2KospJ4KD7%2FIyuuW541Mf2%2F%2B1wQ%3D" 

# Do it again for NonCoding Mutations
# curl -H "Authorization: Basic cHJpY2htb25kQGJjY2hyLmNhOkNPVklEMTkhCg==" https://cancer.sanger.ac.uk/cosmic/file_download/GRCh38/cosmic/v92/VCF/CosmicNonCodingVariants.normal.vcf.gz

# THen grab the file
#curl -o CosmicNonCodingVariants.normal.vcf.gz "https://cog.sanger.ac.uk/cosmic/GRCh38/cosmic/v92/VCF/CosmicNonCodingVariants.normal.vcf.gz?AWSAccessKeyId=KRV7P7QR9DL41J9EWGA2&Expires=1599698332&Signature=lgx1mSjsZOE9tpLc9HbwFc9o6Z0%3D"


#REPEATING FOR GRCH37
# Working directory set
WORKING_DIR=/mnt/common/DATABASES/REFERENCES/GRCh37/COSMIC/
mkdir -p $WORKING_DIR
cd $WORKING_DIR

# Coding 

# $ curl -H "Authorization: Basic cHJpY2htb25kQGJjY2hyLmNhOkNPVklEMTkhCg==" https://cancer.sanger.ac.uk/cosmic/file_download/GRCh37/cosmic/v92/VCF/CosmicCodingMuts.normal.vcf.gz
# {"url":"https://cog.sanger.ac.uk/cosmic/GRCh37/cosmic/v92/VCF/CosmicCodingMuts.normal.vcf.gz?AWSAccessKeyId=KRV7P7QR9DL41J9EWGA2&Expires=1599698498&Signature=Aej0kAvXx1aTqiuIyV6x0WyPMa0%3D"}

#curl -o CosmicCodingMuts.vcf.gz "https://cog.sanger.ac.uk/cosmic/GRCh37/cosmic/v92/VCF/CosmicCodingMuts.normal.vcf.gz?AWSAccessKeyId=KRV7P7QR9DL41J9EWGA2&Expires=1599698897&Signature=z3MtXrCK3EXpqAKlqxBAsyDgsYM%3D"

# Noncoding
# $ curl -H "Authorization: Basic cHJpY2htb25kQGJjY2hyLmNhOkNPVklEMTkhCg==" https://cancer.sanger.ac.uk/cosmic/file_download/GRCh37/cosmic/v92/VCF/CosmicNonCodingMuts.normal.vcf.gz
# {"url":"https://cog.sanger.ac.uk/cosmic/GRCh37/cosmic/v92/VCF/CosmicNonCodingMuts.normal.vcf.gz?AWSAccessKeyId=KRV7P7QR9DL41J9EWGA2&Expires=1599698653&Signature=WYjmdgSecsPHnX%2FxIgvw9M32erY%3D"}

curl -o CosmicNonCodingMuts.vcf.gz "https://cog.sanger.ac.uk/cosmic/GRCh37/cosmic/v92/VCF/CosmicNonCodingVariants.normal.vcf.gz?AWSAccessKeyId=KRV7P7QR9DL41J9EWGA2&Expires=1599699152&Signature=fXcUNlk3%2Bg8seZiOekkWJJ64src%3D"


