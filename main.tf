provider "azurerm" {
  features {}
}

resource "azurerm_policy_definition" "defaultallowprivilegeescalationephemeral" {
  name         = "defaultallowprivilegeescalationephemeral"
  policy_type  = "Custom"
  mode         = "Microsoft.Kubernetes.Data"
  display_name = "Disable Privilege Escalation on ephemeral containers by default"
  description  = "Mutates the Pod Security Policy disabling privilege on ephemeral containers escalation by default."

  metadata = <<METADATA
	{
		"category": "Kubernetes"
	}
METADATA

  policy_rule = <<POLICY_RULE
	{
		"if": {
			"field": "type",
			"in": [
				"Microsoft.ContainerService/managedClusters"
			]
		},
		"then": {
			"effect": "mutate",
			"details": {
				"mutationInfo": {
					"sourceType": "PublicURL",
					"url": "https://raw.githubusercontent.com/waeltken/gatekeeper-policies/main/policies/default-allow-privilege-escalation-ephemeral.yaml"
				}
			}
		}
	}
POLICY_RULE
}

resource "azurerm_policy_definition" "defaultallowprivilegeescalationinit" {
  name         = "defaultallowprivilegeescalationinit"
  policy_type  = "Custom"
  mode         = "Microsoft.Kubernetes.Data"
  display_name = "Disable Privilege Escalation on init containers by default"
  description  = "Mutates the Pod Security Policy disabling privilege escalation on init containers by default."

  metadata = <<METADATA
	{
		"category": "Kubernetes"
	}
METADATA

  policy_rule = <<POLICY_RULE
	{
		"if": {
			"field": "type",
			"in": [
				"Microsoft.ContainerService/managedClusters"
			]
		},
		"then": {
			"effect": "mutate",
			"details": {
				"mutationInfo": {
					"sourceType": "PublicURL",
					"url": "https://raw.githubusercontent.com/waeltken/gatekeeper-policies/main/policies/default-allow-privilege-escalation-init.yaml"
				}
			}
		}
	}
POLICY_RULE
}

resource "azurerm_policy_definition" "defaultallowprivilegeescalation" {
  name         = "defaultallowprivilegeescalation"
  policy_type  = "Custom"
  mode         = "Microsoft.Kubernetes.Data"
  display_name = "Disable Privilege Escalation by default"
  description  = "Mutates the Pod Security Policy disabling privilege escalation by default."

  metadata = <<METADATA
	{
		"category": "Kubernetes"
	}
METADATA

  policy_rule = <<POLICY_RULE
	{
		"if": {
			"field": "type",
			"in": [
				"Microsoft.ContainerService/managedClusters"
			]
		},
		"then": {
			"effect": "mutate",
			"details": {
				"mutationInfo": {
					"sourceType": "PublicURL",
					"url": "https://raw.githubusercontent.com/waeltken/gatekeeper-policies/main/policies/default-allow-privilege-escalation.yaml"
				}
			}
		}
	}
POLICY_RULE
}

resource "azurerm_policy_definition" "fsGroup" {
  name         = "fsGroup"
  policy_type  = "Custom"
  mode         = "Microsoft.Kubernetes.Data"
  display_name = "Set fsGroup to 3000 by default"
  description  = "Mutates the Pod Security Policy setting fsGroup to 3000 by default."

  metadata = <<METADATA
	{
		"category": "Kubernetes"
	}
METADATA

  policy_rule = <<POLICY_RULE
	{
		"if": {
			"field": "type",
			"in": [
				"Microsoft.ContainerService/managedClusters"
			]
		},
		"then": {
			"effect": "mutate",
			"details": {
				"mutationInfo": {
					"sourceType": "PublicURL",
					"url": "https://raw.githubusercontent.com/waeltken/gatekeeper-policies/main/policies/fsGroup.yaml"
				}
			}
		}
	}
POLICY_RULE
}

