variable "YaCloud" {
  description = "YaCloud options"
  type = object({cloud_id=string, folder_id=string, default_zone=string, default_cidr = list(string)})
  sensitive = true
}

variable "vms_net_options" {
  description = "VMs net options"
  type = map(object(
    {
      default_zone = string
      default_cidr = list(string)
      vpc_name = string
    }
  ))
} 