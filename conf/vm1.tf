resource "yandex_compute_instance" "vm1" {
  name        = local.vm_names.vm1 
  hostname    = local.vm_names.vm1  
  platform_id = local.vm_common.platform

  resources {
    cores         = local.vm_common.cpu
    memory        = local.vm_common.ram
    core_fraction = local.vm_common.fract
  }

  boot_disk {
    initialize_params {
      image_id = data.yandex_compute_image.ubuntu.image_id
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
    nat = true
  }

  allow_stopping_for_update = true
}
