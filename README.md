# ʕ•ᴥ•ʔ Bear Blog

A free, no-nonsense, super-fast blogging platform. No javascript, no stylesheets, no trackers. Just your words.

## 🚀 Quick Start

### Docker Deployment (Recommended)

The easiest way to deploy BearBlog is using Docker:

```bash
# Clone the repository
git clone <your-repo-url>
cd bearblog

# Set up environment variables
cp env.example .env
# Edit .env with your configuration

# Run the setup script
./scripts/docker-setup.sh
```

Your BearBlog will be running at `http://localhost`!

### Manual Setup

For manual installation, see the [Docker Deployment Guide](DOCKER.md) for detailed instructions.

## 📚 Documentation

- **[Docker Containerization](DOCUMENTATION.md)** - Overview of Docker changes made
- **[Docker Deployment Guide](DOCKER.md)** - Complete Docker setup and deployment instructions
- **[Custom Domain Deployment](CUSTOM_DOMAIN_DEPLOYMENT.md)** - How to deploy under your own domain

## 🌟 Features

- **Minimalist Design**: No JavaScript, no trackers, just content
- **Markdown Support**: Write posts in Markdown
- **Custom Domains**: Users can use their own domains
- **Subdomain Blogs**: Each user gets a subdomain
- **Email Newsletters**: Built-in email subscription system
- **Analytics**: Simple, privacy-focused analytics
- **Multi-tenant**: Host multiple blogs on one platform

## 🔧 Configuration

### Environment Variables

Key environment variables you need to configure:

```bash
# Domain Configuration
MAIN_DOMAIN=yourdomain.com
MAIN_SITE_HOSTS=localhost,yourdomain.com

# Database
POSTGRES_DB=bearblog
POSTGRES_USER=postgres
POSTGRES_PASSWORD=your-secure-password

# Email
EMAIL_HOST=smtp.yourmailgun.com
EMAIL_HOST_USER=postmaster@mg.yourdomain.com
EMAIL_HOST_PASSWORD=your-mailgun-password

# Django
SECRET=your-secret-key-here
```

See [env.example](env.example) for all available options.

## 🐳 Docker Services

The Docker setup includes:

- **Web**: Django application (Gunicorn)
- **Database**: PostgreSQL 15
- **Cache**: Redis 7
- **Proxy**: Nginx (reverse proxy and static files)

## 🌐 Domain Support

BearBlog supports multiple domain configurations:

- **Main Domain**: Landing page and admin interface
- **Subdomains**: User blogs (e.g., `username.yourdomain.com`)
- **Custom Domains**: Users can connect their own domains

See [Custom Domain Deployment Guide](CUSTOM_DOMAIN_DEPLOYMENT.md) for detailed setup instructions.

## 📝 Markdown

All post content is written in Markdown. Check out the [Markdown cheatsheet](https://herman.bearblog.dev/markdown-cheatsheet/) for syntax.

## 🤝 Contributing

Bear Blog is not currently accepting contributions. See [CONTRIBUTIONS.md](CONTRIBUTIONS.md) for more information.

## 📖 Wiki & Documentation

The full documentation for Bear Blog can be found at [docs.bearblog.dev](https://docs.bearblog.dev).

## 🐻 Some Bear Faces

```
ʕ •ᴥ•ʔ  ʕ •ᴥ•ʔゝ☆  ＼ʕ •ᴥ•ʔ／  ＼ʕ •ᴥ•ʔ＼  ／ʕ •ᴥ•ʔ／  ʕง•ᴥ•ʔง  ᕕʕ •ᴥ•ʔ୨  ʕ　·ᴥʔ  ʕ　·ᴥ·ʔ
ʕ·ᴥ·　ʔ  ʕᴥ·　ʔ  ʕ •`ᴥ•´ʔ  Σʕﾟᴥﾟﾉʔﾉ  "φʕ•ᴥ•oʔ  ᕦʕ •ᴥ•ʔᕤ  ┏ʕ •ᴥ•ʔ┛  ʕ´•ᴥ•`ʔ  ʅʕ•ᴥ•ʔʃ  ʕノ)ᴥ(ヾʔ
ʕ/　·ᴥ·ʔ/  ʕ☞ᴥ ☜ʔ  ʕᴥ• ʔ☝  ʕ·ᴥ·˵ ʔ ʕ　˵·ᴥ·ʔ  ʕ º ᴥ ºʔ  ʕ ᵒ ᴥ ᵒʔ  ʕ ꆤ ᴥ ꆤʔ  ʕ ㅇ ᴥ ㅇʔ  ʕ≧ᴥ≦ʔ
ʕ ꈍᴥꈍʔ  ʕ ﹷ ᴥ ﹷʔ  ʕ´• ᴥ•̥`ʔ  ʕ ´•̥̥̥ ᴥ•̥̥̥`ʔ  ╲ʕ·ᴥ·　╲ʔ  ʕ•ᴥ•ʔﾉ♡  ʕ￫ᴥ￩　ʔ  ʕ – ᴥ – ʔ  ʕ˵ ̿ᴥ ̿˵ʔ
┬┴┬┴┤•ᴥ•ʔ├┬┴┬┴  ʕノ•ᴥ•ʔノ  ︵ ┻━┻
```

## 📄 License

See [LICENSE.md](LICENSE.md) for license information.

---

**Original Bear Blog**: [bearblog.dev](https://bearblog.dev) by [Herman Martinus](https://herman.bearblog.dev)