resource "azurerm_policy_definition" "readonlyrootfs" {
  name         = "readonlyrootfs"
  policy_type  = "Custom"
  mode         = "Microsoft.Kubernetes.Data"
  display_name = "Enforce read only root filesystems by default"
  description  = "Mutates the Pod Security Policy to enforce read only root filesystems by default."

  metadata = <<METADATA
	{
		"category": "Kubernetes"
	}
METADATA

  policy_rule = <<POLICY_RULE
	{
		"if": {
			"field": "type",
			"in": [
				"Microsoft.ContainerService/managedClusters"
			]
		},
		"then": {
			"effect": "mutate",
			"details": {
				"mutationInfo": {
					"sourceType": "PublicURL",
					"url": "https://raw.githubusercontent.com/waeltken/gatekeeper-policies/main/policies/read-only-root-fs.yaml"
				}
			}
		}
	}
POLICY_RULE
}

resource "azurerm_policy_definition" "runasgroupinit" {
  name         = "runasgroup-init"
  policy_type  = "Custom"
  mode         = "Microsoft.Kubernetes.Data"
  display_name = "Set runAsGroup on init containers to 3000 by default"
  description  = "Mutates the Pod Security Policy setting runAsGroup on init containers to 3000 by default."

  metadata = <<METADATA
	{
		"category": "Kubernetes"
	}
METADATA

  policy_rule = <<POLICY_RULE
	{
		"if": {
			"field": "type",
			"in": [
				"Microsoft.ContainerService/managedClusters"
			]
		},
		"then": {
			"effect": "mutate",
			"details": {
				"mutationInfo": {
					"sourceType": "PublicURL",
					"url": "https://raw.githubusercontent.com/waeltken/gatekeeper-policies/main/policies/run-as-group-init.yaml"
				}
			}
		}
	}
POLICY_RULE
}

resource "azurerm_policy_definition" "runasgroup" {
  name         = "runasgroup"
  policy_type  = "Custom"
  mode         = "Microsoft.Kubernetes.Data"
  display_name = "Set runAsGroup to 3000 by default"
  description  = "Mutates the Pod Security Policy setting runAsGroup to 3000 by default."

  metadata = <<METADATA
	{
		"category": "Kubernetes"
	}
METADATA

  policy_rule = <<POLICY_RULE
	{
		"if": {
			"field": "type",
			"in": [
				"Microsoft.ContainerService/managedClusters"
			]
		},
		"then": {
			"effect": "mutate",
			"details": {
				"mutationInfo": {
					"sourceType": "PublicURL",
					"url": "https://raw.githubusercontent.com/waeltken/gatekeeper-policies/main/policies/run-as-group.yaml"
				}
			}
		}
	}
POLICY_RULE
}

resource "azurerm_policy_definition" "runasnonrootinit" {
  name         = "runasnonroot-init"
  policy_type  = "Custom"
  mode         = "Microsoft.Kubernetes.Data"
  display_name = "Set runAsNonRoot on init containers to true by default"
  description  = "Mutates the Pod Security Policy setting runAsNonRoot on init containers to true by default."

  metadata = <<METADATA
	{
		"category": "Kubernetes"
	}
METADATA

  policy_rule = <<POLICY_RULE
	{
		"if": {
			"field": "type",
			"in": [
				"Microsoft.ContainerService/managedClusters"
			]
		},
		"then": {
			"effect": "mutate",
			"details": {
				"mutationInfo": {
					"sourceType": "PublicURL",
					"url": "https://raw.githubusercontent.com/waeltken/gatekeeper-policies/main/policies/run-as-non-root-init.yaml"
				}
			}
		}
	}
POLICY_RULE
}

