# Self-Hosted Task Management Solution
🚀 A ready-to-deploy Docker-based solution for task management and automation, perfect for private users, small companies, and NGOs.

## 🌟 Key Features
- **Task Management**: Powered by [Vikunja](https://vikunja.io/), a powerful open-source project management tool
- **Workflow Automation**: Integrated [N8N](https://docs.n8n.io/hosting/) for custom workflow automation
- **Database**: MariaDB (with flexibility to use PostgreSQL or SQLite)
- **Self-Hosted**: Complete control over your data and infrastructure
- **Easy Setup**: Simple deployment using Docker Compose

## 🔧 Prerequisites
- Docker
- Docker Compose
- Git

## 🚀 Quick Start
```bash
git clone [your-repository-url]
cd [repository-name]
docker-compose up -d
```

Then install ```n8n-nodes-vikunja``` through n8n GUI using this instruction: https://vikunja.io/docs/n8n

## 📖 How It Works

This project combines several open-source tools to create a comprehensive task management solution:

### 1. Task Management (Vikunja)
- Self-hosted alternative to tools like Jira
- Feature-rich project management capabilities
- Source code: [Vikunja GitHub Repository](https://github.com/go-vikunja/vikunja)

### 2. Automation (N8N)
- Integrated workflow automation
- Custom Vikunja node: [n8n-nodes-vikunja](https://www.npmjs.com/package/n8n-nodes-vikunja)
- Required Configuration:
  - Set `n8n.environment.WEBHOOK_URL` in `docker-compose.yml`
  - Follow the [Vikunja N8N Integration Guide](https://vikunja.io/docs/n8n)

### 3. Database
Default configuration uses PostgreSQL, but you can easily switch to:
- MariaDB (Not supported by N8N, link: https://docs.n8n.io/hosting/configuration/supported-databases-settings/)
- SQLite (you can run it without all this strange migrations and so on)

For alternative database setups, check the [Vikunja Docker Configuration Guide](https://vikunja.io/docs/full-docker-example)

## 🔍 Configuration
```yaml
# Example configuration snippet from docker-compose.yml
services:
  vikunja:
    image: vikunja/vikunja
    # ... configuration details to be added
  
  n8n:
    image: n8nio/n8n
    environment:
      - WEBHOOK_URL=your_webhook_url_here
    # ... configuration details to be added
```

## 📝 Important Notes
- When connecting N8N with Vikunja, ensure the webhook URL is correctly configured
- `db/init.d/01-init-n8n.sql` is a script allowing you pre setup all the things to work at the same environment (not sure how safe it's tho)
- This is an experimental project aimed at testing the viability of self-hosted task management solutions


---
*For more information about the components used in this project:*
- [Vikunja Documentation](https://vikunja.io/docs/)
- [N8N Documentation](https://docs.n8n.io/)
- [Docker Compose Documentation](https://docs.docker.com/compose/)
