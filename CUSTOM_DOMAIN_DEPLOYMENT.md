# Custom Domain Deployment Guide

This guide explains how to deploy BearBlog under your own domain name instead of `bearblog.dev`.

## 🎯 **Yes, You Can Deploy Under Any Domain!**

BearBlog has been updated to support custom domains through environment variables. The application is no longer tightly coupled to `bearblog.dev`.

## 🔧 **Required Configuration Changes**

### 1. **Environment Variables**

Update your `.env` file with your domain:

```bash
# Domain Configuration
MAIN_DOMAIN=yourdomain.com
MAIN_SITE_HOSTS=localhost,yourdomain.com

# Email Configuration  
EMAIL_HOST=smtp.eu.mailgun.org
EMAIL_HOST_USER=postmaster@mg.yourdomain.com
EMAIL_PORT=587
EMAIL_USE_TLS=True
```

### 2. **DNS Configuration**

Set up your DNS records:

- **A Record**: Point your domain to your Dokploy server IP
- **CNAME Record**: Point `www.yourdomain.com` to `yourdomain.com`
- **Wildcard**: `*.yourdomain.com` → `yourdomain.com` (for subdomains)

### 3. **Email Setup**

Configure your email provider (Mailgun, SendGrid, etc.):

```bash
EMAIL_HOST=smtp.yourmailgun.com
EMAIL_HOST_USER=postmaster@mg.yourdomain.com
EMAIL_HOST_PASSWORD=your-mailgun-password
```

## 🚀 **Dokploy Deployment Steps**

1. **Set Environment Variables in Dokploy:**
   - `MAIN_DOMAIN=yourdomain.com`
   - `MAIN_SITE_HOSTS=yourdomain.com`
   - `EMAIL_HOST=smtp.yourmailgun.com`
   - `EMAIL_HOST_USER=postmaster@mg.yourdomain.com`
   - All other required variables

2. **Deploy using production compose file:**
   ```bash
   docker-compose -f docker-compose.prod.yml up -d
   ```

3. **Run migrations:**
   ```bash
   docker-compose exec web python manage.py migrate
   ```

4. **Collect static files:**
   ```bash
   docker-compose exec web python manage.py collectstatic --noinput
   ```

## 🔍 **What Was Changed**

### **Core Configuration:**
- ✅ `MAIN_DOMAIN` environment variable
- ✅ `CSRF_TRUSTED_ORIGINS` now includes your domain
- ✅ Email addresses use your domain
- ✅ Protected subdomains include your domain

### **Domain Resolution:**
- ✅ `resolve_address()` function uses `MAIN_SITE_HOSTS`
- ✅ Subdomain detection works with your domain
- ✅ Custom domain support unchanged

### **Email Configuration:**
- ✅ From addresses use your domain
- ✅ SMTP settings configurable
- ✅ Admin emails use your domain

## 📋 **Optional: Template Updates**

The templates contain many references to `bearblog.dev` for documentation links. These are mostly external links and won't affect functionality, but you can update them if desired:

- Documentation links point to `docs.bearblog.dev`
- Example blog links point to `herman.bearblog.dev`
- These are informational only and don't affect core functionality

## 🛡️ **Security Considerations**

- ✅ CSRF protection works with your domain
- ✅ Email verification uses your domain
- ✅ SSL certificates should be configured for your domain
- ✅ Protected subdomains include your domain

## 🔧 **Testing Your Deployment**

1. **Main domain**: `https://yourdomain.com` (landing page)
2. **Subdomain**: `https://blogname.yourdomain.com` (user blogs)
3. **Custom domains**: `https://customdomain.com` (user custom domains)
4. **Admin**: `https://yourdomain.com/dashboard/`

## 📝 **Example Configuration**

For domain `myblogplatform.com`:

```bash
MAIN_DOMAIN=myblogplatform.com
MAIN_SITE_HOSTS=localhost,myblogplatform.com
EMAIL_HOST=smtp.eu.mailgun.org
EMAIL_HOST_USER=postmaster@mg.myblogplatform.com
EMAIL_PORT=587
EMAIL_USE_TLS=True
```

## ✅ **Verification Checklist**

- [ ] Main domain loads landing page
- [ ] Subdomains work for user blogs
- [ ] Email sending works with your domain
- [ ] CSRF protection works
- [ ] SSL certificates are valid
- [ ] DNS records are properly configured

## 🆘 **Troubleshooting**

### **Domain not resolving:**
- Check DNS records
- Verify `MAIN_SITE_HOSTS` includes your domain
- Check Dokploy environment variables

### **Email not working:**
- Verify SMTP credentials
- Check `EMAIL_HOST_USER` uses your domain
- Test SMTP connection

### **CSRF errors:**
- Ensure `CSRF_TRUSTED_ORIGINS` includes your domain
- Check HTTPS configuration

## 🎉 **You're Ready!**

Your BearBlog instance is now fully configured to work with your custom domain. Users can create blogs with subdomains like `username.yourdomain.com` and also use their own custom domains.

## 📝 **Note on Caddyfile**

The repository includes a `Caddyfile` that was used for the original bearblog.dev deployment. This file contains hardcoded references to `bearblog.dev` and would need to be updated if you want to use Caddy instead of Nginx. The Docker setup uses Nginx by default, which is already configured for custom domains. 