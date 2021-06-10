resource "local_file" "AnsibleInventory" {
  content = templatefile("ansible/inventory.tpl",
    {
      ip               = ah_cloud_server.k8s.*.ips.0.ip_address,
      int_ip           = ah_private_network_connection.lan1.*.ip_address
    }
  )
  filename = "hosts"
}
