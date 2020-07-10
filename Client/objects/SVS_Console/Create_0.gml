socket = network_create_socket(network_socket_tcp);
network_set_config(network_config_use_non_blocking_socket, true);

network_connect(socket, "127.0.0.1", 3000); /// 3000 is default port for SVS_Console