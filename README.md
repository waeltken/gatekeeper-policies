# gatekeeper-policies for AKS

This repository contains a set of
[gatekeeper](https://open-policy-agent.github.io/gatekeeper/website/) policies
for AKS. These policies are based on the [Azure Policy for
AKS](https://learn.microsoft.com/en-us/azure/governance/policy/concepts/policy-for-kubernetes)
so you can apply them on the resource, resource group, subscription level or
even management group level.

> [!IMPORTANT]
> This describes a preview feature and is not recommended for
> production use.

> [!WARNING]
> Please bear in mind that these policies will likely break your application
> without warning. We strongly advise to use deny policies instead since they
> will give your users a good description of what is wrong with their
> deployment.

## Prerequisites

You need to enable the `AKS-AzurePolicyMutation` feature flag on your
Subscription since mutating webhooks are still in preview.

```zsh
az feature register --namespace Microsoft.ContainerService --name AKS-AzurePolicyMutation
az provider register -n Microsoft.ContainerService
```

This repository uses terraform to create a set of policies and and an initiative to collect them together. You can use the following commands to create the policies and initiative:

```zsh
terrafrom init
terraform apply
```

You can then apply the initiative to your cluster using terraform:

```terraform
data "azurerm_policy_set_definition" "mutatepsp" {
	name = "mutatepsp"
}

resource "azurerm_resource_policy_assignment" "cluster_mutatepsp" {
	name = "mutatepsp-assignment"
	resource_id = <your_cluster_resource_id>
	policy_definition_id = data.azurerm_policy_set_definition.mutatepsp.id
}
```
