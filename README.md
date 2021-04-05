
# Background
I bought a network scanner/printer, the Brother MFC-L2700DW. 
Its an ancient printer, black and white with automatic document feeder for the scanner.

Linux-support is ok-ish, but the scanner is hard to use given the provided tools.
This is a docker image, based on debian which installs the brother packages,
https://download.brother.com/welcome/dlf006645/brscan4-0.4.9-1.amd64.deb
https://download.brother.com/welcome/dlf006652/brscan-skey-0.3.1-2.amd64.deb

## Will if work with Brother MFC-XXXXX?
Valid question, but I only tried my version. Given the brscan-tools seem
to be used for multiple ones, your chances are good. :)

## How I use this?
I run the container, and trigger the actual scan with home assistent. 
The resulting pdfs are then placed in a folder for further processing.

## Build the image

```
docker build -t debian-brscan .
```

## Start container

Change the ip and output folder.
```
docker run -it --net host -e OUTPUT=/output -e IP=192.168.2.144 -v $PWD/output:/output --rm --name brscan debian-brscan:latest
```


## Scan your first document

place your document in document feeder and

```
docker exec brscan /scan.sh
```
