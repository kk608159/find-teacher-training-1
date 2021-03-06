terraform {
  required_providers {
    cloudfoundry = {
      source  = "cloudfoundry-community/cloudfoundry"
      version = "0.12.6"
    }
  }
}

provider cloudfoundry {
  api_url      = var.cf_api_url
  user         = var.cf_user != "" ? var.cf_user : null
  password     = var.cf_user_password != "" ? var.cf_user_password : null
  sso_passcode = var.cf_sso_passcode != "" ? var.cf_sso_passcode : null
}

resource cloudfoundry_app web_app {
  name                       = local.web_app_name
  command                    = local.web_app_start_command
  docker_image               = var.app_docker_image
  health_check_type          = "http"
  health_check_http_endpoint = "/ping"
  instances                  = var.web_app_instances
  memory                     = var.web_app_memory
  space                      = data.cloudfoundry_space.space.id
  strategy                   = "blue-green-v2"
  timeout                    = 180
  environment                = var.app_environment_variables
  dynamic "routes" {
    for_each = local.web_app_routes
    content {
      route = routes.value
    }
  }
  service_binding {
    service_instance = cloudfoundry_user_provided_service.logging.id
  }
  docker_credentials = var.docker_credentials
}

resource cloudfoundry_route web_app_cloudapps_digital_route {
  domain   = data.cloudfoundry_domain.london_cloudapps_digital.id
  space    = data.cloudfoundry_space.space.id
  hostname = local.web_app_name
}

resource cloudfoundry_route web_app_service_gov_uk_route {
  for_each = toset(local.service_gov_uk_host_names[var.app_environment])

  domain   = data.cloudfoundry_domain.find_service_gov_uk.id
  space    = data.cloudfoundry_space.space.id
  hostname = each.value
}

resource cloudfoundry_user_provided_service logging {
  name             = local.logging_service_name
  space            = data.cloudfoundry_space.space.id
  syslog_drain_url = var.logstash_url
}