resource "azurerm_policy_definition" "runasnonroot" {
  name         = "runasnonroot"
  policy_type  = "Custom"
  mode         = "Microsoft.Kubernetes.Data"
  display_name = "Set runAsNonRoot to true by default"
  description  = "Mutates the Pod Security Policy setting runAsNonRoot to true by default."

  metadata = <<METADATA
	{
		"category": "Kubernetes"
	}
METADATA

  policy_rule = <<POLICY_RULE
	{
		"if": {
			"field": "type",
			"in": [
				"Microsoft.ContainerService/managedClusters"
			]
		},
		"then": {
			"effect": "mutate",
			"details": {
				"mutationInfo": {
					"sourceType": "PublicURL",
					"url": "https://raw.githubusercontent.com/waeltken/gatekeeper-policies/main/policies/run-as-non-root.yaml"
				}
			}
		}
	}
POLICY_RULE
}

resource "azurerm_policy_definition" "runasuserinit" {
  name         = "runasuser-init"
  policy_type  = "Custom"
  mode         = "Microsoft.Kubernetes.Data"
  display_name = "Set runAsUser on init containers to 3000 by default"
  description  = "Mutates the Pod Security Policy setting runAsUser on init containers to 3000 by default."

  metadata = <<METADATA
	{
		"category": "Kubernetes"
	}
METADATA

  policy_rule = <<POLICY_RULE
	{
		"if": {
			"field": "type",
			"in": [
				"Microsoft.ContainerService/managedClusters"
			]
		},
		"then": {
			"effect": "mutate",
			"details": {
				"mutationInfo": {
					"sourceType": "PublicURL",
					"url": "https://raw.githubusercontent.com/waeltken/gatekeeper-policies/main/policies/run-as-user-init.yaml"
				}
			}
		}
	}
POLICY_RULE
}

resource "azurerm_policy_definition" "runasuser" {
  name         = "runasuser"
  policy_type  = "Custom"
  mode         = "Microsoft.Kubernetes.Data"
  display_name = "Set runAsUser to 3000 by default"
  description  = "Mutates the Pod Security Policy setting runAsUser to 3000 by default."

  metadata = <<METADATA
	{
		"category": "Kubernetes"
	}
METADATA

  policy_rule = <<POLICY_RULE
	{
		"if": {
			"field": "type",
			"in": [
				"Microsoft.ContainerService/managedClusters"
			]
		},
		"then": {
			"effect": "mutate",
			"details": {
				"mutationInfo": {
					"sourceType": "PublicURL",
					"url": "https://raw.githubusercontent.com/waeltken/gatekeeper-policies/main/policies/run-as-user.yaml"
				}
			}
		}
	}
POLICY_RULE
}

resource "azurerm_policy_set_definition" "mutatepsp" {

  name         = "mutatepsp"
  policy_type  = "Custom"
  display_name = "Mutate Pod Security Policies to set secure defaults"

  policy_definition_reference {
    policy_definition_id = azurerm_policy_definition.defaultallowprivilegeescalationephemeral.id
  }

  policy_definition_reference {
    policy_definition_id = azurerm_policy_definition.defaultallowprivilegeescalationinit.id
  }

  policy_definition_reference {
    policy_definition_id = azurerm_policy_definition.defaultallowprivilegeescalation.id
  }

  policy_definition_reference {
    policy_definition_id = azurerm_policy_definition.fsGroup.id
  }

  policy_definition_reference {
    policy_definition_id = azurerm_policy_definition.readonlyrootfs.id
  }

  policy_definition_reference {
    policy_definition_id = azurerm_policy_definition.runasgroupinit.id
  }

  policy_definition_reference {
    policy_definition_id = azurerm_policy_definition.runasgroup.id
  }

  policy_definition_reference {
    policy_definition_id = azurerm_policy_definition.runasnonrootinit.id
  }

  policy_definition_reference {
    policy_definition_id = azurerm_policy_definition.runasnonroot.id
  }

  policy_definition_reference {
    policy_definition_id = azurerm_policy_definition.runasuserinit.id
  }

  policy_definition_reference {
    policy_definition_id = azurerm_policy_definition.runasuser.id
  }
}

