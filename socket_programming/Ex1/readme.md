Simple TCP and UDP demo
=============================================

This example is to show how to transmit a short packet using TCP and UDP.
Input a string (less than 50 characters) at the client end, you will receive the string at the server.

## Usage

Compile the tcp_ser1.c first with ```gcc -Wall -o tcp_ser1.o``` and run with ```./tcp_ser1.o```. This will run
a tcp server on your localhost and it is ready to receive inputs from other sockets. Keep this server running
and then we can move on.

Then compile tcp_client1.c and run it will command ```./tcp_client1.o localhost```(or replace localhost with ip address). You will be prompted with
input and once you type the string ended with '\n', you will be able to see the received string on server.

The same thing can be done for UDP.
