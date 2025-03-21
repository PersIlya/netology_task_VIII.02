locals {
  Name_VPC="public"

  vm_common = { platform="standard-v1", cpu=2, ram=1, fract=20, hdd_type="network-hdd", disk_size=13 } 
  vm_names = { nat0="nat-instance", vm1="vm1" ,  vm2="vm2" }  
  vpc_names = { net1="public_subnet" , net2="private_subnet"}  

  ssh_opt = {proto="ssh", user_name="ubuntu", pubkey=file("~/.ssh/id_ed25519.pub"), time="120s"}
}