
vms_net_options = {
  "public" = {
    default_zone = "ru-central1-a"
    default_cidr = ["192.168.10.0/24"]
    vpc_name = "private_subnet"
  },
  "private" = {
    default_zone = "ru-central1-a"
    default_cidr = ["192.168.20.0/24"]
    vpc_name = "public_subnet"
  }
}


YaCloud = {
  cloud_id = "b1gvavfo2pgs977g0asu"
  folder_id = "b1grj2k1iq12emu85rv4"
  default_zone = "ru-central1-a"
  default_cidr = ["10.0.1.0/24"]
}

