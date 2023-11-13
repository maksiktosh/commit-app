variable "cluster_name" {
  type        = string
  default     = "crm-k8s"
}

variable "cluster_region" {
  type        = string
  default     = "sfo3"
}

variable "cluster_version" {
  type        = string
  default     = "1.28.2-do.0"
}

variable "cluster_ha" {
  type        = bool
  default     = false
}

variable "cluster_tags" {
  type        = set(string)
  default     = ["shared", "crm-k8s", "terraformed", "k8s"]
}

variable "node_name" {
  type        = string
  default     = "crm-basic"
}

variable "node_size" {
  type        = string
  default     = "s-2vcpu-4gb"
}

variable "node_autoscale" {
  type        = bool
  default     = true
}

variable "node_min_nodes" {
  type        = string
  default     = 1
}

variable "node_max_nodes" {
  type        = string
  default     = 2
}

variable "node_labels" {
  type        = map(string)
  default     = {"project" = "crm", "project_name" = "crm"}
}

variable "node_tags" {
  type        = set(string)
  default     = ["project_crm", "project_name_crm", "terraformed", "k8s"]
}

variable "vpc_name" {
  type        = string
  default     = "default-sfo3"
}

variable "token" {
  type        = string
  default     = "dop_v1_c702d461d3405fdd7d1a022b05a0626976e755af203370f91559dcff5b74b549"
}

variable "access" {
  type        = string
  default     = "DO00VBGM34WB7K82UJHM"
}

variable "secret" {
  type        = string
  default     = "pFo9iT9m/xlB+ZBRyQJG3ZnQamHRdhHgai3Hkk6trTc"
}
