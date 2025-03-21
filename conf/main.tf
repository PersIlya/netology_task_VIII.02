resource "yandex_vpc_network" "network" {
  name = "Network"
}

resource "yandex_vpc_subnet" "public_subnet" {
  name           = var.vms_net_options["public"].vpc_name 
  zone           = var.vms_net_options["public"].default_zone
  network_id     = yandex_vpc_network.network.id
  v4_cidr_blocks = var.vms_net_options["public"].default_cidr
  #route_table_id = yandex_vpc_route_table.nat-instance-route.id
}

resource "yandex_vpc_subnet" "private_subnet" {
  name           = var.vms_net_options["private"].vpc_name
  zone           = var.vms_net_options["private"].default_zone
  network_id     = yandex_vpc_network.network.id
  v4_cidr_blocks = var.vms_net_options["private"].default_cidr
  route_table_id = yandex_vpc_route_table.nat-instance-route.id
}

data "yandex_compute_image" "ubuntu" {
  family = "ubuntu-2204-lts"
}

resource "yandex_vpc_route_table" "nat-instance-route" {
  name       = "nat-instance-route"
  network_id = yandex_vpc_network.network.id 
  static_route {
    destination_prefix = "0.0.0.0/0"
    next_hop_address   = "192.168.10.254"
  }
}