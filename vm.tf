resource "ah_cloud_server" "k8s" {
  backups    = false
  count      = 4
  name       = "node_${count.index}"
  datacenter = var.ah_dc
  image      = var.ah_image_type
  product    = var.ah_machine_type
  ssh_keys   = [var.ah_fp]
}

resource "ah_private_network" "lan1" {
  ip_range = "10.1.0.0/24"
  name     = "LAN1"
}

resource "ah_private_network_connection" "lan1" {
  count              = 4
  cloud_server_id    = ah_cloud_server.k8s[count.index].id
  private_network_id = ah_private_network.lan1.id
  ip_address         = "10.1.0.1${count.index}"
  depends_on = [
  ah_cloud_server.k8s
  ]
}