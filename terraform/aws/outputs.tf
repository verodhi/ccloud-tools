###########################################
################# Outputs #################
###########################################

output "REST Proxy                   " {

  value = "${var.instance_count["rest_proxy"] >= 1
           ? "${join(",", formatlist("http://%s", aws_alb.rest_proxy.*.dns_name))}"
           : "REST Proxy has been disabled"}"

}

output "Kafka Connect                " {

  value = "${var.instance_count["kafka_connect"] >= 1
           ? "${join(",", formatlist("http://%s", aws_alb.kafka_connect.*.dns_name))}"
           : "Kafka Connect has been disabled"}"

}

output "KSQL Server                  " {

  value = "${var.instance_count["ksql_server"] >= 1
           ? "${join(",", formatlist("http://%s", aws_alb.ksql_server.*.dns_name))}"
           : "KSQL Server has been disabled"}"

}

output "Control Center               " {

  value = "${var.instance_count["control_center"] >= 1
           ? "${join(",", formatlist("http://%s", aws_alb.control_center.*.dns_name))}"
           : "Control Center has been disabled"}"

}

output "Bastion Server               " {

  value = "${var.instance_count["bastion_server"] >= 1
           ? "ssh ec2-user@${join(",", formatlist("%s", aws_instance.bastion_server.*.public_ip))} -i cert.pem"
           : "Bastion Server has been disabled"}"

}