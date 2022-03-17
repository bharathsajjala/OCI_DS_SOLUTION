# OCI_DS_SOLUTION

# oci-lakehouse-pipeline
Deploy the building blocks that are necessary for your data science solution architecture.

## Table of Contents

- [What can the stack provision?](#what-can-the-stack-provision)
- [Deployment via Resource Manager](#deployment-via-resource-manager)
- [Deployment via CLI Terraform](#deployment-via-cli-terraform)

### What can the stack provision?
<details>
<summary>Compartment</summary>
<p></p>
<pre>
Logical container for resources, used to manage access to resources as part of Identity and Access Management (IAM).
</pre>
</details>
<details>
<summary>Virtual Cloud Network</summary>
<p></p>
<pre>
Customizable and private cloud network.
</pre>
</details>
<details>
<summary>Data Science Platform</summary>
<p></p>
<pre>
Build, train, deploy, and manage machine learning models with a data science cloud platform built for teams.
</pre>
</details>


### Deployment via Resource Manager
#### Prerequisites
- Fully-privileged access to an OCI Tenancy (account).
- Sufficient availability of resources in your OCI Tenancy. You can check resource availability [here](https://cloud.oracle.com/limits?region=home).
- For Oracle Analytics Cloud (OAC) deployment: An access token from an Identity Cloud Service (IDCS) Application, which will be used as an input parameter that is required for OAC deployment. To walk through this process, please follow [this series of instructions](./modules/oac/generate-idcs-access-token-for-oac.md).
#### Note
For general Resource Manager deployment steps, you can refer to [this documentation](https://docs.oracle.com/en-us/iaas/Content/ResourceManager/Tasks/deploybutton.htm#ariaid-title4). For steps that are specific to this stack, proceed to Step 1.
#### Steps
1. Click the `Deploy to Oracle Cloud` button below, opening the link into a new browser tab.
\
\
In Chrome, Firefox and Safari, you can do this with `CTRL`+`Click` > Select `Open Link in New Tab`.
\
\
[![Deploy to Oracle Cloud](https://oci-resourcemanager-plugin.plugins.oci.oraclecloud.com/latest/deploy-to-oracle-cloud.svg)](https://cloud.oracle.com/resourcemanager/stacks/create?region=home&zipUrl=https://github.com/bharathsajjala/OCI_DS_SOLUTION/archive/refs/tags/v2.zip)
2. Log into your Oracle Cloud Infrastructure (OCI) tenancy with your user credentials. You will then be redirected to the `Stack Information` section of Resource Manager.
3. In the `Stack Information` section, select the checkbox to confirm that you accept the [Oracle Terms of Use](https://cloudmarketplace.oracle.com/marketplace/content?contentId=50511634&render=inline).
4. Click `Next` to proceed to the `Configure Variables` section.
5. For each resource that you wish to deploy, verify that the corresponding checkbox is selected in the `Select Resources` tile. Optionally, you can customize the attributes of each selected resource once an additional tile that presents configuration options for its respective resource appears below.
6. If Oracle Analytics Cloud (OAC) is part of your deployment, ensure that you have already completed the [prerequisite instructions](./modules/oac/generate-idcs-access-token-for-oac.md). Once completed, paste the contents of the file named `token-value.txt` (not to be confused with `tokens.tok`) into the `OAC IDCS Access Token` field, which can be found in the tile that presents configuration options for OAC.
7. When you are finished editing your variables in the `Configure Variables` section, click `Next` to proceed to the `Review` section.
8. Select the checkbox for `Run Apply`, and click `Create`.
9. You can monitor the deployment by monitoring the `Logs` window. Once the resources in the stack have been provisioned, you can access your resources by following this sub-steps series:
\
\
	<b>Access Your Resources:</b>
	1. Click `Job Resources` to open a page that shows details about the resources that were provisioned.
	2. For each resource that you wish to access, find the name of the resource under the `Name` column. If the name of the resource is hyperlinked, open the link into a new browser tab. If the name of the resource is not hyperlinked, do the following instead:
		1. Copy to your clipboard its identifier, which is listed as the value to the `id` key, which can be found under the `Attributes` column once you click `Show`.
		2. Duplicate your browser tab, and switch to that tab.
		3. Paste the identifier from your clipboard into the search field at the top of the OCI UI, and press `Enter` on your keyboard.
		4. Click the listing that corresponds to your resource once it appears in the search results.


