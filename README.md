# AKS(K8S) environment

## Before you start

### Microsoft Azure  authentication

This stack uses *Microsoft Azure Account* to authenticate *Terraform* provider.

**You have to run** az login and choose your account.

Make sure you have *Azure CLI* installed in you *env*, if not - **follow** [installation instructions](https://docs.microsoft.com/pl-pl/cli/azure/install-azure-cli?view=azure-cli-latest)

```bash
az login
```

*You should recive* below output :

```bash
Most likely you need to configure your SUID sandbox correctly
You have logged in. Now let us find all the subscriptions to which you have access...
```
### Terraform installation

Make sure you have *Terraform* installed in you *env*, if not - **follow** [installation instructions](https://learn.hashicorp.com/terraform/getting-started/install.html).

Required *Terrafrom* version is **0.12.x**:

```bash
terraform version
Terraform v0.12.6
```

### Run Terraform for bootstrap K8S cluster in Azure.

This stack uses **remote** `*.tfstate` file, its location is configured in `init.tf` file. There's no need to store or operate `*.tfstate` files locally.

```bash
terraform init
```
**Backend** was configured on `init.tf`.
