Transfer a large file over TCP
==============================================

## Intro

The example is to show how to transmit a large packet using TCP. Here the large packet is achieved from a file which is nearly 30000 bytes (if larger, the MAXLEN in headsock.h should also be modified). The file name is "myfile.txt", the client end try to send the file to the server in one packet.

At the receiver, the function "recv" is called to receive the packet. The received data is stored in file "myTCPreceive.txt".

After receiving is complete, we can use ```diff myfile.txt myTCPreceive.txt``` to compare the two files
