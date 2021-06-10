variable "location" {
  type    = string
  default = "eastus"
}
variable "prefix" {
  type    = string
  default = "aa-aot-asom-dev-eastus"
}
variable "resprefix" {
  type    = string
  default = "aaaotdevusestasom"
}
variable "asom-ui" {
  type    = string
  default = "ASOM-UI"
}
variable "asom-api" {
  type    = string
  default = "ASOM-API"
}
variable "asom-io" {
  type    = string
  default = "ASOM-IO"
}
variable "asom-moc-event-manager" {
  type    = string
  default = "MOC-EVENT-MANAGER"
}

variable "tenet_id" {
  type    = string
  default = "49793faf-eb3f-4d99-a0cf-aef7cce79dc1"
}
variable "subscription_id" {
  type    = string
  default = "0de836dc-fea8-4805-b578-5d70b530d15e"

}
variable "client_id" {
  type    = string
  default = "24834fc2-5ff4-4649-ab75-761dab93fd07"

}
variable "client_secret" {
  type    = string
  default = "bi2_hoj-~H~zndoJS0-WLLBP80O.0kUC5G"

}

variable "cosmosdb_offer_type" {
  description = "CosmosDb offer type. Defaults to Standard"
  type        = string
  default     = "Standard"
}
variable "enable_free_tier" {
  type        = bool
  description = "Enable Free Tier"
  default     = false
}
variable "max_interval_in_seconds" {
  description = "Specifies timeout of staless in seconds"
  type        = number
  default     = 300
}

variable "consistency_level" {
  description = "Session should be preferred. Can be either Eventual, ConsistentPrefix, Session, Strong."
  default     = "Session"
}
variable "max_staleness_prefix" {
  description = "Specifies the number of stale requests tolerated"
  type        = number
  default     = 100
}
