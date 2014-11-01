compile the file tcp_server.c with command ```gcc -Wall tcp_server.c -o tcp_server.o```. ignore warnings
compile the file tcp_client.c with command ```gcc -Wall tcp_client.c -o tcp_client.o```. ignore warnings

Run ./tcp_server.o with argument error rate provided as integer between 0 to 90 e.g. ./tcp_server.o 50. the server will reject 50 packages out of every 100 packages received
Run ./tcp_client.o with argument host name provided as string e.g. ./tcp_client.o localhost
