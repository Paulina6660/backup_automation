terraform {
    required_providers {
        local = {
            source = "hashicorp/local"
        }
    }
}

provider "local" {}

variable "project_folder" {
    default = "../"
}

resource "local_file" "data_folder" {
    filename = "${var.project_folder}data/info.txt"
    content = "Source files"
}

resource "local_file" "backup_folder" {
    filename = "${var.project_folder}backup/info.txt"
    content = "Backup files"
}

resource "local_file" "logs_folder" {
    filename = "${var.project_folder}logs/info.txt"
    content = "Backup logs"
}

output "backup_location" {
    value = "${var.project_folder}backup"
}

output "data_location" {
    value = "${var.project_folder}data"
}