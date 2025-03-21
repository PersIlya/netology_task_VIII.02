output "internal_ip_address_nat_vm" {
  value = yandex_compute_instance.nat-instance.network_interface.0.ip_address
}

output "external_ip_address_nat_vm" {
  value = yandex_compute_instance.nat-instance.network_interface.0.nat_ip_address
}

output "internal_ip_address_public_vm1" {
  value = yandex_compute_instance.vm1.network_interface.0.ip_address
}

output "external_ip_address_public_vm" {
  value = yandex_compute_instance.vm1.network_interface.0.nat_ip_address
}

output "internal_ip_address_private_vm2" {
  value = yandex_compute_instance.vm2.network_interface.0.ip_address
}

output "external_ip_address_private_vm2" {
  value = yandex_compute_instance.vm2.network_interface.0.nat_ip_address
}