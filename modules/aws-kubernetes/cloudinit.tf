data "template_file" "ssh_keys" {
  count    = "${length(var.ssh-public-keys)}"
  template = "- $${ssh-public-key}"

  vars {
    ssh-public-key = "${element("${var.ssh-public-keys}", count.index)}"
  }
}

data "template_file" "cloud-init-keys" {
  template = "${file("${path.module}/cloudinit/userdata-template.yml")}"

  vars {
    ssh-authorized-keys = "${indent(2, join("\n", "${data.template_file.ssh_keys.*.rendered}"))}"
  }
}

data "template_file" "cloud-init-workers" {
  count    = "${length(var.kube-workers)}"
  template = "${file("${path.module}/cloudinit/worker-join.yml")}"

  vars {
    s3_bucket_name        = "${var.s3-bucket-name}"
    kind                  = "${lookup(var.kube-workers[count.index], "kind")}"
    alertmanager_hostname = "${var.alertmanager-hostname}"
    ssh-authorized-keys   = "${indent(2, join("\n", "${data.template_file.ssh_keys.*.rendered}"))}"
  }
}

data "template_cloudinit_config" "config_master" {
  gzip = false

  part {
    filename     = "ssh-authorized-keys.cfg"
    content_type = "text/cloud-config"
    content      = "${data.template_file.cloud-init-keys.rendered}"
  }
}

data "template_cloudinit_config" "config_worker" {
  count = "${length(var.kube-workers)}"
  gzip  = false

  part {
    filename     = "workers-init.cfg"
    content_type = "text/cloud-config"
    content      = "${element(data.template_file.cloud-init-workers.*.rendered, count.index)}"
  }
}
