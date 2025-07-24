# Wazuh

## Installation

Based on [Wazuh's documentation](https://documentation.wazuh.com/4.12/deployment-options/docker/docker-installation.html).

```bash
# Cloning docker-compose and other files
git clone https://github.com/wazuh/wazuh-docker.git -b v4.12.0
# Choosing "single-node" deployment
cd wazuh-docker/single-node/
# Creating certificates using a worker pod
docker-compose -f generate-indexer-certs.yml run --rm generator
docker-compose up -d
```

After containers started running, You must be able to see the UI on the instance's IP address.

> User pass is available on docker-compose files and they both are "kibanaserver". After logging in you can change it.

### Setting up an Agent

For setting up an agent, In the UI, Go to sidebar > Agent's management > summary. There you should see a page like this:

<img src="https://github.com/parsaeisa/Notes/blob/main/Software%20engineering/observability/agent-summary-wazuh.png" >

Click on "Deploy new Agent" button and then, instructions are shown.

In case of any problem with deploying agents, check the agent's config file in the "/var/ossec/etc/ossec.conf".