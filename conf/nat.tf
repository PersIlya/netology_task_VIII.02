data "yandex_compute_image" "nat-image" {
  image_id = "fd80mrhj8fl2oe87o4e1"
}

resource "yandex_compute_instance" "nat-instance" {
  name        = local.vm_names.nat0 
  hostname    = local.vm_names.nat0  
  platform_id = local.vm_common.platform

  resources {
    cores         = local.vm_common.cpu
    memory        = local.vm_common.ram
    core_fraction = local.vm_common.fract
  }

  boot_disk {
    initialize_params {
      image_id = data.yandex_compute_image.nat-image.image_id
      type     = local.vm_common.hdd_type
      size     = local.vm_common.disk_size
    }
  }

  metadata = {
    serial-port-enable = 1
    ssh-keys = "${local.ssh_opt.user_name}:${local.ssh_opt.pubkey}" 
  }

  scheduling_policy { preemptible = true }

  network_interface {
    subnet_id = yandex_vpc_subnet.public_subnet.id
    ip_address = "192.168.10.254"
    nat = true
  }

  allow_stopping_for_update = true
}
