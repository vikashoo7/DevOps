resource "docker_image" "noderedImage" {
  #name = "nodered/node-red:latest"
  name = var.image
}
resource "docker_container" "noderedContainer" {
  name  = "mycontainer"
  image = docker_image.noderedImage.latest ##Refrencing the other resource.
  ports {
    internal = 1880
  #  external = 1880
  }
}

output "IpAddree" {
    value = docker_container.noderedContainer.ip_address
    # value = join(":", [docker_container.noderedContainer[0].ip_address, docker_container.noderedContainer[0].ports[0].external])
    description = "The IP address of containeri and hte port of the container"
}
