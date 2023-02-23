module "application" {
  source = "./modules/step-function"
  name   = var.md_metadeta.name_prefix
  tags   = var.md_metadata.default_tags
}
